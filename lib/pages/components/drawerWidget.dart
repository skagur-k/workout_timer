import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
      DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('dr_title'.tr, style: TextStyle(fontSize: 30)),
            ],
          ),
          decoration: BoxDecoration(color: Color(0xffF2F2F2))),
      ListTile(
          title: Text('dr_pref'.tr),
          trailing: Icon(Icons.settings),
          onTap: () {
            Get.toNamed("/settings");
          }),
      ListTile(
          title: Text('dr_rateapp'.tr),
          trailing: Icon(Icons.star),
          onTap: () {
            Get.back();
          }),
      ListTile(
          title: Text('dr_policy'.tr),
          trailing: Icon(Icons.person),
          onTap: () {
            Get.back();
          }),
      ListTile(
          title: Text('dr_contact'.tr),
          trailing: Icon(Icons.info),
          onTap: () {
            Get.back();
          }),
    ]));
  }
}