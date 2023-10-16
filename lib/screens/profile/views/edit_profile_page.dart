import 'package:aivoks_fantasy_app/custom_widgets/button_widgets.dart';
import 'package:aivoks_fantasy_app/custom_widgets/custom_text_fields.dart';
import 'package:aivoks_fantasy_app/custom_widgets/text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:aivoks_fantasy_app/screens/profile/widgets/address_details_widget.dart';
import 'package:aivoks_fantasy_app/screens/profile/widgets/kyc_verification_widget.dart';
import 'package:aivoks_fantasy_app/screens/profile/widgets/personal_info_widget.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool _selectedStep1 = true;
  bool _selectedStep2 = false;
  bool _selectedStep3 = false;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Image.asset("assets/icons/bell_icon.png", color: MyColors.white)
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _stepsInRowWidget(),
              const SizedBox(height: 16),
              _widgetSelectionOnSteps(),
              const SizedBox(height: 30),
              _buttonsWidgetCondition(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleWithNumberWidget(String text, bool tapped) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 1, color: tapped ? MyColors.mainRed : MyColors.grey3)),
      child: Center(
        child: TextWidgets.customText(
            text: text,
            color: MyColors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _stepsInRowWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _circleWithNumberWidget('1', _selectedStep1),
          const SizedBox(width: 10),
          _circleWithNumberWidget('2', _selectedStep2),
          const SizedBox(width: 10),
          _circleWithNumberWidget('3', _selectedStep3),
        ],
      ),
    );
  }

  _nextButtonForPersonalInfoWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ButtonWidgets.mainButton(
          onPressed: () {
            if (_form.currentState!.validate()) {
              setState(() {
                _selectedStep1 = false;
                _selectedStep2 = true;
                _selectedStep3 = false;
              });
            }
          },
          buttonText: "Next",
          isLoading: false),
    );
  }

  _nextButtonForAddressDetailsWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ButtonWidgets.mainButton(
          onPressed: () {
            setState(() {
              _selectedStep1 = false;
              _selectedStep2 = false;
              _selectedStep3 = true;
            });
          },
          buttonText: "Next",
          isLoading: false),
    );
  }

  _widgetSelectionOnSteps() {
    if (_selectedStep1) {
      return const PersonalInfoWidget();
    } else if (_selectedStep2) {
      return const AddressDetailsWidget();
    } else {
      return const KycVerificationPage();
    }
  }

  _buttonsWidgetCondition() {
    if (_selectedStep1) {
      return _nextButtonForPersonalInfoWidget();
    } else if (_selectedStep2) {
      return _nextButtonForAddressDetailsWidget();
    } else {
      return Container();
    }
  }
}
