import 'package:flutter/material.dart';
import '../Core/Utils/colors.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;        // optional width
  final Color? fontcolor;     // optional text color
  final TextStyle? textStyle; // optional text style

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.fontcolor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthScreen = size.width;

    return SizedBox(
      width: width ?? 0.8 * widthScreen,
      
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppColors.buttonGradient, // ✅ Use gradient as button background
          borderRadius: BorderRadius.circular(12),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // make ElevatedButton transparent
            shadowColor: Colors.transparent,    // remove default shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: textStyle ??
                Theme.of(context)
                    .textTheme
                    .labelMedium
                    , // normal text color
          ),
        ),
      ),
    );
  }
}
