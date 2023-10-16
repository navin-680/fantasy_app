import 'package:aivoks_fantasy_app/custom_widgets/button_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String? _selectedItem;
  bool _dropdownVisible = false;

  final List<String> _dropdownItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back, color: MyColors.white)),
        title: TextWidgets.customText(
            text: "Address Info",
            color: MyColors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.w500),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _textFieldHeadTextWidget('Address1'),
            _textFieldWidget(),
            const SizedBox(height: 8),
            _textFieldHeadTextWidget('Address2'),
            _textFieldWidget(),
            const SizedBox(height: 8),
            _textFieldHeadTextWidget('Pin Code'),
            _textFieldWidget(),
            const SizedBox(height: 8),
            _textFieldHeadTextWidget('City'),
            _textFieldWidget(),
            const SizedBox(height: 8),
            _textFieldHeadTextWidget('State'),
            Stack(
              children: [
                _textFieldWidget(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _dropdownVisible = !_dropdownVisible;
                      });
                    },
                    child: const Icon(Icons.arrow_drop_down),
                  ),
                ),
                if (_dropdownVisible)
                  Positioned(
                    top: 40.0,
                    right: 20.0,
                    left: 20.0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: _dropdownItems.map((item) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                _selectedItem = item;
                                //_textEditingController.text = item;
                                _dropdownVisible = false;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(item),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 30),
            _submitButton()
          ],
        ),
      ),
    );
  }

  Widget _textFieldHeadTextWidget(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextWidgets.customText(
          text: text,
          color: MyColors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w500),
    );
  }

  Widget _textFieldWidget({Widget? suffixIcon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: "", suffixIcon: suffixIcon),
        ),
      ),
    );
  }

  _submitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ButtonWidgets.mainButton(
          onPressed: () {}, buttonText: "Done", isLoading: false),
    );
  }
}
