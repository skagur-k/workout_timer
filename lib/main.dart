import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:workout_timer_app/pages/app.dart';
import 'helpers/localization_helper.dart';
import 'pages/pages.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xffF2F2F2), // status bar color
  ));
  runApp(MyApp());
}

/* TODO:
    * Notifications ![https://github.com/MaikuB/flutter_local_notifications/tree/master/flutter_local_notifications]
    * Dark Theme ![https://pub.dev/packages/get#change-theme]
    * Shared Preferences ![]
    * Splash Screen / Intro Screen
    * GetView (?)
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: LocalizationHelper.fallbackLocale,
      translations: LocalizationHelper(),
      theme: ThemeData(
        backgroundColor: Color(0xffF2F2F2),
        primaryIconTheme: IconThemeData(color: Colors.black),
      ),
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
