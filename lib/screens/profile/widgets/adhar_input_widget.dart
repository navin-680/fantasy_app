import 'package:aivoks_fantasy_app/custom_widgets/button_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/custom_text_fields.dart';
import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdharInputWidget extends StatefulWidget {
  const AdharInputWidget({super.key});

  @override
  State<AdharInputWidget> createState() => _AdharInputWidgetState();
}

class _AdharInputWidgetState extends State<AdharInputWidget> {
  final TextEditingController _adharController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, actions: [
        Image.asset("assets/icons/bell_icon.png", color: MyColors.white)
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            _adharHeadTextColumnWidget(),
            const SizedBox(height: 60),
            TextFieldsWidget.textFieldForAdhar(
                _adharController, 'Aadhaar Number*', 'Enter Aadhaar Number'),
            const Spacer(),
            _nextButtonForPersonalInfoWidget(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _adharHeadTextColumnWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets.customText(
            text: 'Aadhaar No.',
            color: MyColors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w700),
        const SizedBox(height: 10),
        TextWidgets.customText(
            text:
                'Enter your Aadhaar number to authenticate and\nOTP will be send to the mobile number\nregistered with your Aadhaar.',
            color: MyColors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
      ],
    );
  }

  Widget _nextButtonForPersonalInfoWidget() {
    return ButtonWidgets.mainButton(
        onPressed: () {
          Get.toNamed('verifyAdharWidget');
        },
        buttonText: "Next",
        isLoading: false);
  }
}
