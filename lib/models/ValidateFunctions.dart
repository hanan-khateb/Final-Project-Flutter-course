import 'package:regexpattern/regexpattern.dart';

class ValidateFunctions {
  static String validatePassword(String value) {
    /// Password (Easy) Regex
    /// Allowing all character except 'whitespace'
    /// Minimum character: 8

    /// Password (Hard) Regex
    /// Allowing all character except 'whitespace'
    /// Must contains at least: 1
    /// uppercase letter, 1
    ///  lowecase letter,
    ///  1 number,
    ///  1 special character (symbol)
    /// Minimum character: 8
    bool isHardPassword = value.isPasswordEasy();
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!isHardPassword)
        return 'Enter a hard password';
      else
        return null;
    }
  }

  static String validateEmail(String value) {
    bool isEmail = value.isEmail();
    if (value.isEmpty) {
      return 'Email is required';
    } else {
      if (!isEmail)
        return 'Enter valid Email';
      else
        return null;
    }
  }

  static String validatePhone(String value) {
    /// Phone Number regex
    /// Must started by either, "0", "+", "+XX <X between 2 to 4 digit>", "(+XX <X between 2 to 3 digit>)"
    /// Can add whitespace separating digit with "+" or "(+XX)"
    /// Example: 05555555555, +555 5555555555, (+123) 5555555555, (555) 5555555555, +5555 5555555555
    bool isPhone = value.isPhone();
    if (value.isEmpty) {
      return 'Phone number is required';
    } else {
      if (!isPhone)
        return 'Enter valid Phone number';
      else
        return null;
    }
  }

  static String validateAge(String value) {
    bool isRealAge = false;
    if (int.tryParse(value) != null) {
      isRealAge =
          (int.tryParse(value) < 120 && int.tryParse(value) > 6) ? true : false;
    }
    if (value.isEmpty) {
      return 'Age is required';
    } else {
      if (!isRealAge)
        return 'Enter valid Age';
      else
        return null;
    }
  }
}
