import 'package:aivoks_fantasy_app/screens/home/views/widgets/matches_card_widget.dart';
import 'package:aivoks_fantasy_app/screens/my_matches/views/widgets/complete_match_card_widget.dart';
import 'package:aivoks_fantasy_app/screens/my_matches/views/widgets/live_match_card_widget.dart';
import 'package:aivoks_fantasy_app/screens/my_matches/views/widgets/upcoming_match_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_widgets/text_widgets.dart';
import '../../../res/my_colors.dart';
import '../../contest/widgets/contest_match_card_widget.dart';
import '../../contest/widgets/vs_team_card.dart';

class MyMatchesScreen extends StatefulWidget {
  const MyMatchesScreen({super.key});

  @override
  State<MyMatchesScreen> createState() => _MyMatchesScreenState();
}

class _MyMatchesScreenState extends State<MyMatchesScreen> {
  bool _upcomingTabTapped = true;
  bool _liveTabTapped = false;
  bool _completedTabTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text("My Matches"),
        actions: [
          Image.asset("assets/icons/bell_icon.png", color: MyColors.white)
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
                height: 40,
                decoration: _boxDecoration(),
                child: _selectedTabsRowContainer(
                    "Upcoming", "Live", "Completed")),
            const SizedBox(height: 16),
            _upcomingTabTapped?const UpcomingMatches():_liveTabTapped?const LiveMatches():const CompletedMatches()

          ],
        ),
      ),
    );
  }


  Widget _selectedTabsRowContainer(String text1, String text2, String text3) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                _upcomingTabTapped = true;
                _liveTabTapped = false;
                _completedTabTapped = false;
              });
            }, splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                    color:
                    _upcomingTabTapped ? MyColors.mainRed : MyColors.grey3,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: TextWidgets.customText(
                      text: text1,
                      color:
                      _upcomingTabTapped ? MyColors.white : MyColors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                _liveTabTapped = true;
                _upcomingTabTapped = false;
                _completedTabTapped = false;
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                    color:
                    _liveTabTapped ? MyColors.mainRed : MyColors.grey3,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: TextWidgets.customText(
                      text: text2,
                      color:
                      _liveTabTapped ? MyColors.white : MyColors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                _completedTabTapped = true;
                _upcomingTabTapped = false;
                _liveTabTapped = false;
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                    color:
                    _completedTabTapped ? MyColors.mainRed : MyColors.grey3,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: TextWidgets.customText(
                      text: text3,
                      color:
                      _completedTabTapped ? MyColors.white : MyColors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 0.5, color: MyColors.grey3.withOpacity(0.9)));
  }
}

class UpcomingMatches extends StatelessWidget {
  const UpcomingMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int pos) {
              return InkWell(
                  onTap: () {
                    Get.toNamed('/winnerLeaderBoardPage');
                  },
                  child: const UpcomingMatchCardWidget()
                      .paddingOnly(bottom: 20));
            }));
  }
}

class LiveMatches extends StatelessWidget {
  const LiveMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int pos) {
              return InkWell(
                  onTap: () {
                    //Get.toNamed('/winnerLeaderBoardPage');
                  },
                  child: const LiveMatchCardWidget()
                      .paddingOnly(bottom: 20));
            }));
  }
}

class CompletedMatches extends StatelessWidget {
  const CompletedMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int pos) {
              return InkWell(
                  onTap: () {
                   // Get.toNamed('/winnerLeaderBoardPage');
                  },
                  child: const CompleteMatchCardWidget().paddingOnly(bottom: 20));
            }));
  }
}



