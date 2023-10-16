import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';

class AboutProfileWidget extends StatefulWidget {
  const AboutProfileWidget({super.key});

  @override
  State<AboutProfileWidget> createState() => _AboutProfileWidgetState();
}

class _AboutProfileWidgetState extends State<AboutProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, actions: [
        Image.asset("assets/icons/bell_icon.png", color: MyColors.white)
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _aivoksPolicyFAQPrivacyReferralBorderedItemContainer()
        ],
      ),
    );
  }

  Widget _aivoksPolicyFAQPrivacyReferralBorderedItemContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          decoration: _boxDecoration(),
          child: Column(
            children: [
              _profileWalletKycRow(
                  'Aivoks Policy', 'assets/icons/profile_icon.png'),
              const Divider(height: 1, color: MyColors.grey3),
              _profileWalletKycRow('FAQ', 'assets/icons/profile_icon.png'),
              const Divider(height: 1, color: MyColors.grey3),
              _profileWalletKycRow('Privacy Policies & Legalities',
                  'assets/icons/profile_icon.png'),
              const Divider(height: 1, color: MyColors.grey3),
              _profileWalletKycRow(
                  'Referral Policies', 'assets/icons/profile_icon.png'),
              const Divider(height: 1, color: MyColors.grey3),
              _profileWalletKycRow(
                  'Terms & Conditions', 'assets/icons/profile_icon.png'),
              const Divider(height: 1, color: MyColors.grey3),
              _profileWalletKycRow(
                  'Withdrawals Policies', 'assets/icons/profile_icon.png'),
            ],
          )),
    );
  }

  Widget _profileWalletKycRow(String text, String iconText,
      {void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidgets.customText(
                text: text,
                color: MyColors.paragraph,
                fontSize: 14.0,
                fontWeight: FontWeight.w600),
            const Icon(Icons.arrow_forward_ios, color: MyColors.grey7)
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: MyColors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.blueGrey.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 0))
        ]);
  }
}
