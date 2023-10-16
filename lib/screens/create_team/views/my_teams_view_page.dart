import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTeamsViewPage extends StatefulWidget {
  const MyTeamsViewPage({super.key});

  @override
  State<MyTeamsViewPage> createState() => _MyTeamsViewPageState();
}

class _MyTeamsViewPageState extends State<MyTeamsViewPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> tags = [
      _playerImageWidget(),
      _playerImageWidget(),
      _playerImageWidget(),
      _playerImageWidget(),
      _playerImageWidget(),
      _playerImageWidget(),
      _playerImageWidget()
    ];
    return Scaffold(
        appBar: _appBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/pitch_img.png'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Wrap(children: [for (var item in tags) item])
            ],
          ),
        ));
  }

  _appBar() {
    return AppBar(
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back, color: MyColors.white)),
      title: TextWidgets.customText(
          text: "My Teams",
          color: MyColors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.w500),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_active_outlined),
          onPressed: () {
            print('Notification icon pressed');
          },
        ),
      ],
    );
  }

  Widget _playerImageWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Stack(children: [
        Container(
            height: 71,
            padding: const EdgeInsets.only(left: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/kohli_img.png', height: 40),
                  Container(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 3, bottom: 3),
                      decoration: BoxDecoration(
                          color: MyColors.black,
                          borderRadius: BorderRadius.circular(2)),
                      child: TextWidgets.customText(
                          text: 'Hardik Pandya',
                          color: MyColors.white,
                          fontSize: 8.0,
                          fontWeight: FontWeight.w600)),
                  Container(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 3, bottom: 3),
                      decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(2)),
                      child: TextWidgets.customText(
                          text: '8.0 CR',
                          color: MyColors.black,
                          fontSize: 8.0,
                          fontWeight: FontWeight.w700)),
                ])),
        Positioned(
          left: 0,
          child: Image.asset('assets/icons/white_c_icon.png', height: 25),
        ),
      ]),
    );
  }
}
