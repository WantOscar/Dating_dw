import 'package:dating/api/firebase_api.dart';
import 'package:dating/binding/init_binding.dart';
import 'package:dating/firebase_options.dart';
import 'package:dating/screen/auth/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotification();
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffefefef),
          useMaterial3: false,
          appBarTheme: const AppBarTheme(elevation: 0.0)),
      home: const LoginScreen(),
      initialBinding: InitBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
