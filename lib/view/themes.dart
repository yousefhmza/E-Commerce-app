import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBarTheme _appBarTheme = const AppBarTheme(
  elevation: 0.0,
  color: Colors.white,
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ),
);

ThemeData lightTheme() {
  return ThemeData(
    appBarTheme: _appBarTheme,
    canvasColor: Colors.white,
  );
}
