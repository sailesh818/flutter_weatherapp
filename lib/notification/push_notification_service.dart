//import 'package:firebase_core/firebase_core.dart';
import 'dart:math';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:my_profile/notification/local_notification_service.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<AuthorizationStatus> requestNotificationPermission() async {
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    return settings.authorizationStatus;
  }

  Future<String> getFCMToken() async {
    final fcmToken = await _firebaseMessaging.getToken();

    //log('FCM Token: $fcmToken' as num);
    return fcmToken ?? '';
  }

  Future<void> initialize() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
      await LocalNotificationService().initialize(message);
    });
  }
}
