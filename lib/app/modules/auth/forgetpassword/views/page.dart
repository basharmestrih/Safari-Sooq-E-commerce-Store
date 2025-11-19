import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safarisooqapp/App/Widgets/gradient_button.dart';
import '../../../../Core/Utils/colors.dart';
import '../../../../Routes/app_routes.dart';
import '../../../../Widgets/main_button.dart';
import '../../../../Widgets/main_text.dart';
import '../../../../Widgets/main_textfield.dart';
import '../../verify/controllers/verfiy_controller.dart';

import 'widgets/forget_appbar.dart';

class ForgetPasswordPage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
   final PasswordRecoveryController controller = Get.put(PasswordRecoveryController());


  ForgetPasswordPage({super.key});

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
        appBar: CustomAppBar(title: 'forgot_password'.tr,),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.1),
          
                // 🔹 Helper text
                CustomText(
                  text: "forget_password_helper".tr,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.white,
                      ),
                ),
          
                SizedBox(height: height * 0.1),
          
                // 🔹 Email / Username field
                CustomTextField(
                  hint: "mobile_phone".tr,
                  controller: phoneController,
                  icon: Icons.phone,
                ),
          
                SizedBox(height: height * 0.085),
          
                // 🔹 Submit button
               Obx(() {
              return GradientButton(
                width: 0.7 * width,
                text: controller.isLoading.value ? "sending_code".tr : "submit".tr,
                onPressed: () async {
                  await controller.sendOtp(phoneController.text.trim());
                  if (!controller.isLoading.value) {
                    Get.toNamed(Routes.OTP);
                    
                  }
                },
              );
            }),
          
                 SizedBox(height: height * 0.075),
                
                TextButton(
                  child:
                  Text("back_to_login".tr,
                  style: Theme.of(context).textTheme.bodySmall), onPressed: () { Get.toNamed(Routes.LOGIN); },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
