import 'package:dating/binding/init_binding.dart';
import 'package:dating/screen/auth/login_screen.dart';
import 'package:dating/screen/home_screen.dart';
<<<<<<< HEAD
=======
import 'package:dating/screen/main/main_screen.dart';
>>>>>>> 94f8f44f9e6e82c1e01f06a5980dd20adb4be837
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
<<<<<<< HEAD
      // home: const LoginScreen(),
=======
>>>>>>> 94f8f44f9e6e82c1e01f06a5980dd20adb4be837
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      initialBinding: InitBinding(),
    );
  }
}
