import 'package:aivoks_fantasy_app/custom_widgets/button_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';
import 'text_widgets.dart';

class CustomBottomSheetWidget extends StatefulWidget {
  const CustomBottomSheetWidget({super.key});

  @override
  State<CustomBottomSheetWidget> createState() =>
      _CustomBottomSheetWidgetState();
}

class _CustomBottomSheetWidgetState extends State<CustomBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: double.infinity, // Set the width to fill the screen
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(height: 3, width: 60, color: MyColors.black),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset('assets/icons/red_cross_icon.png',
                        height: 35),
                  )),
              const SizedBox(height: 25),
              Align(
                  alignment: Alignment.center,
                  child: TextWidgets.customText(
                      text: "Aivoks 11 Fantasy",
                      color: MyColors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Align(
                  alignment: Alignment.center,
                  child: TextWidgets.customText(
                      text:
                          "Make a team of 11 Players, Join contest & Win Cash",
                      color: MyColors.black.withOpacity(0.6),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center)),
              const SizedBox(height: 30),
              _redTickRowWithTextWidget(
                  "Players get points for their performance in the match. "),
              const SizedBox(height: 12),
              _redTickRowWithTextWidget(
                  "Choose 1-8 Wicket keeper, 1-8 Batters, 1-8 Bowlers, 1-8 All Rounders"),
              const SizedBox(height: 12),
              _redTickRowWithTextWidget("Use upto 100 Credits"),
              const SizedBox(height: 12),
              _redTickRowWithTextWidget("1 Run = 1 Point"),
              const SizedBox(height: 12),
              _redTickRowWithTextWidget("Run Out = 12 Points"),
              const SizedBox(height: 12),
              _redTickRowWithTextWidget("1 Catch = 8 Points"),
              const SizedBox(height: 26),
              ButtonWidgets.mainButton(
                  onPressed: () {},
                  buttonText: "Make your team now".toUpperCase(),
                  isLoading: false),
              const SizedBox(height: 15),
              ButtonWidgets.mainBlackOutLinedButton(
                  onPressed: () {},
                  buttonText: "know More".toUpperCase(),
                  borderColor: MyColors.grey,
                  textColor: MyColors.black),
              const SizedBox(height: 15),
            ],
          ),
        ));
  }

  _redTickRowWithTextWidget(String text) {
    return Row(
      children: [
        Image.asset('assets/icons/red_tick_icon.png', height: 20),
        const SizedBox(width: 8),
        Expanded(
          child: TextWidgets.customText(
              text: text,
              color: MyColors.paragraph,
              fontSize: 14.0,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
