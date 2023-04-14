class AppValidator {
  static const String phoneRegExp = r'[0-9]';
  static const String emailRegExp = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String passwordRegExp = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~_%^]).{8,}$';

  static String? emailValidator(String? value) {
    const Pattern pattern = emailRegExp;
    final RegExp regex = RegExp(pattern.toString());
    if (value!.isEmpty) {
      return 'Please enter email';
    } else if (!regex.hasMatch(value)) {
      return 'Please enter valid email';
    } else {
      '';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    const Pattern pattern = phoneRegExp;
    final RegExp regex = RegExp(pattern.toString());
    if (value!.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regex.hasMatch(value)) {
      return 'Please enter valid mobile number';
    } else {
      '';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter Password';
    } else if (!(RegExp(passwordRegExp).hasMatch(value.trim()))) {
      return 'Password must be Uppercase,Lowercase,digit and specialCharacters';
    } else {
      return null;
    }
  }

  String? confirmPasswordValidator(String? value, {required String password}) {
    if (value!.isEmpty) {
      return 'Please enter Password';
    } else if (!(RegExp(passwordRegExp).hasMatch(value.trim()))) {
      return 'Password must be Uppercase,Lowercase,digit and specialCharacters';
    } else {
      return null;
    }
  }

  static String? otpValidation(String? value) {
    if (value!.isEmpty) {
      return "Please fill 6 digit code";
    } else if (value.length <= 5) {
      return "Please fill 6 digit code";
    } else {
      return null;
    }
  }
}
