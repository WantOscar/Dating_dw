import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(elevation: 0.0),
    scaffoldBackgroundColor: const Color(0xffefefef),
    colorScheme: const ColorScheme.light(
        primary: Color(0xFFFF006B),
        primaryContainer: Color(0xffffe6f0),
        secondary: Color(0xffffffff),
        tertiary: Color(0xffffffff),
        onSecondary: Color(0xff000000)));

ThemeData get darkTheme => ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(elevation: 0.0),
    scaffoldBackgroundColor: const Color(0xff101010),
    colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFF006B),
        primaryContainer: Color(0xff444444),
        secondary: Color(0xff000000),
        tertiary: Color(0xff464646),
        onSecondary: Color(0xffffffff)));
