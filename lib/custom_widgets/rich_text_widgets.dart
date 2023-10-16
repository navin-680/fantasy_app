import 'package:flutter/cupertino.dart';

class RichTextsWidget {
  static Widget richText(
      {BuildContext? context,
      String? text1,
      String? text2,
      fontSize1,
      fontSize2,
      fontWeight1,
      fontWeight2,
      color1,
      color2,
      fontStyle1,
      fontStyle2,
      fontFamily1,
      fontFamily2,
      letterSpacing1,
      letterSpacing2,
      TextOverflow? overflow1,
      TextOverflow? overflow2,
      TextDecoration? decoration1,
      TextDecoration? decoration2,
      TextAlign? textAlign1,
      TextAlign? textAlign2}) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          style: TextStyle(
              fontSize: fontSize1,
              decoration: decoration1,
              fontWeight: fontWeight1,
              color: color1,
              fontStyle: fontStyle1,
              letterSpacing: letterSpacing1,
              fontFamily: fontFamily1,
              overflow: overflow1),
          text: text1),
      TextSpan(
          style: TextStyle(
              fontSize: fontSize2,
              decoration: decoration2,
              fontWeight: fontWeight2,
              color: color2,
              fontStyle: fontStyle2,
              letterSpacing: letterSpacing2,
              fontFamily: fontFamily2,
              overflow: overflow2),
          text: text2)
    ]));
  }
}
