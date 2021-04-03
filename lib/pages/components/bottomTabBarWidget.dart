import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomTabBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF2F2F2),
      child: Padding(
        padding: EdgeInsets.only(bottom: 30, left: 30, right: 30),
        child: TabBar(
          labelColor: Colors.black,
          indicatorWeight: 2.0,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: Colors.black),
              insets: EdgeInsets.only(bottom: 5)),
          tabs: [
            Tab(
                child: Text('tab_stopwatch'.tr,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Tab(
                child: Text('tab_timer'.tr,
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}
