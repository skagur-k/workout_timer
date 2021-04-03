import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/stopwatch_controller.dart';
import '../helpers/time_helper.dart';
import 'components/appBarWidget.dart';

class StopWatchPage extends StatelessWidget {
  final RxBool _isRunning = false.obs;
  final RxBool _isPaused = false.obs;
  final RxString _msg = "".obs;

  final StopWatchTimer _stopWatchTimer =
      StopWatchTimer(); // Create Stop Watch Instance
  final TimeHelper _t = TimeHelper();

  void setRunningPaused(bool r, bool p) {
    _isRunning.value = r;
    _isPaused.value = p;
  }

  void startStopWatch() {
    _stopWatchTimer.onExecute(StopWatchExecute.start);
    _msg.value = 'sw_running_msg'.tr;
    setRunningPaused(true, false);
  }

  void stopStopWatch() {
    _stopWatchTimer.onExecute(StopWatchExecute.stop);
    _msg.value = 'sw_stopped_msg'.tr;
    setRunningPaused(false, true);
  }

  void resetStopWatch() {
    _stopWatchTimer.onExecute(StopWatchExecute.reset);
    _msg.value = 'sw_resetted_msg'.tr;
    setRunningPaused(false, false);
  }

  Widget _stopWatchButtons() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Visibility(
        visible: !_stopWatchTimer.isTicking && !_stopWatchTimer.isPaused,
        child: ElevatedButton(
            onPressed: () {
              startStopWatch();
              print(_msg);
            },
            child: Text('sw_start'.tr),
            style: ElevatedButton.styleFrom(
                primary: Colors.blue[800],
                shape: StadiumBorder(),
                minimumSize: Size(120, 60))),
      ),
      // SizedBox(width: 20),
      Visibility(
        visible: _stopWatchTimer.isTicking || _stopWatchTimer.isPaused,
        child: Row(children: [
          ElevatedButton(
              onPressed: () {
                _stopWatchTimer.isPaused ? startStopWatch() : stopStopWatch();
                Get.snackbar(
                  'snackbar_title'.tr, 'sw_start_dialog_msg'.tr,
                  snackPosition: SnackPosition.TOP,
                  margin: EdgeInsets.only(top: 70),
                  duration: Duration(seconds: 3),
                  // backgroundColor: Colors.grey[900]
                );
              },
              child: _stopWatchTimer.isPaused
                  ? Text('sw_resume'.tr)
                  : Text('sw_stop'.tr),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red[800],
                  shape: StadiumBorder(),
                  minimumSize: Size(120, 60))),
          SizedBox(width: 20),
          ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    title: 'title'.tr,
                    content: Text('sw_reset_dialog'.tr),
                    textConfirm: 'sw_reset'.tr,
                    textCancel: 'cancel'.tr,
                    radius: 10,
                    onCancel: () => Get.back(),
                    onConfirm: () {
                      Get.back();
                      resetStopWatch();
                      Get.snackbar(
                        'sw_reset_dialog_title'.tr, 'sw_reset_dialog_msg'.tr,
                        snackPosition: SnackPosition.TOP,
                        margin: EdgeInsets.only(top: 70),
                        duration: Duration(seconds: 1, milliseconds: 500),
                        // backgroundColor: Colors.grey[900]
                      );
                    });
              },
              child: Text('sw_reset'.tr),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black26,
                  shape: StadiumBorder(),
                  minimumSize: Size(120, 60))),
        ]),
      )
    ]);
  }

  Widget _stopWatchPage() {
    return Scaffold(body: Obx(() {
      return Container(
          color: Color(0xffF2F2F2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                _msg.value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Container(
                child: Obx(() {
                  final int value = _stopWatchTimer.rawTime;
                  final displayTime =
                      _t.getDisplayTime(value, milliSecond: false);
                  final miliSec = _t.getDisplayTimeMilliSecond(value);
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(displayTime.toString(),
                            style: TextStyle(fontSize: 60)),
                        SizedBox(width: 10),
                        Text(miliSec, style: TextStyle(fontSize: 20))
                      ]);
                }),
              ),
              Spacer(),
              SizedBox(height: 30),
              _stopWatchButtons(),
              Spacer()
            ],
          ));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return _stopWatchPage();
  }
}
