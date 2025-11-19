import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Utils/colors.dart';
import '../../../../data/models/user_model.dart';
import '../services/register_service.dart';
import '../services/verification_service.dart' show VerificationService;
import 'validators.dart';

class RegisterController extends GetxController {
  // ===== Text controllers =====
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobilePhoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isValidLength = false.obs;
  var hasUppercase = false.obs;
  var hasNumber = false.obs;
  var hasSpecialChar = false.obs;

  // ===== Gender + Birthdate + Country =====
  final gender = "".obs;
  final country = "".obs;
  final birthDate = Rxn<DateTime>();
    var password = ''.obs;


  // ===== Validation messages =====
  final usernameError = "".obs;
  final firstNameError = "".obs;
  final lastNameError = "".obs;
  final emailError = "".obs;
  final mobileError = "".obs;
  final passwordError = "".obs;
  final confirmPasswordError = "".obs;
  var verificationMethod = 'whatsapp'.obs;

  final genderError = "".obs;
  final countryError = "".obs;

  // ===== OTP Resend Timer =====
var canResend = false.obs;
var secondsRemaining = 60.obs;
Timer? _resendTimer;

// Start countdown for resend
void startResendTimer() {
  canResend.value = false;
  secondsRemaining.value = 60;

  _resendTimer?.cancel();
  _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
    if (secondsRemaining.value > 0) {
      secondsRemaining.value--;
    } else {
      canResend.value = true;
      timer.cancel();
    }
  });
}

  // ===== Loading state =====
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // In onInit(), add listener to passwordController
passwordController.addListener(() {
  final value = passwordController.text;
      // 👇 keep password observable updated
    password.value = value;
  isValidLength.value = value.length >= 8;
  hasUppercase.value = RegExp(r'[A-Z]').hasMatch(value);
  hasNumber.value = RegExp(r'\d').hasMatch(value);
  hasSpecialChar.value = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);

  passwordError.value = Validators.password(value) ?? "";
  confirmPasswordError.value =
      Validators.confirmPassword(value, confirmPasswordController.text) ?? "";
});

    // Real-time validation
    usernameController.addListener(() {
      usernameError.value = Validators.username(usernameController.text) ?? "";
    });
    firstNameController.addListener(() {
      firstNameError.value =
          Validators.name(firstNameController.text, "first_name") ?? "";
    });
    lastNameController.addListener(() {
      lastNameError.value =
          Validators.name(lastNameController.text, "last_name") ?? "";
    });
    emailController.addListener(() {
      emailError.value = Validators.email(emailController.text) ?? "";
    });
    mobilePhoneController.addListener(() {
      mobileError.value = Validators.mobile(mobilePhoneController.text) ?? "";
    });
    passwordController.addListener(() {
      passwordError.value =
          Validators.password(passwordController.text) ?? "";
      confirmPasswordError.value = Validators.confirmPassword(
              passwordController.text, confirmPasswordController.text) ??
          "";
    });
    confirmPasswordController.addListener(() {
      confirmPasswordError.value = Validators.confirmPassword(
              passwordController.text, confirmPasswordController.text) ??
          "";
    });
    gender.listen((val) {
      genderError.value = Validators.gender(val) ?? "";
    });
    country.listen((val) {
      countryError.value = Validators.country(val) ?? "";
    });
  }
  

  // ===== Dropdown selection =====
  void selectGender(String? value) {
   

    gender.value = value ?? "";
    genderError.value =
        value == null || value.isEmpty ? "select_gender_error".tr : "";
  }

    int get genderInt {
    switch (gender.value) {
      case "0":
        return 1; // male
      case "1":
        return 2; // female
      default:
        return 0; // unknown / not selected
    }
  }


  void selectCountry(String? value) {
    country.value = value ?? "";
    countryError.value =
        value == null || value.isEmpty ? "select_country_error".tr : "";
  }

  // ===== Select BirthDate =====
  void selectBirthDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
       builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.containerColor,   // header background
            onPrimary: Colors.white,    // header text color
            onSurface: Colors.black,    // body text color
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.containerColor,  // buttons color
            ),
          ),
        ),
        child: child!,
      );
    },
    );
    if (picked != null) birthDate.value = picked;
  }

  // ===== Sign Up =====
  Future<void> signUp() async {
    // Validate
    usernameError.value = Validators.username(usernameController.text) ?? "";
    firstNameError.value =
        Validators.name(firstNameController.text, "first_name") ?? "";
    lastNameError.value =
        Validators.name(lastNameController.text, "last_name") ?? "";
    emailError.value = Validators.email(emailController.text) ?? "";
    mobileError.value = Validators.mobile(mobilePhoneController.text) ?? "";
    passwordError.value = Validators.password(passwordController.text) ?? "";
    confirmPasswordError.value = Validators.confirmPassword(
    passwordController.text, confirmPasswordController.text) ??"";
    genderError.value = Validators.gender(gender.value) ?? "";
    countryError.value = Validators.country(country.value) ?? "";



    if (usernameError.value.isEmpty &&
        firstNameError.value.isEmpty &&
        lastNameError.value.isEmpty &&
        emailError.value.isEmpty &&
        mobileError.value.isEmpty &&
        passwordError.value.isEmpty &&
        confirmPasswordError.value.isEmpty &&
        genderError.value.isEmpty
        ) {
      final user = User(
        email: emailController.text.trim(),
        userName: usernameController.text.trim(),
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        mobile: mobilePhoneController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
        gender: genderInt,
        birthDate: birthDate.value ?? DateTime(2000, 1, 1),
        countryId: 2,
      );
      int otpReceiver = 1; 
      switch (verificationMethod.value) {
        case 'sms':
          otpReceiver = 2;
          break;
        case 'email':
          otpReceiver = 1;
          break;
        case 'whatsapp':
        default:
          otpReceiver = 3;
      }
      // Print the payload before sending
    final payload = {
      "user": user.toJson(),
      "otpReceiver": otpReceiver,
    };
    print("=== Registration Payload ===");
    print(payload);

          isLoading.value = true;

          final result = await RegisterService.register(user, otpReceiver);
          print(result);

          isLoading.value = false;

          if (result["success"]) {
            Get.snackbar("Success", "Account created successfully");
            Get.offAllNamed("/userverify");
          } else {
            Get.snackbar("Error", result["message"]);
          }
    } else {
      Get.snackbar("Error", "Please check all fields");
    }
  }


