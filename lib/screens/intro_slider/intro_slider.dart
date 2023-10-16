import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/indicator.dart';
import 'intro_screen_widegt.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State {
  final controller = PageController();

  final messages = [
    "dummy text of the printing typesetting industry",
    "dummy text of the printing typesetting industry",
    "dummy text of the printing typesetting industry"
  ];
  final images = [
    'assets/images/into1.png',
    'assets/images/intro2.png',
    'assets/images/intro3.png'
  ];

  int numberOfPages = 3;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        PageView.builder(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          itemCount: numberOfPages,
          itemBuilder: (BuildContext context, int index) {
            bool showSkip = true;
            if (index == 2) showSkip = false;
            return EachPage(messages[index], images[index]);
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 50,
            child: currentPage != 3
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      /*  Flexible(

                  child: (currentPage==numberOfPages-1)?
                  GestureDetector(
                      onTap: (){
                        controller.jumpToPage(numberOfPages-1);
                      },
                      child: const Center(child: Text("Done",style: TextStyle(fontWeight: FontWeight.bold),))):
                  GestureDetector(
                      onTap: (){
                        controller.jumpToPage(numberOfPages-1);
                      },
                      child: const Center(child:Text(
                        'Skip',
                        style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, color: Colors.white),
                      ))),
                ),*/
                      SizedBox(
                        width: Get.width * 0.3,
                      ),
                      Flexible(
                        child: Indicator(
                          controller: controller,
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                          ),
                          onPressed: () {
                        if (currentPage < 2) {
                          controller.jumpToPage(currentPage + 1);
                        } else {
                          Get.offAllNamed("loginButtonScreen");
                        }
                          },
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidgets.customText(
                              text: 'Next',
                              color: MyColors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600),
                          const Icon(
                            Icons.chevron_right_sharp,
                            color: Colors.white,
                            size: 22,
                          ),
                        ],
                          ),
                        ).paddingOnly(right: 10),
                      ),
                    ],
                  )
                : SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed("login");
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(0.0),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.red, Colors.red],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: double.infinity, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Text(
                            "GET STARTED",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ).paddingOnly(bottom: 50)
      ]),
    );
  }
}
