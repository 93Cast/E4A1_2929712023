import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../models/task_model.dart';
import '../widgets/task_card.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    final firestore = FirestoreService();

    final user = auth.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskFlow'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.profile,
              );
            },
          ),
        ],
      ),

      body: StreamBuilder<List<TaskModel>>(
        stream: firestore.getTasks(user.uid),

        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error al cargar tareas'),
            );
          }

          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final tasks = snapshot.data ?? [];

          if (tasks.isEmpty) {
            return const Center(
              child: Text('No tienes tareas registradas'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: tasks.length,

            itemBuilder: (context, index) {
              final task = tasks[index];

              return TaskCard(
                task: task,

                onEdit: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.task,
                    arguments: task,
                  );
                },

                onDelete: () async {
                  await firestore.deleteTask(task.id);
                },
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.task,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}