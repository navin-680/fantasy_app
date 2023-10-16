import 'package:flutter/material.dart';

import '../../../../custom_widgets/text_widgets.dart';
import '../../../../custom_widgets/timer_widget.dart';
import '../../../../res/my_colors.dart';

class LiveMatchCardWidget extends StatefulWidget {
  const LiveMatchCardWidget({super.key});

  @override
  State<LiveMatchCardWidget> createState() => _LiveMatchCardWidgetState();
}

class _LiveMatchCardWidgetState extends State<LiveMatchCardWidget> {
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
                  Container(
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: MyColors.mainRed,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_circle,
                          color: MyColors.mainRed,
                          size: 12,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Live",
                          style: TextStyle(
                              color: MyColors.mainRed,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
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
                children: [
                  Image.asset(
                    "assets/icons/tshirt.png",
                    width: 16,
                    height: 16,
                  ),
                  const Text(
                    " 1 Team",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: MyColors.textColorGrey),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    "assets/icons/trophy.png",
                    width: 14,
                    height: 14,
                  ),
                  const Text(
                    " 1 Contest",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: MyColors.textColorGrey),
                  ),
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
