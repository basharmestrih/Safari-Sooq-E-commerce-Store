import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Add GetX
import 'package:safarisooqapp/App/Routes/app_pages.dart';
import 'package:safarisooqapp/App/Core/Utils/theme.dart';
import 'package:safarisooqapp/app/Core/translations/app_translations.dart';
import 'package:safarisooqapp/generated/localization.dart';


void main() {
  runApp(const SafariSooqapp());
}

class SafariSooqapp extends StatelessWidget {
  const SafariSooqapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(   
      title: 'Safari Sooq App',
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),   
      locale: const Locale('ar'),             
      fallbackLocale: const Locale('en'),  
      theme: AppTheme.lightTheme(context),
      initialRoute: AppPages.initial, 
      getPages: AppPages.routes,      
    );
  }
}
