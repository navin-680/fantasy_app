import 'dart:async';
import 'package:aivoks_fantasy_app/custom_widgets/button_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/custom_text_fields.dart';
import 'package:aivoks_fantasy_app/custom_widgets/rich_text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:aivoks_fantasy_app/res/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
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
      backgroundColor: Colors.white,
      body: _mainBody(),
      bottomNavigationBar: _bottomButton(),
    );
  }

  Widget _mainBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: InkWell(
              onTap: () {
                print("back pressed");
                Get.back();
              },
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.arrow_back, color: MyColors.grey2),
              ),
            ),
          ),
          Image.asset("assets/images/otp_image.png"),
          SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Verify Otp",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                const Text("We’ve sent an OTP to +917982XX8043",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextFieldsWidget.otpTextFormField(
                    context, _otpController, (value) => _onChangedOTP(value)),
                _resendOtpTextWidget()
              ],
            ),
          ).paddingSymmetric(horizontal: 32, vertical: 0),
        ],
      ).paddingOnly(top: 40),
    );
  }

  Widget _resendOtpTextWidget() {
    return InkWell(
      onTap: timeValue == 0
          ? () {
              _handleStartTimer();
              _resendCode();
            }
          : null,
      child: RichTextsWidget.richText(
          text1: "Resend OTP ",
          text2: "  in 0:${timeValue}s",
          color1: MyColors.blueColor,
          color2: MyColors.grey2),
    );
  }

  Widget _bottomButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ButtonWidgets.mainButton(
          onPressed: otp != "" && otp.length > 5
              ? () {
                  _navigateToHomeScreen();
                }
              : () {},
          buttonText: StringConstants().enterOtp.toUpperCase(),
          isLoading: false),
    );
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
      _otpController.clear();
    });
  }

  _resendCode() async {}

  _navigateToHomeScreen() {
    Get.offNamed("landing");
  }
}
