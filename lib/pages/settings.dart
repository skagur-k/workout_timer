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
        body: Center(
            child: TextButton(
                child: Text("Dark Mode Toggle"),
                onPressed: () {
                  ThemeService().switchTheme();
                })));
  }
}
