import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidgets {
  static Widget mainButton({
    required final VoidCallback? onPressed,
    required final String? buttonText,
    required final bool isLoading,
  }) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.mainRed,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: MyColors.white),
              )
            : TextWidgets.customText(
                text: buttonText,
                fontSize: 16.0,
                color: MyColors.white,
                fontFamily: "Roboto",
              ),
      ),
    );
  }

  static Widget joinButton({
    required final VoidCallback? onPressed,
    required final String? buttonText,
    required final bool isLoading,
  }) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: MyColors.white),
              )
            : TextWidgets.customText(
                text: buttonText,
                fontSize: 16.0,
                color: MyColors.white,
                fontFamily: "Roboto",
              ),
      ),
    );
  }

  static Widget mainCustomButton({
    required final double height,
    required final VoidCallback? onPressed,
    required final String? buttonText,
    required final bool isLoading,
    required final Color color,
  }) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: MyColors.white),
              )
            : TextWidgets.customText(
                text: buttonText,
                fontSize: 16.0,
                color: MyColors.white,
                fontFamily: "Roboto",
              ),
      ),
    );
  }

  static Widget mainOutLinedButton(
      {required final VoidCallback? onPressed,
      required final String? buttonText}) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: MyColors.mainRed, width: 2.0)),
          child: TextWidgets.customText(
              text: "$buttonText",
              color: MyColors.mainRed,
              fontSize: 16.0,
              fontFamily: "Inter")),
    );
  }

  static Widget mainBlackOutLinedButton(
      {required final VoidCallback? onPressed,
      required final String? buttonText,
      required final Color borderColor,
      required final Color textColor}) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: borderColor, width: 2.0)),
          child: TextWidgets.customText(
              text: "$buttonText",
              color: textColor,
              fontSize: 16.0,
              fontFamily: "Inter")),
    );
  }

  static Widget customOutlinedButton(
      {required final double height,
      required final VoidCallback? onPressed,
      required final String? buttonText}) {
    return SizedBox(
      height: height,
      child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: MyColors.white, width: 2.0)),
          child: TextWidgets.customText(
              text: "$buttonText",
              color: MyColors.white,
              fontSize: 16.0,
              fontFamily: "Inter")),
    );
  }

  static Widget rowButtons({
    required final VoidCallback? onPressed1,
    required final VoidCallback? onPressed2,
    required final String? buttonText1,
    required final String? buttonText2,
    required final Color color1,
    required final Color color2,
  }) {
    return Row(children: <Widget>[
      Expanded(
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
              onPressed: onPressed1,
              style: ElevatedButton.styleFrom(
                  backgroundColor: color1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
              child: TextWidgets.customText(
                  text: "$buttonText1",
                  color: MyColors.white,
                  fontSize: 16.0,
                  fontFamily: "Inter")),
        ),
      ),
      const SizedBox(width: 20.0),
      Expanded(
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
              onPressed: onPressed2,
              style: ElevatedButton.styleFrom(
                  backgroundColor: color2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
              child: TextWidgets.customText(
                  text: "$buttonText2",
                  color: MyColors.white,
                  fontSize: 16.0,
                  fontFamily: "Inter")),
        ),
      ),
    ]);
  }
}
