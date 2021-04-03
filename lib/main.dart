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
        GetPage(name: '/stopwatch', page: () => StopWatchPage()),
        GetPage(name: '/timer', page: () => TimerPage()),
        GetPage(
            name: '/settings',
            page: () => SettingsPage(),
            transition: Transition.rightToLeftWithFade),
      ],
    );
  }
}
