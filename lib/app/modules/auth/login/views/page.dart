import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safarisooqapp/App/Widgets/gradient_main_text.dart';

import '../../../../Core/Utils/colors.dart' show AppColors;
import '../../../../Routes/app_routes.dart';
import '../../../../Widgets/gradient_button.dart';
import '../../../../Widgets/main_text.dart';
import '../../../../Widgets/main_textfield.dart';
import '../controllers/login_controller.dart';
import 'widgets/auth_form.dart';

class LoginPage extends StatelessWidget {
   final LoginController controller = Get.put(LoginController());

 

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.scaffoldGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, 
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: height * 0.08),

                // 🔹 العنوان
                CustomText(
                  text: "start_journey".tr,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: AppColors.white),
                ),
                SizedBox(height: height * 0.08),

                // 🔹 الفورم
                AuthFormContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CustomText(
                          text: "app_name".tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: AppColors.white),
                        ),
                      ),
                      SizedBox(height: height * 0.06),

                      // Email
                      CustomTextField(
                        hint: "mobile_phone".tr,
                        controller:  controller.identifierController,
                        icon: Icons.phone,
                      ),
                      SizedBox(height: height * 0.01),

                      // Password
                      CustomTextField(
                        hint: "password".tr,
                        obscure: true,
                        controller: controller.passwordController,
                        icon: Icons.lock,
                         showToggle: true,
                      ),

                      // 🔹 Forgot password inside form
                     Align(
                      alignment: Get.locale?.languageCode == 'en'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.FORGETPASSWORD);
                        },
                        child: Text(
                          "forgot_password".tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),


                      SizedBox(height: height * 0.06),

                      // 🔹 زر Login
                      Center(
                        child: GradientButton(
                          text: "login".tr,
                         
                          onPressed: () {
                            controller.login();
                          },
                        ),
                      ),

                      SizedBox(height: height * 0.02),

                 
                      Center(
                        child: TextButton(
                        onPressed: () {
                          // TODO: navigate to Signup Page
                          controller.goToSignup;
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "dont_have_account_1".tr,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                 recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  controller.goToSignup();
                                  
                                },
                                text: " " + "dont_have_account_2".tr,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color:AppColors.secondaryfontColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
