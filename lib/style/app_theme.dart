import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(elevation: 0.0),
    scaffoldBackgroundColor: const Color(0xffefefef),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFF006B),
      secondary: Color(0xffffffff),
      tertiary: Color(0xffffffff),
    ));

ThemeData get darkTheme => ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(elevation: 0.0),
    scaffoldBackgroundColor: const Color(0xff101010),
    colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFF006B),
        secondary: Color(0xff000000),
        tertiary: Color(0xff464646)));
