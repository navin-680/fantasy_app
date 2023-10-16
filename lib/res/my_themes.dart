import 'package:flutter/material.dart';

import 'my_colors.dart';

class MyThemes {
  final ThemeData mainTheme = ThemeData(
      fontFamily: 'Inter',
      primaryColor: Colors.red,
      appBarTheme: AppBarTheme(
        color: Colors.red
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ),
      colorScheme: MyColors.colorSchemeLight);

  final ThemeData lightTheme = ThemeData(
      fontFamily: 'Roboto',
      primaryColor: MyColors.primaryColor,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ),
      colorScheme: MyColors.colorSchemeLight);
}
