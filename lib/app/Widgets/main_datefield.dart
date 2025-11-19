import 'package:flutter/material.dart';
import '../Core/Utils/colors.dart';

class CustomDateField extends StatelessWidget {
  final String hint;
  final String? value;
  final VoidCallback onTap;
  final IconData icon;

  const CustomDateField({
    super.key,
    required this.hint,
    required this.value,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final fieldHeight = height * 0.065; // match textfield height

    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(width * 0.05),
        child: Container(
          height: fieldHeight,
          padding: EdgeInsets.symmetric(horizontal: width * 0.01),
          decoration: BoxDecoration(
            color: AppColors.textfieldfillColor,
            borderRadius: BorderRadius.circular(width * 0.05),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(width * 0.015),
                padding: EdgeInsets.all(width * 0.015),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
                child: Icon(icon, color: AppColors.white, size: width * 0.04),
              ),
              SizedBox(width: width * 0.02),
              Expanded(
                child: Text(
                  (value == null || value!.isEmpty) ? hint : value!,
                 textAlign: Directionality.of(context) == TextDirection.rtl
                ? TextAlign.right
                : TextAlign.left,
                  style: TextStyle(
                    fontSize: width * 0.037,
                    color: (value == null || value!.isEmpty) ? Colors.white : Colors.white,
                    //height: 1.2,
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: fieldHeight * 0.25),
                child: Icon(Icons.calendar_today, size: width * 0.05, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
