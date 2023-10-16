import 'package:aivoks_fantasy_app/custom_widgets/custom_text_fields.dart';
import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:aivoks_fantasy_app/utils/filter_textfields.dart';
import 'package:aivoks_fantasy_app/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PersonalInfoWidget extends StatefulWidget {
  const PersonalInfoWidget({super.key});

  @override
  State<PersonalInfoWidget> createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget> {
  String? selectedGender;
  String _dobDate = 'Enter Date of Birth (DOB)';
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _personalInfoTextColumnWidget(),
          const SizedBox(height: 30),
          TextFieldsWidget.textFieldWidget("Enter Full Name", 'Your Name*',
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(FilterTextField.allowCharacterWithSpace)),
                FilteringTextInputFormatter.deny(
                    RegExp(FilterTextField.removeEmoji))
              ]),
          const SizedBox(height: 20),
          TextFieldsWidget.calenderTextFieldWidget(_dobDate,
              onTap: () => _selectDate(context)),
          const SizedBox(height: 20),
          _genderSelectionRadioWidget(),
          const SizedBox(height: 20),
          TextFieldsWidget.mobileNumberTextFieldWidget(
              _mobileController, 'Enter Mobile Number',
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(FilterTextField.allowNumbers)),
                FilteringTextInputFormatter.deny(
                    RegExp(FilterTextField.removeEmoji))
              ]),
          const SizedBox(height: 20),
          TextFieldsWidget.textFieldWidget("Enter Email ID", 'Email ID',
              validator: Validator.validateEmail),
        ],
      ),
    );
  }

  Widget _personalInfoTextColumnWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets.customText(
            text: 'Personal Info',
            color: MyColors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w700),
        const SizedBox(height: 10),
        TextWidgets.customText(
            text: 'Enter your  personal information as on your\nAadhar card',
            color: MyColors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
      ],
    );
  }

  Widget _genderSelectionRadioWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets.customText(
            text: 'Select Gender*',
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
            padding:
                const EdgeInsets.only(left: 11, top: 10, bottom: 14, right: 9),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  Radio(
                    activeColor: MyColors.mainRed,
                    visualDensity: const VisualDensity(horizontal: -4.0),
                    value: "Male",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  const Text("Male"),
                  const SizedBox(width: 10),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  const SizedBox(width: 10),
                  Radio(
                    activeColor: MyColors.mainRed,
                    visualDensity: const VisualDensity(horizontal: -4.0),
                    value: "Female",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  const Text("Female"),
                  const SizedBox(width: 10),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  const SizedBox(width: 10),
                  Radio(
                    activeColor: MyColors.mainRed,
                    visualDensity: const VisualDensity(horizontal: -4.0),
                    value: "Other",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  const Text("Other"),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: MyColors.mainRed,
                onPrimary: MyColors.white,
                onSurface: MyColors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                primary: MyColors.mainRed, // button text color
              ))),
          child: child!,
        );
      },
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        DateTime dateTime = picked;
        String formattedDate = DateFormat('dd-MMM-yyyy').format(dateTime);
        _dobDate = formattedDate.toString();
      });
      print("Selected date: ${picked.toString()}");
    }
  }
}
