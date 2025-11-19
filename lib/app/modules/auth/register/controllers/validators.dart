import 'package:get/get.dart';

class Validators {
  // Username: 0-50 characters
  static String? username(String value) {
    if (value.isEmpty) return "username_required".tr;
     if (value.length < 3) return "username_min_3".tr;
    if (value.length > 50) return "username_max_50".tr;
    return null;
  }

  // First/Last name: 3-32 characters
  static String? name(String value, String field) {
    if (value.isEmpty) return "${field}_required".tr;
    if (value.length < 3) return "${field}_min_3".tr;
    if (value.length > 32) return "${field}_max_32".tr;
    return null;
  }

  // Email: basic check with @ and gmail.com
  static String? email(String value) {
    if (value.isEmpty) return "email_required".tr;
    if (!value.contains('@') || !value.contains('gmail.com')) {
      return "email_invalid".tr;
    }
    return null;
  }

  // Password: min 8, 1 capital, 1 number, 1 special
  static String? password(String value) {
    if (value.isEmpty) return "password_required".tr;
    if (value.length < 8) return "password_min_8".tr;
    if (!RegExp(r'[A-Z]').hasMatch(value)) return "password_uppercase".tr;
    if (!RegExp(r'\d').hasMatch(value)) return "password_number".tr;
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) return "password_special".tr;
    return null;
  }

  // Confirm password: must match password
  static String? confirmPassword(String password, String confirm) {
    if (confirm.isEmpty) return "confirm_password_required".tr;
    if (password != confirm) return "passwords_not_match".tr;
    return null;
  }

  // Mobile phone: must start with +
  static String? mobile(String value) {
    if (value.isEmpty) return "mobile_required".tr;
    if (!value.startsWith('+')) return "mobile_start_plus".tr;
    return null;
  }

  // Gender: must have value 0 or 1
  static String? gender(String value) {
    if (value.isEmpty) return "gender_required".tr;
    if (value != "0" && value != "1") return "gender_invalid".tr;
    return null;
  }

  // Country: must have value 0 or 1
  static String? country(String value) {
    if (value.isEmpty) return "country_required".tr;
    if (value != "0" && value != "1") return "country_invalid".tr;
    return null;
  }
}
