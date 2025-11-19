import 'package:get/get.dart';
import 'fr_FR.dart';
import 'en_us.dart';
import 'ar_QA.dart';
import 'hi_IN.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUS,
        'ar': arQA,
        'fr': frFR,
        'hi': hiIN,
      };
}
