import 'package:flutter/material.dart';
import 'palette.dart';

class Themes {
  static AppTheme _lightTheme = AppTheme.fromType(ThemeType.Light);
  static AppTheme _darkTheme = AppTheme.fromType(ThemeType.Dark);

  static final light = ThemeData.light().copyWith(
    accentColor: Colors.white54,
    backgroundColor: _lightTheme.bg,
    primaryIconTheme: IconThemeData(color: _lightTheme.mainTextColor),
    tabBarTheme: TabBarTheme(
      labelColor: _lightTheme.mainTextColor,
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2.0, color: _lightTheme.mainTextColor),
          insets: EdgeInsets.only(bottom: 5)),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: _lightTheme.bg,
        textTheme: TextTheme(
            headline6: TextStyle(
                color: _lightTheme.mainTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 18))),
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
      headline1: TextStyle(),
      headline2: TextStyle(),
      headline3: TextStyle(),
      headline4: TextStyle(),
      headline5: TextStyle(),
      headline6: TextStyle(),
      subtitle1: TextStyle(),
      subtitle2: TextStyle(),
      caption: TextStyle(),
      button: TextStyle(),
      overline: TextStyle(),
    ).apply(bodyColor: _lightTheme.mainTextColor),
    scaffoldBackgroundColor: _lightTheme.bg,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(), minimumSize: Size(120, 60))),
  );
  // darktheme
  static final dark = ThemeData.dark().copyWith(
    accentColor: Colors.black26,
    backgroundColor: _darkTheme.bg,
    primaryIconTheme: IconThemeData(color: _darkTheme.mainTextColor),
    tabBarTheme: TabBarTheme(
      labelColor: _darkTheme.mainTextColor,
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2.0, color: _darkTheme.mainTextColor),
          insets: EdgeInsets.only(bottom: 5)),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: _darkTheme.bg,
        textTheme: TextTheme(
            headline6: TextStyle(
                color: _darkTheme.mainTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 18))),
    scaffoldBackgroundColor: _darkTheme.bg,
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
      headline1: TextStyle(),
      headline2: TextStyle(),
      headline3: TextStyle(),
      headline4: TextStyle(),
      headline5: TextStyle(),
      headline6: TextStyle(),
    ).apply(bodyColor: _darkTheme.mainTextColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(), minimumSize: Size(120, 60))),
  );
}
