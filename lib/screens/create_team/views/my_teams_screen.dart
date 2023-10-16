import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:aivoks_fantasy_app/screens/create_team/widgets/my_teams_card_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTeamsScreen extends StatefulWidget {
  const MyTeamsScreen({super.key});

  @override
  State<MyTeamsScreen> createState() => _MyTeamsScreenState();
}

class _MyTeamsScreenState extends State<MyTeamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomButton(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          MyTeamsCardWidget(
            teamText: 'Team 1',
            onTap: () {
              Get.toNamed('myTeamsViewPage');
            },
          ),
          const SizedBox(height: 20),
          const MyTeamsCardWidget(teamText: 'Team 2'),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back, color: MyColors.white)),
      title: TextWidgets.customText(
          text: "My Teams",
          color: MyColors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.w500),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_active_outlined),
          onPressed: () {
            print('Notification icon pressed');
          },
        ),
      ],
    );
  }

  Widget _bottomButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            color: MyColors.mainRed, borderRadius: BorderRadius.circular(4)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidgets.customText(
                  text: "Create Team",
                  color: MyColors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
              const SizedBox(width: 5),
              Image.asset(
                "assets/icons/white_plus_icon.png",
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
