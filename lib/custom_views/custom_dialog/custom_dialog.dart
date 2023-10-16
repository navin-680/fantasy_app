
import 'package:flutter/material.dart';

import '../../res/my_colors.dart';
import '../../res/my_text_style.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final String? applyButtonText;
  final bool isButtonEnable;
  final Function()? onPressed;

  const CustomDialog(
      {Key? key,
      this.applyButtonText,
      this.onPressed,
      required this.title,
      required this.body,
      required this.isButtonEnable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Wrap(
        children: [
          SizedBox(
            width: 220,
            child: SelectionArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: MyTextStyle.h3.copyWith(
                            fontWeight: FontWeight.w500,),
                      ),
                      IconButton(
                        onPressed: () {
                          //context.pop();
                        },
                        icon: const Icon(
                          Icons.cancel_rounded,
                          color: MyColors.grey,
                          size: 26,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  body,
                  const SizedBox(
                    height: 20,
                  ),
                  isButtonEnable
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child:  SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(
                                    "Close",
                                    style: MyTextStyle.h6.copyWith(
                                        fontWeight: FontWeight.w500, color: MyColors.black),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.secondaryColor,
                              ),
                              onPressed: onPressed,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  applyButtonText!,
                                  style: MyTextStyle.h6.copyWith(
                                      fontWeight: FontWeight.w500,),
                                ),
                              ),
                            )
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
