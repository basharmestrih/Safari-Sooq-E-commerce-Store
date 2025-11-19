import 'package:flutter/material.dart';
import '../Core/Utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController controller;
  final IconData icon;
  final void Function(String)? onChanged;
  final bool showToggle; // ✅ optional param for password toggle

  const CustomTextField( {
    super.key,
    required this.hint,
    this.obscure = false,
    required this.controller,
    required this.icon,
    this.onChanged,
    this.showToggle = false, // default = false
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // ✅ notifier for eye toggle
    final ValueNotifier<bool> _obscureNotifier = ValueNotifier(obscure);

    return ValueListenableBuilder<bool>(
      valueListenable: _obscureNotifier,
      builder: (context, isObscure, child) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: height * 0.01),
          child: TextField(
            style: Theme.of(context).textTheme.labelSmall,
            controller: controller,
            obscureText: isObscure,
            textAlign: Directionality.of(context) == TextDirection.rtl
            ? TextAlign.right
            : TextAlign.left,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: const Color.fromARGB(255, 202, 199, 199),
                fontSize: width * 0.025,
              ),
              prefixIcon: Container(
                margin: EdgeInsets.all(width * 0.015),
                padding: EdgeInsets.all(width * 0.015),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
                child: Icon(icon, color: AppColors.white, size: width * 0.045),
              ),
              suffixIcon: showToggle
                  ? Padding(
                    padding:  EdgeInsets.all(width * 0.015),
                    child: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.white,
                          size: width * 0.05,
                        ),
                        onPressed: () {
                          _obscureNotifier.value = !isObscure;
                        },
                      ),
                  )
                  : null,
              filled: true,
              fillColor: AppColors.textfieldfillColor,
              contentPadding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.02,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(width * 0.018),
              ),
            ),
          ),
        );
      },
    );
  }
}
