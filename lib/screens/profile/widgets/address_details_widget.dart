import 'package:aivoks_fantasy_app/custom_widgets/custom_text_fields.dart';
import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:aivoks_fantasy_app/utils/filter_textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressDetailsWidget extends StatefulWidget {
  const AddressDetailsWidget({super.key});

  @override
  State<AddressDetailsWidget> createState() => _AddressDetailsWidgetState();
}

class _AddressDetailsWidgetState extends State<AddressDetailsWidget> {
  List<String> locations = ['A', 'B', 'C', 'D'];
  String? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _addressDetailsTextColumnWidget(),
          const SizedBox(height: 30),
          TextFieldsWidget.textFieldWidgetWithoutHintText('Address line 1*'),
          const SizedBox(height: 25),
          TextFieldsWidget.textFieldWidgetWithoutHintText('Address line 2'),
          const SizedBox(height: 25),
          TextFieldsWidget.textFieldWidgetWithoutHintText('Town / City*'),
          const SizedBox(height: 25),
          /*TextFieldsWidget.textFieldWidgetWithoutHintText('State*',
              suffixIcon: _dropDownWidget()),*/
          _dropDownWidget(),
          const SizedBox(height: 25),
          TextFieldsWidget.textFieldWidgetWithoutHintText('PIN Code*',
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(FilterTextField.allowNumbers)),
                FilteringTextInputFormatter.deny(
                    RegExp(FilterTextField.removeEmoji))
              ]),
        ],
      ),
    );
  }

  Widget _addressDetailsTextColumnWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets.customText(
            text: 'Address Details',
            color: MyColors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w700),
        const SizedBox(height: 10),
        TextWidgets.customText(
            text: 'Enter your  address details as on your\nAadhar card',
            color: MyColors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
      ],
    );
  }

  _dropDownWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets.customText(
            text: "State*",
            color: MyColors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w600),
        const SizedBox(height: 5),
        Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: DropdownButton(
            isExpanded: true,
            underline: Container(),
            value: _selectedLocation,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation = newValue;
              });
            },
            items: locations.map((location) {
              return DropdownMenuItem(
                value: location,
                child: Text(location),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
