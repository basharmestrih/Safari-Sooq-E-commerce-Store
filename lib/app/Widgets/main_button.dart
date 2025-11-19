import 'package:flutter/material.dart';
import '../Core/Utils/colors.dart';
import 'gradient_main_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;       // optional width
  final Color? color;        // optional background color
  final Color? fontcolor;    // optional text color
  final TextStyle? textStyle; // ✅ NEW: optional text style

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.color,
    this.fontcolor,
    this.textStyle, // ✅ allow passing text style
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final widthScreen = size.width;

    return SizedBox(
      width: 50 * widthScreen,
      child: ElevatedButton(
      
        onPressed: onPressed,
        child: GradientText(
        text:text,
        gradient: AppColors.buttonGradient,
        style: Theme.of(context)
        .textTheme
        .labelMedium ,
      )
      
      ),
    );
  }
}
