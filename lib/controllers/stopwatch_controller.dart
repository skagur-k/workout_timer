import 'dart:async';
import '../helpers/time_helper.dart';
import 'package:get/get.dart';

class StopWatchRecord {
  StopWatchRecord({
    this.rawValue,
    this.hours,
    this.minute,
    this.second,
    this.displayTime,
  });
  int? rawValue;
  int? hours;
  int? minute;
  int? second;
  String? displayTime;
}

/// StopWatch ExecuteType
enum StopWatchExecute { start, stop, reset, lap }

/// StopWatchTimer
class StopWatchController {
  StopWatchController({
    this.isLapHours = true,
    this.onChange,
    this.onChangeRawSecond,
    this.onChangeRawMinute,
  }) {
    _configure();
  }

  TimeHelper _t = TimeHelper();
  final bool isLapHours;
  final Function(int)? onChange;
  final Function(int)? onChangeRawSecond;
  final Function(int)? onChangeRawMinute;

  final RxBool _isTickingController = false.obs;
  bool get isTicking => _isTickingController.value;
  final RxBool _isPausedController = false.obs;
  bool get isPaused => _isPausedController.value;

  final Rx<int> _elapsedTime = 0.obs;
  final Rx<int> _rawTimeController = 0.obs;
  int get rawTime => _rawTimeController.value;

  final Rx<int> _secondTimeController = 0.obs;
  int get secondTime => _secondTimeController.value;

  final Rx<int> _minuteTimeController = 0.obs;
  int get minuteTime => _minuteTimeController.value;

  final RxList<StopWatchRecord> _recordsController = <StopWatchRecord>[].obs;
  List<StopWatchRecord> get records =>
      _recordsController.toList(growable: true);

  final Rx<StopWatchExecute> _executeController = StopWatchExecute.stop.obs;
  StopWatchExecute get execute => _executeController.value;
  Rx<StopWatchExecute> get onExecute => _executeController;

  Timer? _timer;
  int _startTime = 0;
  int _stopTime = 0;
  int _presetTime = 0;
  int? _second;
  int? _minute;
  List<StopWatchRecord> _records = [];

  bool get isRunning => _timer != null ? _timer!.isActive : false;

  void setPresetHoursTime(int value) =>
      setPresetTime(mSec: value * 3600 * 1000);

  void setPresetMinuteTime(int value) => setPresetTime(mSec: value * 60 * 1000);

  void setPresetSecondTime(int value) => setPresetTime(mSec: value * 1000);

  void setPresetTime({required int mSec}) {
    if (_timer == null) {
      _presetTime = mSec;
      _elapsedTime.value += _presetTime;
    }
  }

  Future _configure() async {
    _elapsedTime.listen((value) {
      _rawTimeController(value);
      if (onChange != null) {
        onChange!(value);
      }
      final latestSecond = _t.getRawSecond(value);
      if (_second != latestSecond) {
        _secondTimeController(latestSecond);
        _second = latestSecond;
        if (onChangeRawSecond != null) {
          onChangeRawSecond!(latestSecond);
        }
      }
      final latestMinute = _t.getRawMinute(value);
      if (_minute != latestMinute) {
        _minuteTimeController(latestMinute);
        _minute = latestMinute;
        if (onChangeRawMinute != null) {
          onChangeRawMinute!(latestMinute);
        }
      }
    });

    _executeController.listen((value) {
      switch (value) {
        case StopWatchExecute.start:
          start();
          break;
        case StopWatchExecute.stop:
          _stop();
          break;
        case StopWatchExecute.reset:
          _reset();
          break;
        case StopWatchExecute.lap:
          _lap();
          break;
      }
    });
  }

  void _handle(Timer timer) =>
      _elapsedTime(DateTime.now().millisecondsSinceEpoch -
          _startTime +
          _stopTime +
          _presetTime);

  void start() {
    if (_timer == null || !_timer!.isActive) {
      _startTime = DateTime.now().millisecondsSinceEpoch;
      _timer = Timer.periodic(const Duration(milliseconds: 1), _handle);
      _isTickingController(true);
      _isPausedController(false);
    }
  }

  void _stop() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      _timer = null;
      _stopTime += DateTime.now().millisecondsSinceEpoch - _startTime;
      _isTickingController(false);
      _isPausedController(true);
    }
  }

  void _reset() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      _timer = null;
    }
    _startTime = 0;
    _stopTime = 0;
    _second = null;
    _minute = null;
    _records = [];
    _recordsController(_records);
    _elapsedTime(_presetTime);
    _isTickingController(false);
    _isPausedController(false);
  }

  void _lap() {
    if (_timer != null && _timer!.isActive) {
      final rawValue = _rawTimeController.value;
      _records.add(StopWatchRecord(
        rawValue: rawValue,
        hours: _t.getRawHours(rawValue),
        minute: _t.getRawMinute(rawValue),
        second: _t.getRawSecond(rawValue),
        displayTime: _t.getDisplayTime(rawValue, hours: isLapHours),
      ));
      _recordsController(_records);
    }
  }
}
