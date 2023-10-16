import 'package:aivoks_fantasy_app/custom_widgets/button_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/custom_text_fields.dart';
import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';

class BankDetailsPage extends StatefulWidget {
  const BankDetailsPage({super.key});

  @override
  State<BankDetailsPage> createState() => _BankDetailsPageState();
}

class _BankDetailsPageState extends State<BankDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: TextWidgets.customText(
              text: "Address Details",
              color: MyColors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w700),
          actions: [
            Image.asset("assets/icons/bell_icon.png", color: MyColors.white)
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              TextFieldsWidget.textFieldWidget('Your Name', 'Enter Full Name'),
              const SizedBox(height: 20),
              TextFieldsWidget.textFieldWidget(
                  'Account Number', 'Enter Bank A/c no.'),
              const SizedBox(height: 20),
              TextFieldsWidget.textFieldWidget(
                  'Confirm Account Number', 'Re-Enter Bank A/c no.'),
              const SizedBox(height: 20),
              TextFieldsWidget.textFieldWidget('IFSC Code', 'Enter IFSC Code'),
              const SizedBox(height: 20),
              TextFieldsWidget.textFieldWidget('Bank Name', 'Enter Bank Name'),
              const SizedBox(height: 20),
              TextFieldsWidget.textFieldWidget('Your State', 'Select State'),
              const SizedBox(height: 20),
              TextFieldsWidget.textFieldWidget('Your City', 'Select City'),
              const SizedBox(height: 20),
              ButtonWidgets.mainOutLinedButton(
                  onPressed: () {}, buttonText: 'UPLOAD BANK PROOF'),
              const SizedBox(height: 20),
              ButtonWidgets.mainButton(
                  onPressed: () {},
                  buttonText: 'update'.toUpperCase(),
                  isLoading: false),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
