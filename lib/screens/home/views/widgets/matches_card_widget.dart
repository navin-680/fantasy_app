import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/timer_widget.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:aivoks_fantasy_app/screens/home/views/widgets/line_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchCard extends StatefulWidget {
  const MatchCard({super.key});

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  color: Colors.grey.shade200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidgets.customText(
                      text: "MCA T20 Super Series", color: MyColors.black),
                  LineUpWidget(),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/team1.png'))),
                      ),
                      const SizedBox(width: 8),
                      TextWidgets.customText(
                          text: "WEF",
                          color: MyColors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const DifferenceOfTimerWidget(),
                      const SizedBox(height: 12),
                      Image.asset('assets/images/vs.png')
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/team1.png'))),
                      ),
                      const SizedBox(width: 8),
                      TextWidgets.customText(
                          text: "WEF",
                          color: MyColors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidgets.customText(
                      text: "Welsh Fire",
                      color: MyColors.black,
                      fontSize: 10.0),
                  TextWidgets.customText(
                      text: "Trent Rockets",
                      color: MyColors.black,
                      fontSize: 10.0),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Divider(height: 2),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200),
                    child: Center(
                      child: TextWidgets.customText(
                          text: "MCA T20 Super Series", color: MyColors.black),
                    ),
                  ),
                  TextWidgets.customText(
                      text: "Today | 06:00 PM", color: MyColors.black),
                ],
              ),
            ),
            const SizedBox(height: 8)
          ],
        ),
      ),
    );
  }
}
