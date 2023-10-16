import 'package:aivoks_fantasy_app/custom_widgets/button_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EKycSuccessAndFailedPage extends StatefulWidget {
  const EKycSuccessAndFailedPage({super.key});

  @override
  State<EKycSuccessAndFailedPage> createState() =>
      _EKycSuccessAndFailedPageState();
}

class _EKycSuccessAndFailedPageState extends State<EKycSuccessAndFailedPage> {
  @override
  Widget build(BuildContext context) {
    String _result = 'success';

    return Scaffold(
        bottomNavigationBar: _result == 'success'
            ? _backTOHomeButtonWidget()
            : _contactSupportButtonWidget(),
        body: Column(
          children: [
            _result == 'success'
                ? _successContainerWidget()
                : _failedContainerWidget(),
            _result == 'success' ? Container() : _failedNoteTextWidget()
          ],
        ));
  }

  Widget _eKycSuccessTextWidget() {
    return TextWidgets.customText(
        text: "eKYC Successful",
        color: MyColors.white,
        fontSize: 24.0,
        fontWeight: FontWeight.w700);
  }

  Widget _eKycFailedTextWidget() {
    return TextWidgets.customText(
        text: "eKYC Failed",
        color: MyColors.white,
        fontSize: 24.0,
        fontWeight: FontWeight.w700);
  }

  Widget _failedNoteTextWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        TextWidgets.customText(
            text:
                "Make sure you entered all the fields mentioned\nas on your Aadhaar exactly as on your Aadhaar\nCard.",
            color: MyColors.grey,
            fontSize: 14.0,
            fontWeight: FontWeight.w500),
      ],
    );
  }

  Widget _backTOHomeButtonWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: ButtonWidgets.mainButton(
          onPressed: () {
            //Get.toNamed('eKycSuccessAndFailedPage');
          },
          buttonText: "back to home".toUpperCase(),
          isLoading: false),
    );
  }

  Widget _contactSupportButtonWidget() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ButtonWidgets.mainOutLinedButton(
            onPressed: () {
              //Get.toNamed('eKycSuccessAndFailedPage');
            },
            buttonText: "contact support".toUpperCase()));
  }

  _successContainerWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      width: double.infinity,
      color: MyColors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/success_icon.png'),
          const SizedBox(height: 30),
          _eKycSuccessTextWidget(),
        ],
      ),
    );
  }

  _failedContainerWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      width: double.infinity,
      color: MyColors.orangeColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/failed_icon.png'),
          const SizedBox(height: 30),
          _eKycFailedTextWidget()
        ],
      ),
    );
  }
}
