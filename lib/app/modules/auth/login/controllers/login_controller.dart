import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Routes/app_routes.dart';
import '../../register/controllers/validators.dart';
import '../service/login_service.dart' show LoginService;


class LoginController extends GetxController {
  final LoginService _service = LoginService();

  // Controllers for text fields
  final TextEditingController identifierController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Observables
  var identifierError = RxnString();
  var passwordError = RxnString();
  var isValid = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Add listeners for real-time validation
    identifierController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    final identifier = identifierController.text.trim();
    final password = passwordController.text.trim();

    // Validate identifier (check mobile phone number)
   
    identifierError.value = Validators.username(identifier);
    

    // Validate password
    passwordError.value = Validators.password(password);

    // Form is valid if both fields have no error
    isValid.value = (identifierError.value == null && passwordError.value == null);
  }

Future<void> login() async {
  try {
    isLoading.value = true;

    final result = await _service.login(
      identifier: identifierController.text.trim(),
      password: passwordController.text.trim(),
    );

    print("Login response:");
    print(result);

    // Check if token exists (successful login)
    if (result.containsKey("AccessToken") && result["AccessToken"] != null) {
      
      // Optionally save token later
      // final token = result["AccessToken"];

      // Navigate to home
      Get.offAllNamed("/home");
      return;
    }

    // No token = login failed
    Get.snackbar("Error", "Login failed — invalid credentials.");

  } catch (e) {
    Get.snackbar("Error", e.toString());
  } finally {
    isLoading.value = false;
  }
}

  void goToSignup() {
    // Navigate to Signup Page
     Get.toNamed(Routes.SIGNUP);
  }
  @override
  void onClose() {
    identifierController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
