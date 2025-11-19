import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Core/Utils/colors.dart';
import '../../../../../Widgets/custom_gender_selector.dart';
import '../../../../../Widgets/main_datefield.dart';
import '../../../../../Widgets/main_dropdownfield.dart';
import '../../../../../Widgets/main_text.dart';
import '../../../../../Widgets/main_textfield.dart';
import '../../../resetpassword/views/page.dart';
import '../../controllers/register_controller.dart';
import 'signup_buttons.dart';
import 'verification_box.dart';

class SignUpForm extends GetView<RegisterController> {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(width * 0.05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.04),
          color: AppColors.containerColor.withOpacity(0.8),
          border: Border.all(
            color: AppColors.containerColor,
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ===== Info Data =====
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "info_data".tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(height: height * 0.015),
      
            CustomTextField(
              controller: controller.firstNameController,
              hint: 'first_name'.tr,
              icon: Icons.badge,
            ),
            Obx(() => controller.firstNameError.value.isEmpty
                ? SizedBox.shrink()
                : Text(
                    controller.firstNameError.value,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )),
      
            CustomTextField(
              controller: controller.lastNameController,
              hint: 'last_name'.tr,
              icon: Icons.badge_outlined,
            ),
            Obx(() => controller.lastNameError.value.isEmpty
                ? SizedBox.shrink()
                : Text(
                    controller.lastNameError.value,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )),
      
            CustomTextField(
              controller: controller.usernameController,
              hint: 'username'.tr,
              icon: Icons.person,
            ),
            Obx(() => controller.usernameError.value.isEmpty
                ? SizedBox.shrink()
                : Text(
                    controller.usernameError.value,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )),
      
            SizedBox(height: height * 0.03),
      
            // ===== Contact Info =====
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "contact_info".tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(height: height * 0.015),
      
            CustomTextField(
              controller: controller.emailController,
              hint: 'email'.tr,
              icon: Icons.email_outlined,
            ),
            Obx(() => controller.emailError.value.isEmpty
                ? SizedBox.shrink()
                : Text(
                    controller.emailError.value,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )),
      
            CustomTextField(
              controller: controller.mobilePhoneController,
              hint: 'mobile_phone'.tr,
              icon: Icons.phone,
            ),
            Obx(() => controller.mobileError.value.isEmpty
                ? SizedBox.shrink()
                : Text(
                    controller.mobileError.value,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )),
      
            SizedBox(height: height * 0.03),
      
            // ===== Security Info =====
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "security_info".tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(height: height * 0.015),
      
            CustomTextField(
              controller: controller.passwordController,
              hint: 'password'.tr,
              icon: Icons.lock_outline,
              obscure: true,
              showToggle: true,
            ),
            SizedBox(height: height * 0.01),
      
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
      
            SizedBox(height: height * 0.01),
      
            CustomTextField(
              controller: controller.confirmPasswordController,
              hint: 'confirm_password'.tr,
              icon: Icons.lock_reset,
              obscure: true,
              showToggle: true,
            ),
            Obx(() => controller.confirmPasswordError.value.isEmpty
                ? SizedBox.shrink()
                : Text(
                    controller.confirmPasswordError.value,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )),
      
            SizedBox(height: height * 0.02),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'verification_method'.tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(height: height * 0.02),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VerificationBox(
                  label: 'whatsapp'.tr,
                  isSelected: controller.verificationMethod.value == 'whatsapp',
                  onTap: () => controller.verificationMethod.value = 'whatsapp',
                ),
                VerificationBox(
                  label: 'sms'.tr,
                  isSelected: controller.verificationMethod.value == 'sms',
                  onTap: () => controller.verificationMethod.value = 'sms',
                ),
                VerificationBox(
                  label: 'email'.tr,
                  isSelected: controller.verificationMethod.value == 'email',
                  onTap: () => controller.verificationMethod.value = 'email',
                ),
              ],
            )),
            SizedBox(height: height * 0.03),
      
            // ===== Additional Data =====
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "additional_data".tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(height: height * 0.015),
      
            CustomDropdownField(
              hint: "country".tr,
              options: ["Indonesia", "Qatar"],
              value: controller.country.value.isEmpty
                  ? null
                  : controller.country.value,
              onChanged: controller.selectCountry,
              icon: Icons.flag,
            ),
            Obx(() => controller.countryError.value.isEmpty
                ? SizedBox.shrink()
                : Text(
                    controller.countryError.value,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )),
      
            Obx(() => controller.genderError.value.isEmpty
                ? SizedBox.shrink()
                : Text(
                    controller.genderError.value,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )),
      
            Obx(() => CustomDateField(
                  hint: "select_birthdate".tr,
                  value: controller.birthDate.value == null
                      ? null
                      : controller.birthDate.value.toString().split(" ")[0],
                  onTap: () => controller.selectBirthDate(context),
                  icon: Icons.cake,
                )),
            SizedBox(height: height * 0.015),
            Obx(() => CustomGenderSelector(
                  selectedGender: controller.gender,
                )),
      
            SizedBox(height: height * 0.05),
      
            Padding(
              padding: EdgeInsets.fromLTRB(
                width * 0.05,
                height * 0.02,
                width * 0.05,
                height * 0.005,
              ),
              child: const SignUpButtons(),
            ),
          ],
        ),
      ),
    );
  }
}
