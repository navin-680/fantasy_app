import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';

class CaptainViceCaptainCardWidget extends StatefulWidget {
  const CaptainViceCaptainCardWidget({super.key});

  @override
  State<CaptainViceCaptainCardWidget> createState() =>
      _CaptainViceCaptainCardWidgetState();
}

class _CaptainViceCaptainCardWidgetState
    extends State<CaptainViceCaptainCardWidget> {
  bool _capTapped = false;
  bool _vsCapTapped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: MyColors.grey3,
          width: 1,
        ),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/kohli_img.png', height: 65),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidgets.customText(
                  text: "Virat Kohli",
                  color: MyColors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700),
              TextWidgets.customText(
                  text: "72Pts",
                  color: MyColors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500),
            ],
          ),
          const SizedBox(width: 30),
          InkWell(
              onTap: () {
                setState(() {
                  _capTapped = !_capTapped;
                });
              },
              child: _capTapped
                  ? Image.asset('assets/icons/2x_icon.png', height: 40)
                  : Image.asset('assets/icons/cap_icon.png', height: 40)),
          const SizedBox(width: 30),
          InkWell(
              onTap: () {
                setState(() {
                  _vsCapTapped = !_vsCapTapped;
                });
              },
              child: _vsCapTapped
                  ? Image.asset('assets/icons/1.5x_icon.png', height: 40)
                  : Image.asset('assets/icons/vc_icon.png', height: 40)),
        ],
      ),
    );
  }
}
