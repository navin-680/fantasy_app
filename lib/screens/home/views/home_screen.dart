import 'package:aivoks_fantasy_app/screens/home/views/widgets/carousel_slider_widget.dart';
import 'package:aivoks_fantasy_app/screens/home/views/widgets/kyc_progress_widget.dart';
import 'package:aivoks_fantasy_app/screens/home/views/widgets/matches_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AIVOKS"),
        leading: const SizedBox(),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.red,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_active_outlined),
            onPressed: () {
              print('Notification icon pressed');
            },
          ),
        ],
      ),
      body: Scrollbar(
        interactive: true,
        radius: const Radius.circular(3),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 8),
            const MyCarouselSlider(),
            const SizedBox(
              height: 8,
            ),
            const KycProgressWidget(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("My Matches",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                GestureDetector(
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'View All',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const MatchCard().paddingOnly(bottom: 8),
            const SizedBox(height: 10),
            const Text("Upcoming Matches",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Column(
              children: List.generate(
                  40,
                  (index) => GestureDetector(
                      onTap: () {
                        Get.toNamed("joinContestsPage");
                      },
                      child: const MatchCard().paddingOnly(bottom: 8))),
            )
          ]).paddingSymmetric(horizontal: 20, vertical: 4),
        ),
      ),
    );
  }
}
