import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aivoks_fantasy_app/res/string_constants.dart' as constants;

class MobileNumberInput extends StatefulWidget {
  @override
  _MobileNumberInputState createState() => _MobileNumberInputState();
}

class _MobileNumberInputState extends State<MobileNumberInput> {
  TextEditingController _controller = TextEditingController();
  String _countryCode = '+1'; // Default country code

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  const Text("+91").paddingSymmetric(horizontal: 8,vertical: 0),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ).paddingSymmetric(vertical: 10,horizontal: 0),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.phone,
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                        hintText: constants.StringConstants().enterMobileNo,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

