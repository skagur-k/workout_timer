import 'package:get/get.dart';
import 'dart:ui';

import '../resources/lang/lang.dart';

class LocalizationHelper extends Translations {
  static final locale = Locale('ko', 'KR');
  static final fallbackLocale = Locale('en', 'US');

  static final langs = [
    '한국어',
    'English',
  ];

  static final locales = [
    Locale('ko', 'KR'),
    Locale('en', 'US'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'ko_KR': koKR,
        'en_US': enUS,
      };

  // void changeLocale(String lang) {
  //   final locale = _getLocaleFromLanguage(lang);
  //   Get.updateLocale(locale);
  // }

  // Locale _getLocaleFromLanguage(String lang) {
  //   for (int i = 0; i < langs.length; i++) {
  //     if (lang == langs[i]) return locales[i];
  //   }
  //   return Get.locale;
  // }
}
