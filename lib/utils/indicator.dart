import 'package:flutter/material.dart';

class Indicator extends AnimatedWidget {
  final PageController controller;

  const Indicator({super.key, required this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _createIndicator(index);
                })
          ],
        ),
      ),
    );
  }

  Widget _createIndicator(index) {
    double w = 10;
    double h = 10;
    MaterialColor color = Colors.grey;

    if (controller.page == index) {
      color = Colors.blueGrey;
      h = 13;
      w = 13;
    }

    return SizedBox(
      height: 26,
      width: 26,
      child: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(100)
              //more than 50% of width makes circle
              ),
          margin: const EdgeInsets.all(5),
          width: w,
          height: h,
          duration: const Duration(milliseconds: 100),
        ),
      ),
    );
  }
}
