import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:masked_text_field/masked_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'text_widgets.dart';

class TextFieldsWidget {
  static Widget textFieldWidget(String hinText, String labelText,
      {Widget? suffixIcon,
      final FormFieldValidator<String>? validator,
      final List<TextInputFormatter>? inputFormatters}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets.customText(
            text: labelText,
            color: MyColors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w600),
        const SizedBox(height: 5),
        TextFormField(
          validator: validator,
          keyboardType: TextInputType.emailAddress,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            errorMaxLines: 3,
            counterText: "",
            filled: true,
            fillColor: Colors.white,
            hintText: hinText,
            suffixIcon: suffixIcon,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xffE5E5E5),
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xffE5E5E5),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xffE5E5E5),
              ),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
              ),
            ),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                )),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget textFieldWidgetWithoutHintText(
    String labelText, {
    Widget? suffixIcon,
    final FormFieldValidator<String>? validator,
    final List<TextInputFormatter>? inputFormatters,
    final TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets.customText(
            text: labelText,
            color: MyColors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w600),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: keyboardType,
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            errorMaxLines: 3,
            counterText: "",
            filled: true,
            fillColor: Colors.white,
            suffixIcon: suffixIcon,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xffE5E5E5),
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xffE5E5E5),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xffE5E5E5),
              ),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
              ),
            ),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                )),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget textFieldForAdhar(
      TextEditingController controller, String labelText, String hintText,
      {Widget? suffixIcon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets.customText(
            text: labelText,
            color: MyColors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w600),
        const SizedBox(height: 5),
        Container(
          height: 55,
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.grey),
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: MaskedTextField(
            maxLength: 14,
            textFieldController: controller,
            inputDecoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 11, top: 14, bottom: 20),
                counterText: "",
                hintText: 'xxxx xxxx xxxx',
                border: InputBorder.none),
            autofocus: true,
            mask: 'xxxx xxxx xxxx',
            keyboardType: TextInputType.number,
            onChange: (String value) {
              print(value);
            },
          ),
        ),
      ],
    );
  }

  static Widget textFieldForPAN(
      TextEditingController controller, String labelText, String hintText,
      {Widget? suffixIcon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets.customText(
            text: labelText,
            color: MyColors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w600),
        const SizedBox(height: 5),
        Container(
          height: 55,
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.grey),
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: MaskedTextField(
            maxLength: 10,
            textFieldController: controller,
            inputDecoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 11, top: 10, bottom: 14),
                counterText: "",
                hintText: 'xxxxxxxxxx',
                border: InputBorder.none),
            autofocus: true,
            mask: 'xxxxxxxxxx',
            keyboardType: TextInputType.emailAddress,
            onChange: (String value) {
              print(value);
            },
          ),
        ),
      ],
    );
  }

  static Widget calenderTextFieldWidget(String text, {void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidgets.customText(
              text: 'Date of Birth as on Aadhaar*',
              color: MyColors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w600),
          const SizedBox(height: 5),
          Container(
            height: 55,
            decoration: BoxDecoration(
              color: MyColors.white,
              border: Border.all(color: MyColors.grey.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 11, top: 10, bottom: 14, right: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidgets.customText(
                      text: text,
                      color: MyColors.grey2,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400),
                  const Icon(
                    Icons.calendar_month,
                    color: MyColors.grey3,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget otpTextFormField(BuildContext context,
      TextEditingController controller, final ValueChanged onChanged,
      {final FormFieldValidator<String>? validator, FocusNode? focusNode}) {
    return PinCodeTextField(
      appContext: context,
      controller: controller,
      length: 6,
      keyboardType: TextInputType.number,
      cursorColor: MyColors.mainRed,
      //focusNode: _nodeText1,
      /* inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(FilterTextField.allowNumbers)),
              FilteringTextInputFormatter.deny(
                  RegExp(FilterTextField.removeEmoji))
            ],*/
      textStyle: const TextStyle(color: MyColors.black, fontSize: 16.0),
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(2),
          borderWidth: 1,
          fieldHeight: 45,
          fieldWidth: 45,
          activeColor: MyColors.mainRed,
          errorBorderColor: MyColors.removeRed,
          inactiveFillColor: MyColors.mainRed,
          inactiveColor: MyColors.mainRed,
          selectedFillColor: MyColors.mainRed,
          selectedColor: MyColors.mainRed),
      onChanged: onChanged,
    );
  }

  static mobileNumberTextFieldWidget(
      TextEditingController controller, String hintText,
      {final FormFieldValidator<String>? validator,
      final List<TextInputFormatter>? inputFormatters}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets.customText(
            text: 'Mobile Number',
            color: MyColors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w600),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: MyColors.white,
                  border: Border.all(color: Colors.grey.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      const Text("+91")
                          .paddingSymmetric(horizontal: 8, vertical: 0),
                      const VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                      ).paddingSymmetric(vertical: 10, horizontal: 0),
                      Expanded(
                        child: TextFormField(
                          controller: controller,
                          keyboardType: TextInputType.phone,
                          validator: validator,
                          inputFormatters: inputFormatters,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: hintText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
