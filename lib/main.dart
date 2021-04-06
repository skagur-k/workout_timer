import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:workout_timer_plus/pages/app.dart';
import 'helpers/localization_helper.dart';
import 'pages/pages.dart';
import 'resources/theme.dart';
import 'resources/theme_service.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));
  await GetStorage.init();
  runApp(MyApp());
}

/* TODO:
    * 1> Dark Theme ![https://pub.dev/packages/get#change-theme] ****
    * 2> Notifications ![https://github.com/MaikuB/flutter_local_notifications/tree/master/flutter_local_notifications]
    * 3> Shared Preferences ![] ****
    * 4> Splash Screen / Intro Screen
    * 6> Timer Logic
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: LocalizationHelper.fallbackLocale,
      translations: LocalizationHelper(),
      themeMode: ThemeService().theme,
      theme: Themes.light,
      darkTheme: Themes.dark,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => App()),
        GetPage(
            name: '/settings',
            page: () => SettingsPage(),
            transition: Transition.downToUp,
            transitionDuration: Duration(milliseconds: 200)),
      ],
    );
  }
}
