import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color.fromARGB(26, 1, 6, 10);
  static const Color secondaryColor = Color(0xFFF5F5F8);
  static const Color fillColor = Color.fromARGB(255, 236, 238, 244);
    static const Color textfieldfillColor =   Color.fromARGB(255, 4, 34, 86);
    

   static const Color defaultbuttoncolor =  Color.fromARGB(194, 3, 122, 242);

  static const Color fontColor = Color(0xFF9E9E9E);
  static const Color secondaryfontColor = Color.fromARGB(255, 0, 162, 255);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;

  // ✅ Custom Colors
  static const Color containerColor =Color.fromARGB(255, 25, 64, 118);// "#1a224d8b"

  // ✅ Gradients
  static const LinearGradient scaffoldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
       Color.fromARGB(255, 3, 75, 242), 
      Color(0xFF29D8A6),   // #29d8a6
    ],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xFF29D8A6),
       Color.fromARGB(255, 3, 75, 242), 
    ],
  );
}
