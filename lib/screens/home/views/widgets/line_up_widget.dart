import 'package:flutter/material.dart';

class LineUpWidget extends StatefulWidget {
  const LineUpWidget({super.key});

  @override
  State<LineUpWidget> createState() => _LineUpWidgetState();
}

class _LineUpWidgetState extends State<LineUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 2.0),
            child: ClipPath(
              clipper: ArcClipper(),
              child: Container(
                  width: 71.0,
                  height: 20.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        bottomLeft: Radius.circular(4.0)),
                    color: Colors.green
                  ),
                  child: const Center(
                      child: Text(
                    'LINE UP',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0),
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, 0.0);


    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - 10, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

