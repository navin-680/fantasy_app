import 'package:aivoks_fantasy_app/custom_widgets/button_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:aivoks_fantasy_app/res/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginButtonScreen extends StatefulWidget {
  const LoginButtonScreen({super.key});

  @override
  State<LoginButtonScreen> createState() => _LoginButtonScreenState();
}

class _LoginButtonScreenState extends State<LoginButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        "assets/images/login.png",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child:
            Padding(padding: const EdgeInsets.all(20.0), child: _rowButtons()),
      )
    ]));
  }

  Widget _rowButtons() {
    return Row(children: <Widget>[
      Expanded(
        child: ButtonWidgets.mainCustomButton(
            height: 55,
            onPressed: () {
              Get.offAllNamed("login");
            },
            buttonText: StringConstants().login.toUpperCase(),
            isLoading: false,
            color: MyColors.mainRed),
      ),
      const SizedBox(width: 20.0),
      Expanded(
        child: ButtonWidgets.customOutlinedButton(
            height: 55,
            onPressed: () {},
            buttonText: StringConstants().register.toUpperCase()),
      ),
    ]);
  }
}
