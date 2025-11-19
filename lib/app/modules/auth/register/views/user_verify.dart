import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../Core/Utils/colors.dart';
import '../../../../Widgets/main_text.dart';
import '../../forgetpassword/views/widgets/forget_appbar.dart';
import '../../verify/views/widgets/otp_textfield.dart';
import '../controllers/register_controller.dart';

class UserVerifyPage extends StatelessWidget {
  UserVerifyPage({super.key});

  final RegisterController controller =
      Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.scaffoldGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(title: "verify_code".tr),
        body: Stack(
          children: [
            // Main content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.1),
                  CustomText(
                    text: "verify_code_helper".tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColors.white),
                  ),
                  SizedBox(height: height * 0.12),
                  OtpTextField(
                    controller: controller ,
                    length: 6,
                  ),
                  SizedBox(height: height * 0.15),
                  // Resend Code
                  Obx(() {
                    if (controller.canResend.value &&
                        !controller.isLoading.value) {
                      return GestureDetector(
                        onTap: controller.resendCode,
                        child: Text(
                          "resend_code".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      );
                    } else {
                      return Text(
                        controller.isLoading.value
                            ? "verifying...".tr
                            : "resend_in".trParams({
                                "seconds": controller.secondsRemaining.value
                                    .toString()
                              }),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      );
                    }
                  }),
                ],
              ),
            ),

            // Blur + Loader
            Obx(() {
              if (!controller.isLoading.value) return const SizedBox.shrink();
              return Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                      child: SpinKitCircle(
                        color: Colors.white,
                        size: width * 0.25,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
