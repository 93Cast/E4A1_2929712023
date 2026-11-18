import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class FirestoreService {
  final FirebaseFirestore _db =
      FirebaseFirestore.instance;

  CollectionReference get _tasks =>
      _db.collection('tasks');

  Stream<List<TaskModel>> getTasks(String userId) {
    return _tasks
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return TaskModel.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList();
    });
  }

  Future<void> createTask(TaskModel task) async {
    await _tasks.add(task.toMap());
  }

  Future<void> updateTask(TaskModel task) async {
    await _tasks.doc(task.id).update({
      'title': task.title,
      'description': task.description,
      'status': task.status,
    });
  }

  Future<void> deleteTask(String id) async {
    await _tasks.doc(id).delete();
  }
}