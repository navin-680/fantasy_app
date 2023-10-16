import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginController extends GetxController {

  RxBool isLoading = false.obs;
  RxString mobileNumber = ''.obs;
  RxString verificationId = ''.obs;

  void sendOtp() async {
    isLoading.value = true;
    // Implement logic to send OTP to mobile number
    // You'll use Firebase, Twilio, or a similar service for this
    // Once OTP is sent, navigate to the OTP screen
    Get.toNamed('/otp');
  }

  void verifyOtp(String otp) async {
    isLoading.value = true;
    // Implement logic to verify OTP using verificationId and OTP
    // Once OTP is verified, navigate to the home screen
    Get.offAllNamed('/landing');
  }

 /* Future<void> login() async {
    // ... Authenticate the user ...

    // Set the flag in shared preferences
    await _prefs.setBool('isLoggedIn', true);

    // Navigate to home screen
    Get.offAllNamed('/home');
  }*/
}
