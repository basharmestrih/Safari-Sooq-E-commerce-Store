import 'package:flutter/material.dart';

import '../../../../../Core/Utils/colors.dart';

class AuthFormContainer extends StatelessWidget {
  final Widget child;

  const AuthFormContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.05,
       ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.04),
        color: AppColors.containerColor.withOpacity(0.8), // ✅ خلفية غامقة شوي
        border: Border.all(
          color: AppColors.containerColor.withOpacity(0.7),
          width: 1.5,
        ),
      ),
      child: child,
    );
  }
}
