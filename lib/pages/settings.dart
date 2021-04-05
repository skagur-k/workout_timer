import 'package:flutter/material.dart';
import 'components/appBarWidget.dart';
import 'package:get/get.dart';
import '../resources/theme_service.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBarWidget('dr_pref'.tr, false),
        ),
        body: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Container(
              child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("일반", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("다크모드"),
                Switch(
                  value: ThemeService().isDarkMode,
                  onChanged: (bool value) {
                    ThemeService().switchTheme();
                  },
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("스톱워치", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("알림"),
                Switch(
                  value: ThemeService().isDarkMode,
                  onChanged: (bool value) {
                    // ThemeService().switchTheme();
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("알림음"),
                Text("현재알림음.wav"),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("휴식 타이머", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("소리"),
                Switch(
                  value: ThemeService().isDarkMode,
                  onChanged: (bool value) {
                    // ThemeService().switchTheme();
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("알림음"),
                Text("현재알림음.wav"),
              ],
            ),
          ])),
        ));
  }
}
