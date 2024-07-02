import 'package:intl_phone_field/phone_number.dart';

class Validator {
  static String? isValidName(String? value) {
    if (value!.isEmpty) {
      return "Invalid Name";
    } else if (value.length < 3) {
      return "Invalid Name";
    } else {
      return null;
    }
  }

  static String? isValidPin(String? value) {
    if (value!.isEmpty) {
      return "الرجاء إدخال رمز PIN صالح";
    } else if (value.length != 4) {
      return "الرجاء إدخال 4 أرقام";
    } else {
      return null;
    }
  }

  static String? isValidNumber(String? value) {
    if (value!.isEmpty) {
      return 'Please enter valid name';
    } else if (value.length <= 10) {
      return 'Number length must be 10 digits';
    } else {
      return null;
    }
  }

   Future<String?> isValidPhoneNumber(PhoneNumber? phone) async  {
    if (phone!.completeNumber.isEmpty) {
      return 'Please enter valid name';
    } else if (phone.completeNumber.length <= 10) {
      return 'Number length must be 10 digits';
    } else {
      return null;
    }
  }

  static String? isValidIdNumber(String? id) {
    if (id!.isEmpty) {
      return "الرجاء إدخال رقم هوية صحيح";
    } else if (id.length != 10) {
      return "يجب أن يتكون رقم الهوية من 10 أرقام";
    } else {
      return null;
    }
  }

  static String? isValidPassword(String? value) {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');

    if (value!.isEmpty) {
      return '\u{2139} Invalid Password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (passwordRegExp.hasMatch(value)) {
      return 'Password must include at least one uppercase, one lowercase, one number, and one special character';
    } else {
      return null;
    }
  }

  static String? isValidEmail(String? email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if(regex.hasMatch(email!)) {
      return null;
    }else {
      return "Invalid Email";
    }
  }

}
