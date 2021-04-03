class TimeHelper {
  String getDisplayTime(
    int value, {
    bool hours = true,
    bool minute = true,
    bool second = true,
    bool milliSecond = true,
    String hoursRightBreak = ':',
    String minutesRightBreak = ':',
    String secondRightBreak = ':',
  }) {
    final hoursStr = getDisplayTimeHours(value);
    final mStr = getDisplayTimeMinute(value, hours: hours);
    final sStr = getDisplayTimeSecond(value);
    final msStr = getDisplayTimeMilliSecond(value);

    var result = '';
    if (hours) {
      result += '$hoursStr';
    }
    if (minute) {
      if (hours) {
        result += hoursRightBreak;
      }
      result += '$mStr';
    }
    if (second) {
      if (minute) {
        result += minutesRightBreak;
      }
      result += '$sStr';
    }
    if (milliSecond) {
      if (second) {
        result += secondRightBreak;
      }
      result += '$msStr';
    }
    return result;
  }

  String getDisplayTimeHours(int mSec) {
    return getRawHours(mSec).toString().padLeft(2, '0');
  }

  String getDisplayTimeMinute(int mSec, {bool hours = false}) {
    if (hours) {
      return getMinute(mSec).toString().padLeft(2, '0');
    } else {
      return getRawMinute(mSec).toString().padLeft(2, '0');
    }
  }

  String getDisplayTimeSecond(int mSec) {
    final s = (mSec % 60000 / 1000).floor();
    return s.toString().padLeft(2, '0');
  }

  String getDisplayTimeMilliSecond(int mSec) {
    final ms = (mSec % 1000 / 10).floor();
    return ms.toString().padLeft(2, '0');
  }

  int getRawHours(int value) => (value / (3600 * 1000)).floor();
  int getMinute(int value) => (value / (60 * 1000) % 60).floor();
  int getRawMinute(int value) => (value / 60000).floor();
  int getRawSecond(int value) => (value / 1000).floor();
}
