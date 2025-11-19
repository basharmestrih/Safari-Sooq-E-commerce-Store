import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Routes/app_routes.dart';

class OnboardingController extends GetxController {
  var currentFeatureIndex = 0.obs;
   var currentLocale = const Locale('ar').obs; // default Arabic
     void changeLanguage(String langCode) {
    var locale = Locale(langCode);
    currentLocale.value = locale;
    Get.updateLocale(locale);
  }


  // Features list (icons + descriptions only)
final List<Map<String, dynamic>> features = [
  {
    "icon": Icons.local_offer,
    "desc": "feature1_desc", // just the key
  },
  {
    "icon": Icons.security,
    "desc": "feature2_desc",
  },
  {
    "icon": Icons.access_time,
    "desc": "feature3_desc",
  },
];


  RxBool get isLastFeature => (currentFeatureIndex.value == features.length - 1).obs;

  final PageController pageController = PageController();

  void changePage(int index) {
    currentFeatureIndex.value = index;
  }

  void goToNextPage() {
    if (currentFeatureIndex.value < features.length - 1) {
      currentFeatureIndex.value++;
      pageController.animateToPage(
        currentFeatureIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToLogin() {
    // Navigate to Login Page
    Get.toNamed(Routes.LOGIN);
  
  }
    void goToHome() {
    // Navigate to Login Page
    Get.toNamed(Routes.OTP);
  
  }

  void goToSignup() {
    // Navigate to Signup Page
     Get.toNamed(Routes.HOME);
  }
}
