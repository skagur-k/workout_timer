import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../resources/data.dart';
import 'package:get/get.dart';
// import 'package:timer_count_down/timer_controller.dart';

class TimerPage extends StatelessWidget {
  String _printDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits(d.inMinutes.remainder(60));
    String seconds = twoDigits(d.inSeconds.remainder(60));
    String duration = "$minutes:$seconds";
    return duration;
  }

  void showAlertDialog(BuildContext context) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Demo'),
          content: Text("Select button you want"),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context, "OK");
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, "Cancel");
              },
            ),
          ],
        );
      },
    );
    print(result);
  }

  Widget timerItem(Duration duration, String timerName) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white70,
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
                      Text(_printDuration(duration),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xffF2F2F2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              SfRadialGauge(axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  startAngle: 270,
                  endAngle: 270,
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    cornerStyle: CornerStyle.bothFlat,
                    color: Colors.blue[100],
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                        value: 10,
                        cornerStyle: CornerStyle.bothFlat,
                        width: 0.2,
                        color: Colors.blue[400],
                        sizeUnit: GaugeSizeUnit.factor)
                  ],
                ),
              ]),
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
