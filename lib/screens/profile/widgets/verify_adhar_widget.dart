import 'dart:async';

import 'package:aivoks_fantasy_app/custom_widgets/button_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/custom_text_fields.dart';
import 'package:aivoks_fantasy_app/custom_widgets/rich_text_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyAdharWidget extends StatefulWidget {
  const VerifyAdharWidget({super.key});

  @override
  State<VerifyAdharWidget> createState() => _VerifyAdharWidgetState();
}

class _VerifyAdharWidgetState extends State<VerifyAdharWidget> {
  final TextEditingController _controller = TextEditingController();

  String otp = '';

  Timer? _timer;

  int timeValue = 30;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }

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
            _verifyAdharHeadTextColumnWidget(),
            const SizedBox(height: 60),
            _otpTextFormField(
                context, _controller, (value) => _onChangedOTP(value)),
            const SizedBox(height: 10),
            _resendOtpTextWidget(),
            const Spacer(),
            _verifyButtonWidget(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _verifyAdharHeadTextColumnWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets.customText(
            text: 'Verify Aadhaar',
            color: MyColors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w700),
        const SizedBox(height: 10),
        TextWidgets.customText(
            text:
                'A 6-digit OTP has been sent you mobile number\nregistered with your Aadhaar Card',
            color: MyColors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
      ],
    );
  }

  Widget _verifyButtonWidget() {
    return ButtonWidgets.mainButton(
        onPressed: () {
          Get.toNamed('eKycSuccessAndFailedPage');
        },
        buttonText: "Verify",
        isLoading: false);
  }

  _onChangedOTP(String value) {
    setState(() {
      otp = value;
    });
  }

  _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (timeValue == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          timeValue--;
        });
      }
    });
  }

  _handleStartTimer() {
    _startTimer();
    setState(() {
      timeValue = 30;
      _controller.clear();
    });
  }

  _resendCode() async {}

  _navigateToHomeScreen() {
    //Get.offNamed("landing");
  }

  Widget _resendOtpTextWidget() {
    return InkWell(
      onTap: timeValue == 0
          ? () {
              _handleStartTimer();
              _resendCode();
            }
          : null,
      child: Center(
        child: RichTextsWidget.richText(
            text1: "Resend OTP ",
            text2: "  in 0:${timeValue}s",
            color1: MyColors.blueColor,
            color2: MyColors.grey2),
      ),
    );
  }

  Widget _otpTextFormField(BuildContext context,
      TextEditingController controller, final ValueChanged onChanged,
      {final FormFieldValidator<String>? validator, FocusNode? focusNode}) {
    return PinCodeTextField(
      appContext: context,
      controller: controller,
      length: 6,
      keyboardType: TextInputType.number,
      cursorColor: MyColors.mainRed,
      textStyle: const TextStyle(color: MyColors.black, fontSize: 16.0),
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(2),
          borderWidth: 1,
          fieldHeight: 45,
          fieldWidth: 45,
          activeColor: MyColors.grey,
          errorBorderColor: MyColors.grey,
          inactiveFillColor: MyColors.grey,
          inactiveColor: MyColors.grey,
          selectedFillColor: MyColors.grey,
          selectedColor: MyColors.grey),
      onChanged: onChanged,
    );
  }
}
