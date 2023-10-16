import 'package:aivoks_fantasy_app/custom_widgets/button_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:aivoks_fantasy_app/screens/contest/widgets/contest_match_card_widget.dart';
import 'package:aivoks_fantasy_app/screens/contest/widgets/vs_team_card.dart';
import 'package:aivoks_fantasy_app/screens/my_matches/views/widgets/upcoming_match_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../create_team/widgets/my_teams_card_page_widget.dart';

class JoinContestsPage extends StatefulWidget {
  const JoinContestsPage({super.key});

  @override
  State<JoinContestsPage> createState() => _JoinContestsPageState();
}

class _JoinContestsPageState extends State<JoinContestsPage> {
  bool _contestTabTapped = true;
  bool _myMatchesTabTapped = false;
  bool _myTeamsTabTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomCreateTeamButton(),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
                height: 40,
                decoration: _boxDecoration(),
                child: _selectedTabsRowContainer(
                    "Contests", "My Contests", "My Teams")),
            const SizedBox(height: 16),
            _contestTabTapped
                ? const ContestsList()
                : _myMatchesTabTapped
                    ? const MyContestsList()
                    : const MyTeamsList()
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
                _contestTabTapped = true;
                _myMatchesTabTapped = false;
                _myTeamsTabTapped = false;
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
                        _contestTabTapped ? MyColors.mainRed : MyColors.grey3,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: TextWidgets.customText(
                      text: text1,
                      color:
                          _contestTabTapped ? MyColors.white : MyColors.black,
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
                _myMatchesTabTapped = true;
                _contestTabTapped = false;
                _myTeamsTabTapped = false;
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
                        _myMatchesTabTapped ? MyColors.mainRed : MyColors.grey3,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: TextWidgets.customText(
                      text: text2,
                      color:
                          _myMatchesTabTapped ? MyColors.white : MyColors.black,
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
                _myTeamsTabTapped = true;
                _contestTabTapped = false;
                _myMatchesTabTapped = false;
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
                        _myTeamsTabTapped ? MyColors.mainRed : MyColors.grey3,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: TextWidgets.customText(
                      text: text3,
                      color:
                          _myTeamsTabTapped ? MyColors.white : MyColors.black,
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

  Widget _bottomCreateTeamButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ButtonWidgets.mainCustomButton(
          height: 48,
          onPressed: () {
            Get.toNamed('createTeamPage');
          },
          buttonText: 'Create Team'.toUpperCase(),
          isLoading: false,
          color: MyColors.green),
    );
  }
}

class ContestsList extends StatefulWidget {
  const ContestsList({super.key});

  @override
  State<ContestsList> createState() => _ContestsListState();
}

class _ContestsListState extends State<ContestsList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const VsTeamsCardWidget(),
          const SizedBox(height: 16),
          Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int pos) {
                    return InkWell(
                        onTap: () {
                          Get.toNamed('/winnerLeaderBoardPage');
                        },
                        child: const ContestMatchCardWidget()
                            .paddingOnly(bottom: 20));
                  }))
        ],
      ),
    );
  }
}

class MyContestsList extends StatefulWidget {
  const MyContestsList({super.key});

  @override
  State<MyContestsList> createState() => _MyContestsListState();
}

class _MyContestsListState extends State<MyContestsList> {
  @override
  Widget build(BuildContext context) {
    return UpcomingMatchCardWidget();
  }
}

class MyTeamsList extends StatefulWidget {
  const MyTeamsList({super.key});

  @override
  State<MyTeamsList> createState() => _MyTeamsListState();
}

class _MyTeamsListState extends State<MyTeamsList> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        MyTeamsCardWidget(teamText: 'Team 1'),
        SizedBox(height: 20),
        MyTeamsCardWidget(teamText: 'Team 2'),
      ],
    );
  }
}
