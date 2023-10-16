import 'package:aivoks_fantasy_app/custom_widgets/button_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/custom_bottom_sheet.dart';
import 'package:aivoks_fantasy_app/custom_widgets/rich_text_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:aivoks_fantasy_app/screens/create_team/widgets/all_rounder_list_widget.dart';
import 'package:aivoks_fantasy_app/screens/create_team/widgets/batsman_list_widget.dart';
import 'package:aivoks_fantasy_app/screens/create_team/widgets/bowler_list_widget.dart';
import 'package:aivoks_fantasy_app/screens/create_team/widgets/wicket_keeper_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTeamPage extends StatefulWidget {
  const CreateTeamPage({super.key});

  @override
  State<CreateTeamPage> createState() => _CreateTeamPageState();
}

class _CreateTeamPageState extends State<CreateTeamPage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  var _tabIndex = 0.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomRowButtonsWidget(),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            _blackContainerOnTop(),
            _tabBarWidget(),
            _makeYourTeamTextRowWidget(),
            const Divider(color: MyColors.grey2, height: 1),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: const [
                  WicketKeeperListWidget(),
                  BatsmanListWidget(),
                  AllRounderListWidget(),
                  BowlerListWidget()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back, color: MyColors.white)),
      title: TextWidgets.customText(
          text: "Create Team",
          color: MyColors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.w500),
      actions: [
        _appBarActionIconWidget(15.0, "assets/icons/reset_icon.png"),
        _appBarActionIconWidget(20.0, "assets/icons/help_icon.png", onTap: () {
          _showFullWidthBottomSheet(context);
        }),
      ],
    );
  }

  Widget _appBarActionIconWidget(double rightPadding, String iconText,
      {void Function()? onTap}) {
    return Container(
        padding: EdgeInsets.only(right: rightPadding),
        child: GestureDetector(
            onTap: onTap, child: Image.asset(iconText, width: 26)));
  }

  _showFullWidthBottomSheet(BuildContext context) {
    showModalBottomSheet(
        enableDrag: false,
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return const CustomBottomSheetWidget();
        });
  }

  _blackContainerOnTop() {
    return Container(
      height: 142,
      color: MyColors.black,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("assets/images/ind_flag.png"),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidgets.customText(
                          text: 'IND',
                          color: MyColors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700),
                      const SizedBox(height: 5),
                      TextWidgets.customText(
                          text: '(0)',
                          color: MyColors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/black_vs.png", height: 30),
                  const SizedBox(height: 8),
                  TextWidgets.customText(
                      text: 'Today | 11:00 PM',
                      color: MyColors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidgets.customText(
                              text: 'PAK',
                              color: MyColors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700),
                          const SizedBox(height: 5),
                          TextWidgets.customText(
                              text: '(0)',
                              color: MyColors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                      const SizedBox(width: 8),
                      Image.asset("assets/images/pak_flag.png")
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 28),
          Flexible(
            child: Row(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(bottom: 2),
                    itemCount: 11,
                    itemBuilder: (ctx, index) {
                      return Container(
                        height: 15,
                        width: MediaQuery.of(context).size.width / 14,
                        transform: Matrix4.skewX(-.3),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          color: MyColors.green,
                        ),
                      );
                    }),
                const SizedBox(width: 13),
                TextWidgets.customText(
                    text: "5/11",
                    color: MyColors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _iconTextRow(
      String iconText, String text, Color iconColor, Color textColor) {
    return Row(
      children: [
        Image.asset(iconText, width: 17, color: iconColor),
        const SizedBox(width: 5),
        TextWidgets.customText(
            text: text,
            color: textColor,
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center),
      ],
    );
  }

  Widget _tabBarWidget() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 1))
      ]),
      child: TabBar(
        onTap: (index) {
          setState(() {
            _controller!.index = index;
            _tabIndex.value = _controller!.index;
          });
        },
        padding: const EdgeInsets.symmetric(horizontal: 20),
        isScrollable: true,
        controller: _controller,
        indicatorColor: const Color(0xffF15C22),
        unselectedLabelColor: Colors.black,
        labelColor: const Color(0xffF15C22),
        tabs: [
          Tab(
              icon: Obx(
            () => Center(
                child: _iconTextRow(
              "assets/icons/wk_icon.png",
              'WK(0)',
              _tabIndex.value == 0 ? MyColors.mainRed : MyColors.grey,
              _tabIndex.value == 0 ? MyColors.mainRed : MyColors.black,
            )),
          )),
          Tab(
              icon: Obx(
            () => Center(
                child: _iconTextRow(
              "assets/icons/bat_icon.png",
              'BAT(0)',
              _tabIndex.value == 1 ? MyColors.mainRed : MyColors.grey,
              _tabIndex.value == 1 ? MyColors.mainRed : MyColors.black,
            )),
          )),
          Tab(
              icon: Obx(
            () => Center(
                child: _iconTextRow(
              "assets/icons/ar_icon.png",
              'AR(0)',
              _tabIndex.value == 2 ? MyColors.mainRed : MyColors.grey,
              _tabIndex.value == 2 ? MyColors.mainRed : MyColors.black,
            )),
          )),
          Tab(
              icon: Obx(
            () => Center(
                child: _iconTextRow(
              "assets/icons/bowl_icon.png",
              'BOWl(0)',
              _tabIndex.value == 3 ? MyColors.mainRed : MyColors.grey,
              _tabIndex.value == 3 ? MyColors.mainRed : MyColors.black,
            )),
          ))
        ],
      ),
    );
  }

  Widget _makeYourTeamTextRowWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichTextsWidget.richText(
              text1: "Make your",
              text2: ' 11 team',
              color1: MyColors.black,
              color2: MyColors.mainRed,
              fontSize1: 12.0,
              fontWeight1: FontWeight.w600,
              fontSize2: 12.0,
              fontWeight2: FontWeight.w600),
          Row(
            children: [
              Row(
                children: [
                  TextWidgets.customText(
                      text: "points".toUpperCase(),
                      color: MyColors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600),
                  const SizedBox(width: 3),
                  Image.asset('assets/icons/up_down_arrow_icon.png', height: 20)
                ],
              ),
              const SizedBox(width: 23),
              Row(
                children: [
                  TextWidgets.customText(
                      text: "Credits".toUpperCase(),
                      color: MyColors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600),
                  const SizedBox(width: 3),
                  Image.asset('assets/icons/up_down_arrow_icon.png', height: 20)
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _bottomRowButtonsWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
      child: ButtonWidgets.rowButtons(
          onPressed1: () {},
          onPressed2: () {
            if (_tabIndex.value == 3) {
              Get.toNamed('captainViceCaptainListPage');
            } else {
              _controller?.animateTo((_controller!.index + 1) % 4);
              setState(() {
                _tabIndex.value = _controller!.index;
              });
            }
          },
          buttonText1: "preview".toUpperCase(),
          buttonText2: "Next".toUpperCase(),
          color1: MyColors.black.withOpacity(0.7),
          color2: _tabIndex.value == 3 ? MyColors.green : MyColors.mainRed),
    );
  }
}
