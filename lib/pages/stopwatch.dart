import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/stopwatch_controller.dart';
import '../helpers/time_helper.dart';

class StopWatchPage extends GetView<StopWatchController> {
  final RxString _msg = "".obs;

  final TimeHelper _t = TimeHelper();

  void startStopWatch() {
    controller.onExecute(StopWatchExecute.start);
    _msg.value = 'sw_running_msg'.tr;
  }

  void stopStopWatch() {
    controller.onExecute(StopWatchExecute.stop);
    _msg.value = 'sw_stopped_msg'.tr;
  }

  void resetStopWatch() {
    controller.onExecute(StopWatchExecute.reset);
    _msg.value = 'sw_resetted_msg'.tr;
  }

  Widget _stopWatchButtons() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Visibility(
        visible: !controller.isTicking && !controller.isPaused,
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
        visible: controller.isTicking || controller.isPaused,
        child: Row(children: [
          ElevatedButton(
              onPressed: () {
                controller.isPaused ? startStopWatch() : stopStopWatch();
                Get.snackbar(
                  'snackbar_title'.tr, 'sw_start_dialog_msg'.tr,
                  snackPosition: SnackPosition.TOP,
                  margin: EdgeInsets.only(top: 70),
                  duration: Duration(seconds: 3),
                  // backgroundColor: Colors.grey[900]
                );
              },
              child: controller.isPaused
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
                  final int value = controller.rawTime;
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
    Get.put(StopWatchController());
    return _stopWatchPage();
  }
}
