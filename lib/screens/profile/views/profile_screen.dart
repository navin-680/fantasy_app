import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Image.asset("assets/icons/bell_icon.png", color: MyColors.white)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _profileNameCardWidget(),
            const SizedBox(height: 20),
            _profileWalletKycBorderedItemContainer(),
            const SizedBox(height: 20),
            _yourStaticsTextWidget(),
            const SizedBox(height: 15),
            _statisticsBorderedContainer(
                '12', 'Contests Won', '127', 'Total Contests'),
            const SizedBox(height: 20),
            _statisticsBorderedContainer('46', 'Matches', '46', 'Series'),
            const SizedBox(height: 20),
            _referPushRewardBorderedItemContainer(),
            const SizedBox(height: 20),
            _aboutHelpAndSupportBorderedItemContainer(),
            const SizedBox(height: 20),
            _rateUsAmdAppUpdateBorderedItemContainer(),
            const SizedBox(height: 20),
            _logOutBorderedItemContainer(),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget _profileNameCardWidget() {
    return Container(
      height: 122,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.blueGrey.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 0))
      ]),
      child: Row(
        children: [
          const SizedBox(width: 15),
          _profileImageCircularContainer(),
          const SizedBox(width: 10),
          _profileNameEmailColumnWidget()
        ],
      ),
    );
  }

  Widget _profileImageCircularContainer() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          height: 100,
          width: 100,
          child: Container(
            padding: const EdgeInsets.all(4),
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: MyColors.grey)),
            child: Container(
              height: 85,
              width: 85,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset("assets/images/dp.png"),
            ),
          ),
        ),
        Positioned(
            bottom: -0,
            right: -5,
            child: GestureDetector(
                onTap: () {},
                child:
                    Image.asset('assets/icons/blue_edit_icon.png', height: 45)))
      ],
    );
  }

  Widget _profileNameEmailColumnWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 4),
        Row(
          children: [
            TextWidgets.customText(
                text: "Dilip Kumar Dhruv",
                color: MyColors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w700),
            const SizedBox(width: 10),
            Image.asset("assets/icons/verify.png"),
          ],
        ),
        const SizedBox(height: 10),
        TextWidgets.customText(
            text: "8800XXXX6744",
            color: MyColors.paragraph,
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
        TextWidgets.customText(
            text: "dilipkumardhruv9@gmail.com",
            color: MyColors.paragraph,
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
      ],
    );
  }

  Widget _profileWalletKycBorderedItemContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          decoration: _boxDecoration(),
          child: Column(
            children: [
              _profileWalletKycRow(
                  'Your Profile', 'assets/icons/profile_icon.png', onTap: () {
                Get.toNamed('editProfilePage');
              }),
              Container(height: 1, color: MyColors.grey6),
              _profileWalletKycRow('My Wallet', 'assets/icons/wallet_icon.png'),
              Container(height: 1, color: MyColors.grey6),
              _profileWalletKycRow(
                  'Verify KYC', 'assets/icons/verify_kyc_icon.png'),
              Container(height: 1, color: MyColors.grey6),
              _profileWalletKycRow(
                  'Join Contest', 'assets/icons/contest_icon.png'),
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
            Row(children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    color: MyColors.grey6,
                    borderRadius: BorderRadius.circular(4)),
                child: Center(child: Image.asset(iconText, height: 24)),
              ),
              const SizedBox(width: 10),
              TextWidgets.customText(
                  text: text,
                  color: MyColors.paragraph,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600),
            ]),
            const Icon(Icons.arrow_forward_ios, color: MyColors.grey7)
          ],
        ),
      ),
    );
  }

  Widget _yourStaticsTextWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextWidgets.customText(
          text: 'Your Statistics',
          color: MyColors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w700),
    );
  }

  Widget _statisticsBorderedContainer(
      String text1, String text2, String text3, String text4) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 0))
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                child: _statisticsBorderedColumnText(text1, text2),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 0))
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                child: _statisticsBorderedColumnText(text3, text4),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _statisticsBorderedColumnText(String text1, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets.customText(
            text: text1,
            color: MyColors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w700),
        const SizedBox(height: 6),
        TextWidgets.customText(
            text: text2,
            color: MyColors.paragraph,
            fontSize: 14.0,
            fontWeight: FontWeight.w500),
      ],
    );
  }

  Widget _referPushRewardBorderedItemContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          decoration: _boxDecoration(),
          child: Column(
            children: [
              _profileWalletKycRow(
                  'Refer &Earn', 'assets/icons/refer_icon.png'),
              Container(height: 1, color: MyColors.grey6),
              _profileWalletKycRow('Push Notification',
                  'assets/icons/push_notification_icon.png'),
              Container(height: 1, color: MyColors.grey6),
              _profileWalletKycRow(
                  'Rewards & Bonus', 'assets/icons/rewards_icon.png')
            ],
          )),
    );
  }

  Widget _aboutHelpAndSupportBorderedItemContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          decoration: _boxDecoration(),
          child: Column(
            children: [
              _profileWalletKycRow(
                  'About Aivoks', 'assets/icons/about_icon.png', onTap: () {
                Get.toNamed('aboutProfileWidget');
              }),
              Container(height: 1, color: MyColors.grey6),
              _profileWalletKycRow(
                  'Help & Support', 'assets/icons/help_support_icon.png')
            ],
          )),
    );
  }

  Widget _rateUsAmdAppUpdateBorderedItemContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          decoration: _boxDecoration(),
          child: Column(
            children: [
              _profileWalletKycRow('Rate Us', 'assets/icons/rateus_icon.png'),
              Container(height: 1, color: MyColors.grey6),
              _profileWalletKycRow('App Update', 'assets/icons/update_icon.png')
            ],
          )),
    );
  }

  Widget _logOutBorderedItemContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          decoration: _boxDecoration(),
          child:
              _profileWalletKycRow('Logout', 'assets/icons/logout_icon.png')),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: MyColors.white,
        /*border: Border.all(width: 0.2, color: MyColors.blueGrey.withOpacity(0.5))*/
        boxShadow: [
          BoxShadow(
              color: Colors.blueGrey.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 0))
        ]);
  }
}
