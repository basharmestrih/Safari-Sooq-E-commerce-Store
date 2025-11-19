import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Utils/colors.dart';
import '../../../../Widgets/gradient_button.dart';
import '../../../../Widgets/main_button.dart';
import '../../controllers/onboarding_controller.dart';
import 'package:get/get.dart';


class OnboardingSwiper extends GetView<OnboardingController> {
  const OnboardingSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Column(
      children: [
        // ===== PageView with icon + description =====
        Expanded(
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.features.length,
            onPageChanged: controller.changePage,
            itemBuilder: (context, index) {
              final feature = controller.features[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    feature["icon"] as IconData,
                    size: width * 0.2,
                    color: Colors.white,
                  ),
                  SizedBox(height: height * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Text(
                     feature["desc"].toString().tr,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        SizedBox(height: height * 0.03),

        // ===== Dots Indicator =====
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.features.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: width * 0.015),
                  width: controller.currentFeatureIndex.value == index
                      ? width * 0.025
                      : width * 0.02,
                  height: width * 0.025,
                  decoration: BoxDecoration(
                    color: controller.currentFeatureIndex.value == index
                        ? Colors.white
                        : Colors.white54,
                    borderRadius: BorderRadius.circular(width * 0.02),
                  ),
                ),
              ),
            )),

        SizedBox(height: height * 0.05),

        // ===== Bottom Buttons =====
        Obx(() {
          final isLast = controller.isLastFeature.value;

          if (isLast) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.03 ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  GradientButton(
                    onPressed: controller.goToHome,
                    text:
                        "guest".tr,
                    width: width * 0.77,
                      
                    
                  ),
                   SizedBox(height: height * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: GradientButton(
                          text: "login".tr,
                          onPressed: controller.goToLogin,
                          fontcolor: AppColors.white,
                        ),
                      ),
                      SizedBox(width: width * 0.04),
                      Expanded(
                        child: GradientButton(
                          text: "signup".tr,
                          onPressed: controller.goToSignup,
                          fontcolor: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                 
                ],
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(bottom: height * 0.04),
              child: GradientButton(
                          text: "next".tr,
                          onPressed: controller.goToNextPage,
                        ),
            );
          }
        }),
      ],
    );
  }
}
