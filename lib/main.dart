import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

import 'services/auth_service.dart';
import 'services/notification_service.dart';

import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/task_screen.dart';
import 'screens/profile_screen.dart';

import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await NotificationService().initialize();

  runApp(const TaskFlowApp());
}

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'TaskFlow',

      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),

      home: StreamBuilder(
        stream: auth.authState,

        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (snapshot.hasData) {
            return const HomeScreen();
          }

          return const LoginScreen();
        },
      ),

      routes: {
        AppRoutes.login: (context) =>
            const LoginScreen(),

        AppRoutes.register: (context) =>
            const RegisterScreen(),

        AppRoutes.home: (context) =>
            const HomeScreen(),

        AppRoutes.task: (context) =>
            const TaskScreen(),

        AppRoutes.profile: (context) =>
            const ProfileScreen(),
      },
    );
  }
}