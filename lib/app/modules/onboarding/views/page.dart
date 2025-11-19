import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Utils/colors.dart';
import '../controllers/onboarding_controller.dart';
import 'widgets/features_swiper.dart';
import 'widgets/lang_dropdown.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.scaffoldGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.1),

                    // ===== Welcome Text =====
                    Text(
                      'welcome_text'.tr,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.04),

                    // ===== Features Swiper =====
                    const Expanded(child: OnboardingSwiper()),
                  ],
                ),
              ),

              // ===== Language Dropdown Top Right =====
              Positioned(
                top: 16,
                right: 16,
                child: LanguageDropdown(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
