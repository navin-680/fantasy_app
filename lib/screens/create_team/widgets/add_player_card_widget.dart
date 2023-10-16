import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';

class AddPlayerCardWidget extends StatefulWidget {
  final Function()? onTap;
  final int? index;
  final List<bool>? itemSelection;

  const AddPlayerCardWidget(
      {super.key, this.onTap, this.index, this.itemSelection});

  @override
  State<AddPlayerCardWidget> createState() => _AddPlayerCardWidgetState();
}

class _AddPlayerCardWidgetState extends State<AddPlayerCardWidget> {
  @override
  Widget build(BuildContext context) {
    var isSelected = widget.itemSelection![widget.index ?? 0];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: isSelected ? MyColors.green.withOpacity(0.1) : MyColors.grey3,
          border: const Border(
            bottom: BorderSide(
              color: MyColors.grey3,
              width: 1,
            ),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/kohli_img.png', height: 65),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidgets.customText(
                  text: "Virat Kohli",
                  color: MyColors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700),
              TextWidgets.customText(
                  text: "Chosen by 79.0%",
                  color: MyColors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500),
            ],
          ),
          const SizedBox(width: 30),
          TextWidgets.customText(
              text: "76",
              color: MyColors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w700),
          const SizedBox(width: 30),
          TextWidgets.customText(
              text: "8.0",
              color: MyColors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w700),
          const SizedBox(width: 17),
          GestureDetector(
              onTap: widget.onTap,
              child: isSelected
                  ? Image.asset('assets/icons/remove_icon.png', height: 40)
                  : Image.asset('assets/icons/plus_icon_circular.png',
                      height: 40)),
        ],
      ),
    );
  }
}
