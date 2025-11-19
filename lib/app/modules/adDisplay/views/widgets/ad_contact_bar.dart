import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../../Core/Utils/colors.dart';

class ContactFABs extends StatelessWidget {
  const ContactFABs({super.key});

  @override
  Widget build(BuildContext context) {
   final double mainFabSize = 60.0; // bigger main FAB
   final Size fabSize = const Size(60.0, 60.0);
   final double iconSize = 35.0;

    return SpeedDial(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.secondaryfontColor,
      icon: Icons.person_add,
      activeIcon: Icons.close,
      buttonSize: Size(mainFabSize, mainFabSize), // width & height
      iconTheme: IconThemeData(size: iconSize), // main icon size
      elevation: 8,
      spacing: 16,
      spaceBetweenChildren: 16,
      overlayOpacity: 0.0, // no blurred background
      childrenButtonSize: fabSize,
      childPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      children: [
        // WhatsApp
        SpeedDialChild(
          child: FaIcon(FontAwesomeIcons.whatsapp, size: iconSize, color: AppColors.secondaryfontColor),
          backgroundColor: Colors.white,
          onTap: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        // Phone
        SpeedDialChild(
          child: Icon(Icons.call, size: iconSize, color: AppColors.secondaryfontColor),
          backgroundColor: Colors.white,
          onTap: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        // Mail
        SpeedDialChild(
          child: Icon(Icons.mail_outline, size: iconSize, color: AppColors.secondaryfontColor),
          backgroundColor: Colors.white,
          onTap: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ],
    );
  }
}
