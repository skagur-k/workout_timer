import 'package:flutter/material.dart';
import '../resources/data.dart';
import 'package:get/get.dart';
import '../helpers/time_helper.dart';
// import 'package:timer_count_down/timer_controller.dart';

class TimerPage extends StatelessWidget {
  final TimeHelper _t = TimeHelper();

  Widget timerItem(Duration duration, String timerName) {
    return Builder(builder: (BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.05),
                      spreadRadius: 0.2,
                      blurRadius: 0.2,
                      offset: Offset(0, 2))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Spacer()
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(timerName),
                        SizedBox(height: 8),
                        Text(_t.getDurationToString(duration),
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          // showAlertDialog(context);
                          print("Hello World");
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text('tm_start'.tr,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        )),
                    // Spacer(),
                  ]),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // color: Color(0xffF2F2F2),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40),
          Expanded(
              child: ListView(
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  children: timerData.map((e) {
                    return timerItem(e.duration, e.timerName);
                  }).toList())),
        ],
      )),
    );
  }
}
