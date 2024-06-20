import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification?.title);
  print(message.notification?.body);
  print(message.data);
}

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();

    print('User granted permission: ${settings.authorizationStatus}');

    final fcmToken = await _firebaseMessaging.getToken();

    print("token : $fcmToken");

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(const AndroidNotificationChannel(
            "high_importance_channel", "high_importance_channel",
            importance: Importance.max));

    await flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher")));

    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      badge: true,
      alert: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            const NotificationDetails(
                android: AndroidNotificationDetails(
                    "high_importance_channel", "high_importance_notification",
                    playSound: true, importance: Importance.max)));

        print(notification.body);
      }
    });
  }
}
