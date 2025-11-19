import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGenderSelector extends StatelessWidget {
  // Accept controller and its observable gender
  final RxString selectedGender;
  final Color boxColor;   // checkbox background color
  final Color checkColor; // tick color

  const CustomGenderSelector({
    Key? key,
    required this.selectedGender,
    this.boxColor = Colors.white,
    this.checkColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Male option
                _genderOption(
                  label: "gender_male".tr,
                  value: "0",
                  context: context,
                ),
                SizedBox(width: 0.08 * width),
                // Female option
                _genderOption(
                  label: "gender_female".tr,
                  value: "1",
                  context: context,
                ),
              ],
            ),
          ],
        ));
  }

  Widget _genderOption({
    required String label,
    required String value,
    required BuildContext context,
  }) {
    final isSelected = selectedGender.value == value;

    return GestureDetector(
      onTap: () => selectedGender.value = value,
      child: Row(
        children: [
          // Checkbox square
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isSelected ? boxColor : Colors.transparent,
              border: Border.all(color: boxColor, width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: isSelected
                ? Icon(Icons.check, size: 18, color: checkColor)
                : null,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
