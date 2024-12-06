import 'package:dating/controller/chat_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint(message.notification?.title);
  debugPrint(message.notification?.body);
  debugPrint(message.data.toString());
}

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();

    debugPrint('User granted permission: ${settings.authorizationStatus}');

    final fcmToken = await _firebaseMessaging.getToken();

    debugPrint("token : $fcmToken");

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(const AndroidNotificationChannel(
            "high_importance_channel", "High Importance Notifications",
            importance: Importance.max));

    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings(
          requestSoundPermission: false,
          requestBadgePermission: false,
          requestAlertPermission: false,
        ),
      ),
    );

    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      badge: true,
      alert: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        debugPrint("title : {$notification.title}");
        debugPrint("content: ${notification.body}");
        debugPrint("room ID: ${message.data["chatRoomNo"]}");
        ChatController.to.updateLastMessage(
            int.parse(message.data["chatRoomNo"]), notification.body!);

        showNotification(notification);
      }
    });
  }

  Future<void> showNotification(RemoteNotification notification) async {
    flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            "high_importance_channel",
            "High Importance Notifications",
            playSound: true,
            importance: Importance.max,
          ),
        ));
  }
}