// ===== Verify OTP =====
Future<void> verifyOtp(String code) async {
  if (usernameController.text.isEmpty &&
      mobilePhoneController.text.isEmpty &&
      emailController.text.isEmpty) {
    Get.snackbar("Error", "Please provide a username, email, or phone");
    return;
  }

  isLoading.value = true;

  try {
    final payload = {
      "userNameOrPhoneNumber": usernameController.text.isNotEmpty
          ? usernameController.text.trim()
          : mobilePhoneController.text.trim(),
      "purpose": 0, 
      "code": code,
    };

    final result = await VerificationService.verifyCode(payload);

    if (result["success"]) {
      Get.snackbar("Success", "Verification completed!");

      Get.offAllNamed("/home"); 

    } else {

      Get.snackbar("Error", result["message"]);
    }
  } catch (e) {
    Get.snackbar("Error", e.toString());
  } finally {
    isLoading.value = false;
  }
}

// Call this to send OTP initially or resend
Future<void> resendCode() async {
  if (usernameController.text.isEmpty &&
      mobilePhoneController.text.isEmpty &&
      emailController.text.isEmpty) {
    Get.snackbar("Error", "Please provide a username, email, or phone");
    return;
  }

  isLoading.value = true;

  try {
    final payload = {
      "userNameOrPhoneNumber": usernameController.text.isNotEmpty
          ? usernameController.text.trim()
          : mobilePhoneController.text.trim(),
      "purpose": 0,
      "code": "", // empty code when sending
    };

    final result = await VerificationService.verifyCode(payload);

    if (result["success"]) {
      Get.snackbar("Success", "OTP sent successfully!");
      startResendTimer(); // start countdown
    } else {
      Get.snackbar("Error", result["message"]);
    }
  } catch (e) {
    Get.snackbar("Error", e.toString());
  } finally {
    isLoading.value = false;
  }
}




  void loginRedirect() {
    Get.back();
  }
}

