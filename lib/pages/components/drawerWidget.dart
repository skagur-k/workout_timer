import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

class DrawerWidget extends StatelessWidget {
  Future<List<String>> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return <String>[packageInfo.version, packageInfo.buildNumber];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Drawer(
          child: ListView(children: <Widget>[
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('dr_title'.tr,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
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
            trailing: Icon(Icons.contact_page),
            onTap: () {
              Get.back();
            }),
        FutureBuilder(
            future: getVersion(),
            builder:
                (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              print(snapshot.data);
              return AboutListTile(
                child: Text("앱 정보"),
                icon: Icon(Icons.info),
                applicationName: 'title'.tr,
                applicationVersion:
                    "Version: ${snapshot.data?.elementAt(0)} Build Number ${snapshot.data?.elementAt(1)}",
                applicationLegalese: "Copyright",
              );
            }),
      ])),
    );
  }
}
