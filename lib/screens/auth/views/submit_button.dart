import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:aivoks_fantasy_app/res/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({super.key});

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          children: [
            Checkbox(
              value: isChecked, // Set the initial checkbox state
              onChanged: (bool? newValue) {
                setState(() {
                  isChecked = newValue!;
                }); // Checkbox state change logic
              },
            ),
            const SizedBox(width: 8),
            // Add some spacing between the Checkbox and Text
            const Expanded(
                child: Text(
                    'I accept that i’m 18+ and agree to Terms & Condition')),
          ],
        ),
        ElevatedButton(
          onPressed: () => _nextButtonOnPressed(),
          style: ElevatedButton.styleFrom(
            primary: isChecked == true ? MyColors.mainRed : MyColors.grey5,
            // Background color
            onPrimary: Colors.white,
            // Text color
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: Text(
            StringConstants().enterNumber,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ).paddingSymmetric(horizontal: 12, vertical: 0),
      ],
    ).paddingOnly(bottom: 30);
  }

  _nextButtonOnPressed() {
    Get.toNamed("/otp");
  }
}
