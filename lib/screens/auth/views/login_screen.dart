import 'package:aivoks_fantasy_app/screens/auth/views/submit_button.dart';
import 'package:aivoks_fantasy_app/screens/auth/views/widgets/mobile_number_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/login_image.png"),
          SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter Mobile Number",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                MobileNumberInput()
              ],
            ),
          ).paddingSymmetric(horizontal: 32, vertical: 0),
        ],
      ).paddingOnly(top: 100),
      bottomNavigationBar: const BottomButton(),
    );
  }
}
