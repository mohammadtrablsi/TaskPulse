
import 'package:flutter/material.dart';

ThemeData darktheme = ThemeData(
  scaffoldBackgroundColor: Color.fromRGBO(68, 70, 84, 1),//
  appBarTheme: const AppBarTheme(backgroundColor: Color.fromRGBO(68, 70, 84, 1)),
textTheme: TextTheme(subtitle1: TextStyle(color: Colors.white)),
);

ThemeData lighttheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white)
);