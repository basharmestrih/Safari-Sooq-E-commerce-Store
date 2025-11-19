import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Core/Utils/colors.dart';
import '../../../../../Widgets/gradient_button.dart';
import '../../../../../Widgets/main_button.dart';
import '../../controllers/register_controller.dart';

class SignUpButtons extends GetView<RegisterController> {
  const SignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GradientButton(
          text: 'signup'.tr,
          //textStyle: Theme.of(context).textTheme.labelLarge,
          onPressed: controller.signUp,
          width: double.infinity,
        ),
        const SizedBox(height: 8),
        GradientButton(
          text: 'guest'.tr,
          //textStyle: Theme.of(context).textTheme.labelLarge,
          onPressed: controller.signUp,
          width: double.infinity,
        ),
      ],
    );
  }
}
