import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';

class TextWidgets {
  static Widget customText(
      {BuildContext? context,
      String? text,
      fontSize,
      fontWeight,
      color,
      fontStyle,
      fontFamily,
      letterSpacing,
      TextDecoration? decoration,
      TextAlign? textAlign,
      double? height,
      TextOverflow? overflow}) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 14.0,
        decoration: decoration,
        fontWeight: fontWeight,
        color: color ?? MyColors.black,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        overflow: overflow,
        height: height,
        fontFamily: fontFamily ?? "Roboto",
      ),
    );
  }
}
