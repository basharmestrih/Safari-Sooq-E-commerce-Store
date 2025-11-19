import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotificationTap;

  const MainAppBar({
    super.key,
    this.onMenuTap,
    this.onSearchTap,
    this.onNotificationTap,
  });

  // Gradient colors
  static const LinearGradient scaffoldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 3, 75, 242),
      Color(0xFF29D8A6),
    ],
  );

  @override
  Widget build(BuildContext context) {
    // Check if current language is Arabic using Get.locale
    final isRTL = Get.locale?.languageCode == 'ar';

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: onMenuTap,
        ),
        title: ShaderMask(
          shaderCallback: (bounds) => scaffoldGradient.createShader(bounds),
          child: const Text(
            "Safari Sooq",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white, // gradient will show
              letterSpacing: 0.8,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: onSearchTap,
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black87),
            onPressed: onNotificationTap,
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
