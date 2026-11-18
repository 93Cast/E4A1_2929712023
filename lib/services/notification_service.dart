import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    // 1. Solicitar permisos
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    log('Estado de permisos FCM: ${settings.authorizationStatus}');

    // 2. Obtener el token ignorando la advertencia de obsolescencia de la versión actual
    // ignore: deprecated_member_use
    final token = await messaging.getToken();
    log('Token FCM: $token');

    // 3. Escuchar notificaciones en primer plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Notificación recibida en primer plano:');
      log('Título: ${message.notification?.title}');
      log('Cuerpo: ${message.notification?.body}');
    });
  }
}