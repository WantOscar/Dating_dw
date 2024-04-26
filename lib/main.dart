import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/binding/login_binding.dart';
import 'package:dating/screen/auth/login_screen.dart';
import 'package:dating/screen/home_screen.dart';
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
      home: const LoginScreen(),
      initialBinding: LoginBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CachedNetworkImage(
            imageUrl:
                "https://nc-bucket123.s3.ap-northeast-2.amazonaws.com/cammet/profile/qazws78941@naver.com/2504a6a0-3bf2-1f94-b640-27515fd5ce30.png"),
      ),
    );
  }
}
