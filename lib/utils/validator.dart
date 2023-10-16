class Validator {
  static String? validateFirstName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "Enter First Name";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }


  static String? validateFullName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "Enter Full Name";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  static String? validateLastName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "Enter Full Name";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  static String? validateMobile(String? value) {
    if (value!.isEmpty) {
      return "Enter Mobile Number";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Enter password";
    } else if (value.length < 8) {
      return "Password should be 8 character long";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? newPassword) {
    if (value!.isEmpty) {
      return "Enter new password";
    } else if (value.length < 8) {
      return "New Password should be 8 character long";
    } else if (value != newPassword) {
      return "Password not matched";
    }
    return null;
  }

  static String? validateOTP(String? value) {
    if (value!.length < 3) {
      return "Please fill 6 digits OTP";
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "Enter valid email";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  static String? validateDateOfBirth(String? value, int age) {
    if (value!.isEmpty) {
      return "Enter date of birth";
    }
    if (age <= 18) {
      return "You are under age!";
    }
    return null;
  }
}
