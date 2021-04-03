import 'package:flutter/material.dart';
import 'package:workout_timer_app/pages/timer.dart';
import 'components/bottomTabBarWidget.dart';
import 'stopwatch.dart';
import 'components/components.dart';
import 'package:get/get.dart';
import 'components/appBarWidget.dart';

class NoScrollGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class App extends StatelessWidget {
  final List<Widget> views = <Widget>[
    StopWatchPage(),
    TimerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: views.length,
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: AppBarWidget('title'.tr)),
        body: ScrollConfiguration(
          behavior: NoScrollGlowBehavior(),
          child: TabBarView(children: views),
        ),
        bottomNavigationBar: Container(
            color: Color(0xffF2F2F2),
            child: Padding(
                padding: EdgeInsets.only(bottom: 30, left: 30, right: 30),
                child: BottomTabBarWidget())),
      ),
    );
  }
}
