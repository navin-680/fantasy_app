import 'dart:io';

import 'package:aivoks_fantasy_app/custom_widgets/button_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/custom_text_fields.dart';
import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VerifyPanPage extends StatefulWidget {
  const VerifyPanPage({super.key});

  @override
  State<VerifyPanPage> createState() => _VerifyPanPageState();
}

class _VerifyPanPageState extends State<VerifyPanPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, actions: [
        Image.asset("assets/icons/bell_icon.png", color: MyColors.white)
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              _adharHeadTextColumnWidget(),
              const SizedBox(height: 60),
              TextFieldsWidget.textFieldForPAN(
                  controller, 'Pan Number*', 'Enter Aadhaar Number'),
              const SizedBox(height: 30),
              _uploadingContainer(),
              LinearProgressIndicator(
                  backgroundColor: MyColors.green.withOpacity(0.2),
                  color: MyColors.green,
                  semanticsLabel: 'Linear progress indicator'),
              const SizedBox(height: 100),
              _uploadAndTakePhotoRow(),
              const SizedBox(height: 20),
              _nextButtonForPersonalInfoWidget(),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }

  Widget _adharHeadTextColumnWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgets.customText(
            text: 'Verify Pan',
            color: MyColors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w700),
        const SizedBox(height: 10),
        TextWidgets.customText(
            text: 'Enter your Pan number for verify your registered\naccount.',
            color: MyColors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
      ],
    );
  }

  Widget _nextButtonForPersonalInfoWidget() {
    return ButtonWidgets.mainButton(
        onPressed: () {
          //Get.toNamed('verifyAdharWidget');
        },
        buttonText: "Next",
        isLoading: false);
  }

  _uploadAndTakePhotoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: (){
                _addImage();
              },
              child: Container(
                height: 51,
                width: 51,
                decoration: const BoxDecoration(
                    color: MyColors.mainRed, shape: BoxShape.circle),
                child: const Icon(Icons.upload, color: MyColors.white),
              ),
            ),
            const SizedBox(height: 8),
            TextWidgets.customText(
                text: 'Upload File',
                color: MyColors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w500),
          ],
        ),
        InkWell(
          onTap: () {
            _captureImage();
          },
          child: Column(
            children: [
              Container(
                height: 51,
                width: 51,
                decoration: const BoxDecoration(
                    color: MyColors.mainRed, shape: BoxShape.circle),
                child: const Icon(Icons.camera_alt, color: MyColors.white),
              ),
              const SizedBox(height: 8),
              TextWidgets.customText(
                  text: 'Take Photo',
                  color: MyColors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
      ],
    );
  }

  _uploadingContainer() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.grey),
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/icons/jpg_icon.png"),
          TextWidgets.customText(
              text: 'Uploading',
              color: MyColors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w400),
          TextWidgets.customText(
              text: '75%',
              color: MyColors.green,
              fontSize: 14.0,
              fontWeight: FontWeight.w600),
        ],
      ),
    );
  }

File? _img;

  String? _imagePath;

  Future<void> _addImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    print(image?.path);
    setState(() {
      _imagePath = image?.path;
    });
  }

  Future<void> _captureImage() async {
    final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageFile == null) {
      // User canceled the image capture
      return;
    }

    // Do something with the captured image, e.g., display it or save it.
    // In this example, we'll display it in a new page.
    /*Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayPictureScreen(imagePath: imageFile.path),
      ),
    );*/
  }

}
