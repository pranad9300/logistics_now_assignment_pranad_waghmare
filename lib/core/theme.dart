import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueAccent,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(
    headlineLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 20, color: Colors.white70),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
);

final Color tileColor = Colors.blueGrey;
final BorderRadius tileBorderRadius = BorderRadius.circular(12);
final Duration tileAnimationDuration = const Duration(milliseconds: 300);
final Duration symbolAnimationDuration = const Duration(milliseconds: 500);

final Color xColor = Colors.blueAccent;
final Color oColor = Colors.yellowAccent;
const double boxShadowRadius = 8;
const EdgeInsets boxShadowBlurRadius = EdgeInsets.all(boxShadowRadius);
