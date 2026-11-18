import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/firestore_service.dart';
import '../services/auth_service.dart';
import '../widgets/custom_button.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final service = FirestoreService();
  final auth = AuthService();

  final title = TextEditingController();
  final description = TextEditingController();

  String status = 'Pendiente';
  TaskModel? existingTask;
  bool initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!initialized) {
      existingTask =
          ModalRoute.of(context)?.settings.arguments as TaskModel?;

      if (existingTask != null) {
        title.text = existingTask!.title;
        description.text = existingTask!.description;
        status = existingTask!.status;
      }

      initialized = true;
    }
  }

  Future<void> saveTask() async {
    if (title.text.trim().isEmpty) return;

    final user = auth.currentUser;

    if (user == null) return;

    try {
      final task = TaskModel(
        id: existingTask?.id ?? '',
        title: title.text.trim(),
        description: description.text.trim(),
        status: status,
        userId: user.uid,
      );

      if (existingTask == null) {
        await service.createTask(task);
      } else {
        await service.updateTask(task);
      }

      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar: $e')),
      );
    }
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          existingTask == null ? 'Nueva tarea' : 'Editar tarea',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: description,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Descripción',
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: status,
              decoration: const InputDecoration(
                labelText: 'Estado',
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Pendiente',
                  child: Text('Pendiente'),
                ),
                DropdownMenuItem(
                  value: 'En progreso',
                  child: Text('En progreso'),
                ),
                DropdownMenuItem(
                  value: 'Completada',
                  child: Text('Completada'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => status = value);
                }
              },
            ),

            const SizedBox(height: 25),

            CustomButton(
              text: 'Guardar tarea',
              onPressed: saveTask,
            ),
          ],
        ),
      ),
    );
  }
}