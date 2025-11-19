import 'package:flutter/material.dart';
import '../../../../Core/Utils/colors.dart';

class AdAuctionCard extends StatelessWidget {
  const AdAuctionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive paddings and font sizes
    final horizontalPadding = screenWidth * 0.04;
    final verticalPadding = screenHeight * 0.02;
    final borderRadius = screenWidth * 0.03;
    final countdownFontSize = screenWidth * 0.045;
    final labelFontSize = screenWidth * 0.038;
    final minBidFontSize = screenWidth * 0.042;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      decoration: BoxDecoration(
        gradient: AppColors.scaffoldGradient, // Gradient from theme
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Static auction text
          Column(
            children: [
              Text(
                'هذا المنتج في مزاد ينتهي خلال:',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: labelFontSize,
                    ),
              ),
              SizedBox(height: screenHeight * 0.008),
              
              // Countdown data
              Text(
                '9 أيام 5 ساعات 3 دقائق',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),

          // Minimum bid label
          Column(
            children: [
              Text(
                'أقل مزاد',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: labelFontSize,
                    ),
              ),
              
              // Minimum bid value
              Text(
                '10\$',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                     color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: minBidFontSize,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
