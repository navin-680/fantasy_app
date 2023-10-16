import 'package:aivoks_fantasy_app/custom_widgets/button_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/custom_bottom_sheet.dart';
import 'package:aivoks_fantasy_app/custom_widgets/rich_text_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:aivoks_fantasy_app/screens/create_team/widgets/captain_vice_captain_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaptainViceCaptainListPage extends StatefulWidget {
  const CaptainViceCaptainListPage({super.key});

  @override
  State<CaptainViceCaptainListPage> createState() =>
      _CaptainViceCaptainListPageState();
}

class _CaptainViceCaptainListPageState
    extends State<CaptainViceCaptainListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _bottomRowButtonsWidget(),
        appBar: _appBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/cap_img.png', fit: BoxFit.cover),
            _makeYourTeamTextRowWidget(),
            const Divider(height: 1, color: MyColors.grey),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: CaptainViceCaptainCardWidget(),
                    );
                  }),
            )
          ],
        ));
  }

  _appBar() {
    return AppBar(
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back, color: MyColors.white)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              TextWidgets.customText(
                  text: 'IND',
                  color: MyColors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700),
              const SizedBox(width: 10),
              Image.asset("assets/icons/black_vs.png", height: 12),
              const SizedBox(width: 10),
              TextWidgets.customText(
                  text: 'PAK',
                  color: MyColors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700),
            ],
          ),
          const SizedBox(height: 8),
          TextWidgets.customText(
              text: 'Today | 11:00 PM',
              color: MyColors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.w600),
          const SizedBox(height: 10),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () => _showFullWidthBottomSheet(context),
          child: Container(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset("assets/icons/help_icon.png", width: 30)),
        )
      ],
    );
  }

  _showFullWidthBottomSheet(BuildContext context) {
    showModalBottomSheet(
        enableDrag: false,
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return const CustomBottomSheetWidget();
        });
  }

  Widget _makeYourTeamTextRowWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichTextsWidget.richText(
              text1: "Make your",
              text2: ' 11 team',
              color1: MyColors.black,
              color2: MyColors.mainRed,
              fontSize1: 12.0,
              fontWeight1: FontWeight.w600,
              fontSize2: 12.0,
              fontWeight2: FontWeight.w600),
          Row(
            children: [
              TextWidgets.customText(
                  text: "% C BY",
                  color: MyColors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600),
              const SizedBox(width: 50),
              TextWidgets.customText(
                  text: "% VC BY",
                  color: MyColors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600)
            ],
          )
        ],
      ),
    );
  }

  _bottomRowButtonsWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
      child: ButtonWidgets.rowButtons(
          onPressed1: () {},
          onPressed2: () {
            Get.toNamed('myTeamsScreen');
          },
          buttonText1: "preview".toUpperCase(),
          buttonText2: "Save".toUpperCase(),
          color1: MyColors.black.withOpacity(0.7),
          color2: MyColors.green),
    );
  }
}
