import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';

class MyTeamsCardWidget extends StatefulWidget {
  final String? teamText;
  final Function()? onTap;

  const MyTeamsCardWidget({super.key, this.teamText, this.onTap});

  @override
  State<MyTeamsCardWidget> createState() => _MyTeamsCardWidgetState();
}

class _MyTeamsCardWidgetState extends State<MyTeamsCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                    image: AssetImage('assets/images/ground_img.png'),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                    height: 44,
                    decoration: const BoxDecoration(
                        color: MyColors.black,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidgets.customText(
                              text: widget.teamText,
                              color: MyColors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700),
                          Row(
                            children: [
                              Image.asset("assets/icons/edit_icon.png",
                                  height: 20),
                              const SizedBox(width: 25),
                              Image.asset("assets/icons/copy_icon.png",
                                  height: 20),
                              const SizedBox(width: 25),
                              Image.asset("assets/icons/eye_icon.png",
                                  height: 20),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        TextWidgets.customText(
                            text: 'IND',
                            color: MyColors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700),
                        TextWidgets.customText(
                            text: '(0)',
                            color: MyColors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        TextWidgets.customText(
                            text: 'PAK',
                            color: MyColors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700),
                        TextWidgets.customText(
                            text: '(0)',
                            color: MyColors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/images/kohli_img.png', height: 90),
                        Image.asset('assets/images/kohli_img.png', height: 90),
                      ],
                    ),
                    Positioned(
                      left: 20,
                      child: Image.asset('assets/icons/white_c_icon.png',
                          height: 40),
                    ),
                    Positioned(
                      right: 20,
                      child: Image.asset('assets/icons/orange_vc_icon.png',
                          height: 40),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 40,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 4, bottom: 4),
                        decoration: BoxDecoration(
                            color: MyColors.black,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextWidgets.customText(
                            text: 'Hardik Pandya',
                            color: MyColors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 56,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 4, bottom: 4),
                        decoration: BoxDecoration(
                            color: MyColors.black,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextWidgets.customText(
                            text: 'Virat Kohli',
                            color: MyColors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(
                  height: 1,
                  color: MyColors.grey,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _iconTextRow("assets/icons/wk_icon.png", 'WK(0)'),
                        _iconTextRow("assets/icons/bat_icon.png", 'BAT(0)'),
                        _iconTextRow("assets/icons/ar_icon.png", 'AR(0)'),
                        _iconTextRow("assets/icons/bowl_icon.png", 'BOWl(0)')
                      ]),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconTextRow(String iconText, String text) {
    return Row(
      children: [
        Image.asset(iconText, width: 17, color: MyColors.white),
        const SizedBox(width: 5),
        TextWidgets.customText(
            text: text,
            color: MyColors.white,
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center),
      ],
    );
  }
}
