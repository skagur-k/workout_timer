import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomTabBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30, left: 30, right: 30),
        child: TabBar(
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
