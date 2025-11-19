import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Utils/colors.dart';
import '../../controllers/onboarding_controller.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Obx(() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: 0),
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: controller.currentLocale.value.languageCode,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            style: const TextStyle(color: Colors.white, fontSize: 14),

            // 👇 add this line to control opened menu bg
            dropdownColor: AppColors.containerColor,

            items: const [
              DropdownMenuItem(
                value: "en",
                child: Row(
                  children: [
                    Icon(Icons.language, color: Colors.white, size: 18),
                    SizedBox(width: 6),
                    Text(
                      "English",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: "ar",
                child: Row(
                  children: [
                    Icon(Icons.language, color: Colors.white, size: 18),
                    SizedBox(width: 6),
                    Text(
                      "العربية",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            onChanged: (value) {
              if (value != null) {
                controller.changeLanguage(value);
              }
            },
          ),
        ),
      );
    });
  }
}
