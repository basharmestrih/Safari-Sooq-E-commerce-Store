import 'package:flutter/material.dart';
import '../../../../Core/Utils/colors.dart';

class AdDescriptionCard extends StatelessWidget {
  final String description;

  const AdDescriptionCard({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // MediaQuery for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final horizontalMargin = screenWidth * 0.04; // ~16px
    final verticalMargin = screenHeight * 0.012; // ~10px
    final padding = screenWidth * 0.035; // ~14px

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: verticalMargin),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.grey.withOpacity(0.4), // Light grey border
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title using theme font
          Text(
            'الوصف', // Arabic for "Description"
            style: theme.textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              letterSpacing: 0.3,
            ),
          ),
          SizedBox(height: screenHeight * 0.008), // ~6px
          // Description using theme font
          Text(
            description,
            textAlign: TextAlign.start,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.grey.shade600, // light grey text
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
