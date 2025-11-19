import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../forgetpassword/services/forget_password_service.dart';
import '../../register/controllers/validators.dart';
import '../../resetpassword/services/reset_password_service.dart';
import '../../verify/service/verify_service.dart';
import '../../../../Routes/app_routes.dart';

class PasswordRecoveryController extends GetxController {
  final ForgetPasswordService forgetService = ForgetPasswordService();
  final VerifyService verifyService = VerifyService();

  // State
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  var userNameOrPhoneNumber = ''.obs;
  var code = ''.obs;

  var password = ''.obs;
  var confirmPassword = ''.obs;

  var passwordError = "".obs;
  var confirmPasswordError = "".obs;
    String resetToken = '';


  // Password validator flags
  var isValidLength = false.obs;
  var hasUppercase = false.obs;
  var hasNumber = false.obs;
  var hasSpecialChar = false.obs;

  var isLoading = false.obs;

  // Timer state for OTP resend
  var canResend = true.obs;
  var secondsRemaining = 0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startCountdown();
  }

  // Setters
void setUserNameOrPhone(String value) =>
 userNameOrPhoneNumber.value = value;

void setCode(String value) {
  print('Setting code to: $value');
  code.value = value;
}

void setPassword(String value) {
  password.value = value;

  // Validation rules
  isValidLength.value = value.length >= 8;
  hasUppercase.value = RegExp(r'[A-Z]').hasMatch(value);
  hasNumber.value = RegExp(r'\d').hasMatch(value);
  hasSpecialChar.value = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);

  // Custom validation messages (from Validators class if available)
  passwordError.value = Validators.password(value) ?? "";

  // Revalidate confirm password too (when password changes)
  if (confirmPassword.value.isNotEmpty) {
    confirmPasswordError.value = Validators.confirmPassword(
      password.value,
      confirmPassword.value,
    ) ?? "";
  }
}

void setConfirmPassword(String value) {
  confirmPassword.value = value;

  // Validate match
  confirmPasswordError.value =
      Validators.confirmPassword(password.value, value) ??
      (password.value != value ? "Passwords do not match" : "");
}

void setResetTokenAndUser(String token) {
    resetToken = token ;}

// Forgot password (Request OTP)
Future<void> sendOtp(userNameOrPhoneNumber) async {
    try {
      print(userNameOrPhoneNumber);
      isLoading.value = true;

      final result = await forgetService.forgetpassword(
        userNameOrPhoneNumber: userNameOrPhoneNumber,
      );
      setUserNameOrPhone(userNameOrPhoneNumber);

      print("OTP request response:");
      print(result);

      // Assuming API sends OTP successfully
      if (result['success'] == true) {
        Get.snackbar("Success", "OTP sent successfully!");
        _startCountdown();
      } else {
        Get.snackbar("Error", result['message'] ?? "Failed to send OTP");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

Future<void> verifyOtp() async {
  if (code.value.length < 6) return;
  print(code.value);

  isLoading.value = true;
  try {
    final result = await verifyService.verifyCode(
      phone: userNameOrPhoneNumber.value,
      code: code.value,
    );

    final resetToken = result['resetToken'];

    if (resetToken != null && resetToken.isNotEmpty) {
        setResetTokenAndUser(resetToken);


      Get.offNamed(
        Routes.RESETPASSWORD,

      );
    } else {
      print(result);
      Get.snackbar("Error", result['message'] ?? "Invalid or expired OTP code");
    }
  } catch (e) {
    print(e);
    Get.snackbar("Error", e.toString());
  } finally {
    isLoading.value = false;
  }
}

Future<void> submitNewPassword() async {
    if (password.value.isEmpty || confirmPassword.value.isEmpty) {
      Get.snackbar("Error", "Please fill out all fields");
      return;
    }

    if (password.value != confirmPassword.value) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    isLoading.value = true;
    try {
      final response = await resetPassword(
        userNameOrPhoneNumber: userNameOrPhoneNumber.value,
        resetToken: resetToken,
        newPassword: password.value,
        confirmNewPassword: confirmPassword.value,
      );

      if (response['success'] == true) {
        print(response);
        Get.offAllNamed(Routes.LOGIN);
        Get.snackbar("Success", "Password updated successfully");
      } else {
        Get.snackbar("Error", response['message'] ?? "Something went wrong");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }




  // Timer for resend OTP button
  void _startCountdown() {
    canResend.value = false;
    secondsRemaining.value = 20;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel();
        canResend.value = true;
      }
    });
  }

  // Resend code
  void resendCode() {
    if (!canResend.value) return;

    //sendOtp();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
