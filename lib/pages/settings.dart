import 'package:flutter/material.dart';
import 'components/appBarWidget.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBarWidget("Settings"),
    ));
  }
}
