import 'package:flutter/material.dart';
import 'package:workout_timer_plus/pages/timer.dart';
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
            child: AppBarWidget('title'.tr, false)),
        body: ScrollConfiguration(
          behavior: NoScrollGlowBehavior(),
          child: TabBarView(children: views),
        ),
        bottomNavigationBar: BottomTabBarWidget(),
      ),
    );
  }
}
