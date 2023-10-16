import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EachPage extends StatelessWidget {
  final String message;
  final String image;

  EachPage(this.message, this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF1E4998),
                Color(0xFF4F86EB),
              ],
              begin: FractionalOffset(0.0, 1.0),
              end: FractionalOffset(0.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              image,
              fit: BoxFit.scaleDown,
              width: 360,
              height: 426,
            ).paddingOnly(top: 200),
            /*Text(
              message,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ).paddingSymmetric(horizontal: 50,vertical: 20)*/
          ],
        ),
      ),
    );
  }
}
