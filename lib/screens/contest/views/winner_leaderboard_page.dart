import 'package:aivoks_fantasy_app/custom_widgets/button_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:aivoks_fantasy_app/screens/contest/widgets/contest_match_card_widget.dart';
import 'package:aivoks_fantasy_app/screens/contest/widgets/vs_team_card.dart';
import 'package:flutter/material.dart';

class WinnerLeaderBoardPage extends StatefulWidget {
  const WinnerLeaderBoardPage({super.key});

  @override
  State<WinnerLeaderBoardPage> createState() => _WinnerLeaderBoardPageState();
}

class _WinnerLeaderBoardPageState extends State<WinnerLeaderBoardPage> {
  bool _winnerTabTapped = true;
  bool _leaderBoardTabTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextWidgets.customText(
                    text: 'WEF',
                    color: MyColors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700),
                Image.asset("assets/images/vs.png", color: MyColors.white),
                TextWidgets.customText(
                    text: 'TRT',
                    color: MyColors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700),
              ],
            ),
            TextWidgets.customText(
                text: '1h 20m 16s Left',
                color: MyColors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.w600),
          ],
        ),
        actions: [
          Image.asset("assets/icons/bell_icon.png", color: MyColors.white)
        ],
      ),
      bottomNavigationBar: _bottomButtonWidget(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: 16),
                VsTeamsCardWidget(),
                SizedBox(height: 16),
                ContestMatchCardWidget(),
                SizedBox(height: 16),
              ],
            ),
          ),
          _winnerLeaderBoardTabContainer(),
          _rankAmountParticipatedTeamsGreyContainer(),
          _winnerTabTapped
              ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      //physics: const NeverScrollableScrollPhysics(),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return _rankAmountRowWidget('#Rank 1', '₹2,00,000');
                      }),
                )
              : _participatedTeamsWidget(
                  "assets/images/Image-60.png", 'Angela Bower')
        ],
      ),
    );
  }

  Widget _rankAmountRowWidget(String text1, String text2) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: MyColors.grey3))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidgets.customText(
              text: text1,
              color: MyColors.black,
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center),
          TextWidgets.customText(
              text: text2,
              color: MyColors.black,
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _participatedTeamsWidget(String iconText, String text2) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: MyColors.grey3))),
      child: Row(
        children: [
          Image.asset(iconText),
          const SizedBox(width: 15),
          TextWidgets.customText(
              text: text2,
              color: MyColors.black,
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _iconTextRow(String iconText, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(iconText),
        const SizedBox(width: 8),
        TextWidgets.customText(
            text: text,
            color: MyColors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center),
      ],
    );
  }

  Widget _winnerLeaderBoardTabContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 1))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 12),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _winnerTabTapped = true;
                    _leaderBoardTabTapped = false;
                  });
                },
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                        child: _iconTextRow(
                            "assets/icons/victory_icon.png", 'Winner'))),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _winnerTabTapped = false;
                    _leaderBoardTabTapped = true;
                  });
                },
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                        child: _iconTextRow(
                            "assets/icons/leader_icon.png", 'Leaderboard'))),
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                height: 2,
                width: MediaQuery.of(context).size.width / 2,
                color: _winnerTabTapped ? MyColors.mainRed : Colors.transparent,
              ),
              Container(
                height: 2,
                width: MediaQuery.of(context).size.width / 2,
                color: _leaderBoardTabTapped
                    ? MyColors.mainRed
                    : Colors.transparent,
              )
            ],
          )
        ],
      ),
    );
  }

  _rankAmountParticipatedTeamsGreyContainer() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        height: 40,
        width: double.infinity,
        color: MyColors.activityCardColor,
        child: Row(
          mainAxisAlignment: _winnerTabTapped
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            _winnerTabTapped
                ? TextWidgets.customText(
                    text: 'Rank',
                    color: MyColors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center)
                : TextWidgets.customText(
                    text: "Participated Teams",
                    color: MyColors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start),
            _winnerTabTapped
                ? TextWidgets.customText(
                    text: 'Amount',
                    color: MyColors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center)
                : Container(),
          ],
        ));
  }

  _bottomButtonWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ButtonWidgets.joinButton(
          onPressed: () {}, buttonText: "₹41 Join Now", isLoading: false),
    );
  }
}
