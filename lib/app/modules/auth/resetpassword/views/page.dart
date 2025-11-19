import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Widgets/main_text.dart';
import '../../../../Widgets/main_textfield.dart';
import '../../../../Widgets/gradient_button.dart';
import '../../../../Core/Utils/colors.dart';
import '../../forgetpassword/views/widgets/forget_appbar.dart';
import '../../verify/controllers/verfiy_controller.dart';

class ResetPasswordPage extends StatelessWidget {
  final PasswordRecoveryController controller = Get.put(PasswordRecoveryController());

  ResetPasswordPage({super.key});

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
        appBar: CustomAppBar(title: 'reset_password'.tr),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
             padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.06,
              ),
            child: Container(
                padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.03,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.04),
              color: AppColors.containerColor.withOpacity(0.8), 
                border: Border.all(
                  color: AppColors.containerColor, 
                  width: 1.5, 
                ),
                   
                  ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.03,),
                    CustomText(
                      text: 'reset_password_description'.tr,
                      style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                     
                    ),
                    SizedBox(height: height * 0.04),
                          
                    // 🔹 New Password Field
                    CustomTextField(
                      showToggle: true,
                          hint: 'new_password'.tr,
                          obscure: true,
                          controller:  controller.passwordController,
                          icon: Icons.lock,
                          onChanged: controller.setPassword,
                        ),
                          
                    // 🔹 Confirm Password Field
                          CustomTextField(
                             showToggle: true,
                          hint: 'confirm_password'.tr,
                          obscure: true,
                          controller: controller.confirmPasswordController,
                          icon: Icons.lock_outline,
                          onChanged: controller.setConfirmPassword,
                        ),
                         Obx(() => controller.confirmPasswordError.value.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(top: 4, left: 4),
                              child: Text(
                                controller.confirmPasswordError.value,
                                style:  TextStyle(color: Colors.white, fontSize: 0.035 * width),
                              ),
                            )
                          : const SizedBox.shrink()),
                          
                    SizedBox(height: height * 0.01),
                          
                    // 🔹 Password Rules
                    Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PasswordRuleRow(
                              text: 'password_rule_length'.tr,
                               state: controller.password.isEmpty
                              ? PasswordRuleState.empty
                              : controller.isValidLength.value
                                  ? PasswordRuleState.valid
                                  : PasswordRuleState.invalid,
                            ),
                            PasswordRuleRow(
                              text: 'password_rule_upper'.tr,
                              state: controller.password.isEmpty
                              ? PasswordRuleState.empty
                              : controller.hasUppercase.value
                                  ? PasswordRuleState.valid
                                  : PasswordRuleState.invalid,
                            ),
                            PasswordRuleRow(
                              text: 'password_rule_number'.tr,
                              state: controller.password.isEmpty
                              ? PasswordRuleState.empty
                              : controller.hasNumber.value
                                  ? PasswordRuleState.valid
                                  : PasswordRuleState.invalid,
                            ),
                            PasswordRuleRow(
                              text: 'password_rule_special'.tr,
                               state: controller.password.isEmpty
                              ? PasswordRuleState.empty
                              : controller.hasSpecialChar.value
                                  ? PasswordRuleState.valid
                                  : PasswordRuleState.invalid,
                            ),
                          ],
                        )),
                          
                    SizedBox(height: height * 0.05),
                          
                    // 🔹 Submit Button
                    Obx(() => GradientButton(
                          text: "create_password".tr,
                          onPressed: controller.isLoading.value
                              ? () {}
                              : controller.submitNewPassword,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



enum PasswordRuleState { empty, valid, invalid }

class PasswordRuleRow extends StatelessWidget {
  final String text;
  final PasswordRuleState state;

  const PasswordRuleRow({
    super.key,
    required this.text,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    IconData? icon;
    Color color;

    switch (state) {
      case PasswordRuleState.empty:
        icon = Icons.security;
        color = AppColors.secondaryfontColor; // blue
        break;
      case PasswordRuleState.valid:
        icon = Icons.check;
        color = const Color.fromARGB(255, 47, 255, 0); // green
        break;
      case PasswordRuleState.invalid:
        icon = Icons.close;
        color = const Color.fromARGB(255, 255, 32, 32); // red
        break;
    }

    return Row(
      children: [
        if (icon != null)
          Icon(
            icon,
            color: color,
            size: 22,
          ),
        if (icon != null) const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(color:color),
        ),
      ],
    );
  }
}
