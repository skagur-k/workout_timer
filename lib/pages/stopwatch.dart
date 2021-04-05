import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/stopwatch_controller.dart';
import '../helpers/time_helper.dart';

class StopWatchPage extends GetView<StopWatchController> {
  final RxString _msg = "".obs;
  final TimeHelper _t = TimeHelper();
  final RxString _startTime = "".obs;
  final RxString _endTime = "".obs;

  String formatTime(DateTime now) => DateFormat('h:mm a').format(now);

  void startStopWatch() {
    controller.onExecute(StopWatchExecute.start);
    _startTime.value = formatTime(DateTime.now());
    Get.snackbar(
      'snackbar_title'.tr,
      "${'sw_start_dialog_msg'.tr} ${'start_time'.tr}: ${_startTime.value}",
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.only(top: 70),
      duration: Duration(seconds: 3),
    );
    _msg.value = 'sw_running_msg'.tr;
  }

  void stopStopWatch() {
    controller.onExecute(StopWatchExecute.stop);
    _msg.value = 'sw_stopped_msg'.tr;
  }

  void resumeStopWatch() {
    controller.onExecute(StopWatchExecute.start);
    _msg.value = 'sw_running_msg'.tr;
  }

  void resetStopWatch() {
    controller.onExecute(StopWatchExecute.reset);
    _endTime.value = formatTime(DateTime.now());
    _msg.value = 'sw_resetted_msg'.tr;
    Get.snackbar(
      'snackbar_title'.tr,
      'sw_reset_dialog_msg'.tr,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.only(top: 70),
      duration: Duration(seconds: 1, milliseconds: 500),
    );
  }

  ElevatedButton _startBtn() {
    return ElevatedButton(
        onPressed: () {
          startStopWatch();
        },
        child: Text('sw_start'.tr),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
        ));
  }

  Widget _stopBtn() {
    return Builder(builder: (BuildContext context) {
      return ElevatedButton(
          onPressed: () {
            controller.isPaused ? startStopWatch() : stopStopWatch();
          },
          child:
              controller.isPaused ? Text('sw_resume'.tr) : Text('sw_stop'.tr),
          style: ElevatedButton.styleFrom(
            primary: controller.isPaused ? Colors.green : Colors.red,
          ));
    });
  }

  Widget _resetBtn() {
    return Builder(builder: (BuildContext context) {
      return ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
                title: 'title'.tr,
                content: Text('sw_reset_dialog'.tr),
                backgroundColor: Theme.of(context).backgroundColor,
                confirm: _confirmBtn(),
                cancel: _cancelBtn(),
                radius: 10,
                onCancel: () => Get.back(),
                onConfirm: () {});
          },
          child: Text('sw_reset'.tr),
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ));
    });
  }

  ElevatedButton _confirmBtn() {
    return ElevatedButton(
        child: Text('sw_reset'.tr),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
        ),
        onPressed: () {
          Get.back();
          resetStopWatch();
        });
  }

  ElevatedButton _cancelBtn() {
    return ElevatedButton(
        child: Text('cancel'.tr),
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(primary: Colors.red));
  }

  Widget _stopWatchButtons() {
    return Builder(builder: (BuildContext context) {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Visibility(
          visible: !controller.isTicking && !controller.isPaused,
          child: _startBtn(),
        ),
        Visibility(
          visible: controller.isTicking || controller.isPaused,
          child: Row(children: [
            _stopBtn(),
            SizedBox(width: 20),
            _resetBtn(),
          ]),
        )
      ]);
    });
  }

  Widget _stopWatchPage() {
    return Scaffold(body: Obx(() {
      final int value = controller.rawTime;
      final displayTime = _t.getDisplayTime(value, milliSecond: false);
      final miliSec = _t.getDisplayTimeMilliSecond(value);
      return Container(
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
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(displayTime.toString(), style: TextStyle(fontSize: 60)),
              SizedBox(width: 10),
              Text(miliSec, style: TextStyle(fontSize: 20))
            ]),
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
    Get.put(StopWatchController());
    return _stopWatchPage();
  }
}
