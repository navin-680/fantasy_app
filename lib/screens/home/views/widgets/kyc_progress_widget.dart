import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KycProgressWidget extends StatefulWidget {
  const KycProgressWidget({super.key});

  @override
  State<KycProgressWidget> createState() => _KycProgressWidgetState();
}

class _KycProgressWidgetState extends State<KycProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 93,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Complete Your KYC",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              Text.rich(
                TextSpan(
                  text: '1 ',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                  children: <TextSpan>[
                    TextSpan(
                      text: '/ 3 Steps',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: 0,
                groupValue: 0,
                onChanged: (isCheked) {},
                activeColor: Colors.red,
              ),
              SizedBox(
                width: Get.width * 0.2, // Adjust the width of the divider
                child: Container(
                  height: 2,
                  color: Colors.red,
                ),
              ),
              Radio(
                value: 1,
                groupValue: 0,
                onChanged: (isCheked) {},
                activeColor: Colors.red,
              ),
              SizedBox(
                width: Get.width * 0.2, // Adjust the width of the divider
                child: Container(
                  height: 2,
                  color: Colors.red.shade300,
                ),
              ),
              Radio(value: 1, groupValue: 0, onChanged: (isCheked) {}),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 12, vertical: 14),
    );
  }
}
