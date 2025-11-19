import 'package:flutter/material.dart';

class PrayerTimeSection extends StatelessWidget {
  const PrayerTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(
          '🕌 أوقات الصلاة',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Text(
          'دمشق - ٠٥:١٤ ص',
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),

        ],
      ),
    );
  }
}
