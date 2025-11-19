import 'package:flutter/material.dart';
import '../../../../Core/Utils/colors.dart';

class AdInfoCard extends StatelessWidget {
  final String title;
  final double price;

  const AdInfoCard({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 🧠 MediaQuery values for responsive UI
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // 🔧 Define responsive dimensions
    final double horizontalPadding = width * 0; // ~16px on 400px width
    final double verticalPadding = height * 0.015; // ~12px on 800px height
    final double horizontalMargin = width * 0.04;
    final double verticalMargin = height * 0.012;
    final double borderRadius = width * 0.03;

    // 📏 Responsive font scaling
    double scaleFont(double baseSize) => baseSize * width / 375;

    return Card(
      elevation: 0,
      color: theme.colorScheme.surface,
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: verticalMargin,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 🏷 Title text
            Text(
              title,
              style: theme.textTheme.titleMedium!.copyWith(
                fontSize: scaleFont(16),
                fontWeight: FontWeight.w800,
                color: AppColors.black,
                letterSpacing: 1.1,
              ),
            ),

            // 💰 Price text
            Text(
              '${price.toStringAsFixed(0)} ريال',
              style: theme.textTheme.titleMedium!.copyWith(
                fontSize: scaleFont(16),
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryfontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
