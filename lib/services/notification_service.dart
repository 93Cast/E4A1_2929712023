import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging messaging =
      FirebaseMessaging.instance;

  Future<void> initialize() async {
    await messaging.requestPermission();

    final token = await messaging.getToken();

    print('Token FCM: $token');

    FirebaseMessaging.onMessage.listen((message) {
      print('Notificación recibida:');
      print(message.notification?.title);
      print(message.notification?.body);
    });
  }
}