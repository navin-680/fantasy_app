import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:flutter/material.dart';

import '../../../res/my_colors.dart';

class VsTeamsCardWidget extends StatefulWidget {
  const VsTeamsCardWidget({super.key});

  @override
  State<VsTeamsCardWidget> createState() => _VsTeamsCardWidgetState();
}

class _VsTeamsCardWidgetState extends State<VsTeamsCardWidget> {
  @override
  Widget build(BuildContext context) {
    return _teamsVsCard();
  }

  Widget _teamsVsCard() {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        height: 64,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/images/ind_flag.png"),
                const SizedBox(width: 8),
                TextWidgets.customText(
                    text: 'IND',
                    color: MyColors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700)
              ],
            ),
            Image.asset("assets/images/pink_vs.png"),
            Row(
              children: [
                Row(
                  children: [
                    TextWidgets.customText(
                        text: 'PAK',
                        color: MyColors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700),
                    const SizedBox(width: 8),
                    Image.asset("assets/images/pak_flag.png")
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
