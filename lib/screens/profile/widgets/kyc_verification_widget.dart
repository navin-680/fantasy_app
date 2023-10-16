import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KycVerificationPage extends StatefulWidget {
  const KycVerificationPage({super.key});

  @override
  State<KycVerificationPage> createState() => _KycVerificationPageState();
}

class _KycVerificationPageState extends State<KycVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset("assets/images/kyc_image.png",
            fit: BoxFit.cover, width: double.infinity),
        const SizedBox(height: 30),
        _containerWithBorderWidget(
            "assets/icons/mobile_kyc.png", 'Mobile No.', '7982868043'),
        const SizedBox(height: 16),
        _containerWithBorderWidget("assets/icons/mobile_kyc.png", 'Email ID',
            'dilipkumardhruv9@gmail.com'),
        const SizedBox(height: 16),
        _containerWithBorderWidget("assets/icons/adhar_icon.png", 'Aadhaar',
            'Verify to play cash games', onTap: () {
          Get.toNamed('adharInputPage');
        }),
        const SizedBox(height: 16),
        _containerWithBorderWidget(
            "assets/icons/pan_icon.png", 'Pan Card', 'Verify to withdraw',
            onTap: () {
          Get.toNamed('verifyPanPage');
        }),
        const SizedBox(height: 16),
        _containerWithBorderWidget(
            "assets/icons/pan_icon.png", 'Bank Account', 'Verify Bank A/C',
            onTap: () {
          Get.toNamed('bankDetailsPage');
        }),
        const SizedBox(height: 16),
        _furtherAssistanceTextWidget()
      ],
    );
  }

  Widget _containerWithBorderWidget(
      String iconText, String titleText, String valueText,
      {void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.grey),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(iconText),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidgets.customText(
                        text: titleText,
                        color: MyColors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                    TextWidgets.customText(
                        text: valueText,
                        color: MyColors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400),
                  ],
                )
              ],
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                decoration: BoxDecoration(
                    color: MyColors.green,
                    borderRadius: BorderRadius.circular(2)),
                child: TextWidgets.customText(
                    text: 'VERIFY',
                    color: MyColors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }

  _furtherAssistanceTextWidget() {
    return Center(
      child: TextWidgets.customText(
          text:
              'For further assistance or any other queries\nplease reach out to Support team.',
          color: MyColors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w400),
    );
  }
}
