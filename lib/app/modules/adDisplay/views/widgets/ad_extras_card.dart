import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../Core/Utils/colors.dart';

class AdExtrasCard extends StatelessWidget {
  final String adTitle;
  final String category; // combined main + sub category
  final String createdBy;
  final String lastUpdated; 
  final String location; 

  const AdExtrasCard({
    super.key,
    required this.adTitle,
    required this.category,
    required this.createdBy,
    required this.lastUpdated,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // MediaQuery dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final horizontalMargin = screenWidth * 0.04;
    final verticalMargin = screenHeight * 0.012;
    final padding = screenWidth * 0.035;
    final borderRadius = screenWidth * 0.03;

    final titleFontSize = screenWidth * 0.042;
    final labelFontSize = screenWidth * 0.038;
    final dataFontSize = screenWidth * 0.038;

    final iconSize = screenWidth * 0.045;
    final verticalSpacing = screenHeight * 0.008;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: verticalMargin),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.grey.withOpacity(0.4),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ad Title
          Text(
            adTitle,
            style: theme.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              fontSize: titleFontSize,
            ),
          ),
          SizedBox(height: verticalSpacing),

          // Category with icon
          Row(
            children: [
              FaIcon(FontAwesomeIcons.tags, color: AppColors.defaultbuttoncolor, size: iconSize),
              SizedBox(width: screenWidth * 0.02),
              Text(
                'التصنيف: $category',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                  fontSize: labelFontSize,
                ),
              ),
            ],
          ),
          SizedBox(height: verticalSpacing),

          // Created by with icon
          Row(
            children: [
              FaIcon(FontAwesomeIcons.user, color: AppColors.defaultbuttoncolor, size: iconSize),
              SizedBox(width: screenWidth * 0.02),
              Text(
                createdBy,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: Colors.grey.shade700,
                  fontSize: dataFontSize,
                ),
              ),
            ],
          ),
          SizedBox(height: verticalSpacing),

          // Last updated with icon
          Row(
            children: [
              FaIcon(FontAwesomeIcons.clock, color: AppColors.defaultbuttoncolor, size: iconSize),
              SizedBox(width: screenWidth * 0.02),
              Text(
                lastUpdated,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: Colors.grey.shade700,
                  fontSize: dataFontSize,
                ),
              ),
            ],
          ),
          SizedBox(height: verticalSpacing),

          // Location with icon
          Row(
            children: [
              FaIcon(FontAwesomeIcons.mapMarkerAlt, color: AppColors.defaultbuttoncolor, size: iconSize),
              SizedBox(width: screenWidth * 0.02),
              Expanded(
                child: Text(
                  location,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.grey.shade700,
                    fontSize: dataFontSize,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
