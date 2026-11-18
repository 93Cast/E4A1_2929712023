class TaskModel {
  final String id;
  final String title;
  final String description;
  final String status;
  final String userId;

  TaskModel({
    this.id = '',
    required this.title,
    required this.description,
    this.status = 'Pendiente',
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'status': status,
      'userId': userId,
      'createdAt': DateTime.now(),
    };
  }

  factory TaskModel.fromMap(
    String id,
    Map<String, dynamic> map,
  ) {
    return TaskModel(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      status: map['status'] ?? 'Pendiente',
      userId: map['userId'] ?? '',
    );
  }
}