import 'package:flutter/material.dart';

enum ThemeType { Light, Dark }

class AppTheme {
  static ThemeType defaultTheme = ThemeType.Light;

  bool isDark = false;
  ThemeType type = ThemeType.Light;
  Color bg = Color(0xffF2F2F2);
  Color subBg = Color(0xffF2F2F2);
  Color primaryColor = Colors.blue.shade600;
  Color accentColor = Colors.blueAccent;
  Color swBtnStart = Colors.blue;
  Color swBtnStop = Colors.red;
  Color swBtnReset = Colors.black26;
  Color swBtnResume = Colors.green;
  Color focus = Colors.red.shade900;

  Color mainTextColor = Colors.black87;
  Color inverseTextColor = Colors.white;

  AppTheme({required this.isDark}) {
    mainTextColor = isDark ? Colors.white : Colors.black87;
    inverseTextColor = isDark ? Colors.black87 : Colors.white;
  }

  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.Light:
        return AppTheme(isDark: false)
          ..type = t
          ..bg = const Color(0xffF2F2F2)
          ..subBg = Colors.white70
          ..primaryColor = Colors.blue
          ..swBtnStart = Colors.blue
          ..swBtnReset = Colors.black12
          ..swBtnStop = Colors.red
          ..swBtnResume = Colors.green;

      case ThemeType.Dark:
        return AppTheme(isDark: true)
          ..type = t
          ..bg = const Color(0xff393e46)
          ..subBg = Colors.white70
          ..primaryColor = Colors.blue
          ..swBtnStart = Colors.blue
          ..swBtnReset = Colors.red
          ..swBtnStop = Colors.red
          ..swBtnResume = Colors.green;
    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(
        textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
        colorScheme: ColorScheme(
            brightness: isDark ? Brightness.dark : Brightness.light,
            primary: primaryColor,
            primaryVariant: shift(accentColor, .1),
            secondary: primaryColor,
            secondaryVariant: shift(accentColor, .1),
            background: bg,
            surface: bg,
            onBackground: mainTextColor,
            onSurface: mainTextColor,
            onError: mainTextColor,
            onPrimary: inverseTextColor,
            onSecondary: inverseTextColor,
            error: focus));
    return t;
  }

  Color shift(Color c, double amt) {
    amt *= (isDark ? -1 : 1);
    var hslc = HSLColor.fromColor(c);
    double lightness = (hslc.lightness + amt).clamp(0, 1.0) as double;
    return hslc.withLightness(lightness).toColor();
  }
}
