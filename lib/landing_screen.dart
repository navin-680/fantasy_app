import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:aivoks_fantasy_app/screens/home/views/home_screen.dart';
import 'package:aivoks_fantasy_app/screens/my_matches/views/my_matches_screen.dart';
import 'package:aivoks_fantasy_app/screens/profile/views/profile_screen.dart';
import 'package:aivoks_fantasy_app/screens/wallet/views/wallet_screen.dart';
import 'package:aivoks_fantasy_app/screens/winners/views/winners_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

int _currentTabIndex = 2;

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _tabItem[_currentTabIndex],
        bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(), //shape of notch
            notchMargin: 4,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _tabsWidget(
                          "assets/icons/my_matches.png", 0, "My Matches"),
                      _tabsWidget("assets/icons/winners.png", 1, "Winners"),
                      _tabsWidget("assets/icons/wallet.png", 3, "Wallet"),
                      _tabsWidget("assets/icons/menu.png", 4, "Menu")
                    ]))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _floatingActionWidget());
  }

  final List<Widget> _tabItem = [
    const MyMatchesScreen(),
    const WinnersScreen(),
    const HomeScreen(),
    const WalletScreen(),
    const ProfileScreen(),
  ];

  _onTapped(int index) {
    if (_currentTabIndex != index) {
      setState(() {
        if (index == 0) {
          //controller.startInit();
        }

        if (index == 1) {
          //_calendarController.startInit();
        }

        if (index == 2) {
          // homeController.startInit();
        }

        if (index == 3) {
          // _walletController.startInit();
        }

        if (index == 4) {
          //_menuController.startInit(context);
        }
        _currentTabIndex = index;
      });
    }
  }

  Widget _tabsWidget(String icon, int index, String tabText) {
    return Expanded(
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _onTapped(index),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ImageIcon(AssetImage(icon),
                  color: _currentTabIndex == index
                      ? MyColors.mainRed
                      : const Color(0xff7A7A7A)),
              const SizedBox(height: 4),
              Text(tabText,
                  style: TextStyle(
                      color: _currentTabIndex == index
                          ? MyColors.mainRed
                          : const Color(0xff7A7A7A),
                      fontFamily: "Montserrat",
                      fontSize: 10))
            ])));
  }

  Widget _floatingActionWidget() {
    return FloatingActionButton(
        backgroundColor: MyColors.mainRed,
        onPressed: () => _onTapped(2),
        child: const Icon(Icons.home_outlined, color: Colors.white, size: 30));
  }
}
