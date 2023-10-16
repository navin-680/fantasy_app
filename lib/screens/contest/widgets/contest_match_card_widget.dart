import 'package:aivoks_fantasy_app/custom_widgets/rich_text_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';

class ContestMatchCardWidget extends StatefulWidget {
  const ContestMatchCardWidget({super.key});

  @override
  State<ContestMatchCardWidget> createState() => _ContestMatchCardWidgetState();
}

class _ContestMatchCardWidgetState extends State<ContestMatchCardWidget> {
  double _value = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        children: [
          Container(
            height: 35,
            padding: const EdgeInsets.only(left: 14, right: 37),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                color: MyColors.selectedItemColor),
            child: Row(
              children: [
                Image.asset("assets/icons/prize_icon.png"),
                const SizedBox(width: 8),
                TextWidgets.customText(
                    text: "₹7 Lakhs",
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: MyColors.black),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/mobile_icon.png"),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidgets.customText(
                            text: 'Prize',
                            color: MyColors.grey,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400),
                        TextWidgets.customText(
                            text: '₹1.20 Crores',
                            color: MyColors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichTextsWidget.richText(
                        text1: "Entry ",
                        text2: "₹59",
                        color1: MyColors.black,
                        fontSize1: 10.0,
                        fontWeight1: FontWeight.w500,
                        fontSize2: 10.0,
                        fontWeight2: FontWeight.w500,
                        color2: MyColors.mainRed),
                    const SizedBox(height: 8),
                    Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          color: MyColors.green,
                          borderRadius: BorderRadius.circular(2)),
                      child: Center(
                        child: TextWidgets.customText(
                            text: '₹41',
                            color: MyColors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: SliderTheme(
              data: SliderThemeData(
                thumbShape: HiddenThumbShape(), // Use custom HiddenThumbShape
              ),
              child: Slider(
                activeColor: MyColors.mainRed,
                inactiveColor: MyColors.mainRed.withOpacity(0.3),
                min: 0.0,
                max: 100.0,
                autofocus: false,
                value: _value,
                onChanged: (value) {
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidgets.customText(
                    text: '45,000 Left',
                    color: MyColors.mainRed,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
                TextWidgets.customText(
                    text: '79,000 Spots',
                    color: MyColors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _iconTextRow("assets/icons/shirt_icon.png", "14 Team"),
                    const SizedBox(width: 20),
                    _iconTextRow("assets/icons/cup_icon.png", "59%"),
                  ],
                ),
                _iconTextRow("assets/icons/ladder_icon.png", "Flexible%"),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _iconTextRow(String iconText, String text) {
    return Row(
      children: [
        Image.asset(iconText),
        const SizedBox(width: 8),
        TextWidgets.customText(
            text: text,
            color: MyColors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center),
      ],
    );
  }


}
class HiddenThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.zero; // Return zero size to hide the thumb
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double>? activationAnimation,
        Animation<double>? enableAnimation,
        bool? isDiscrete,
        TextPainter? labelPainter,
        RenderBox? parentBox,
        SliderThemeData? sliderTheme,
        TextDirection? textDirection,
        double? value,
        double? textScaleFactor,
        Size? sizeWithOverflow}) {
    // Nothing to paint since thumb is hidden
  }
}

