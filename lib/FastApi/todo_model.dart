// lib/models/todo.dart
class Todo {
  String? id;
  String title;
  String description;
  bool completed;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool isDeleted;

  Todo({
    this.id,
    required this.title,
    required this.description,
    this.completed = false,
    this.createdAt,
    this.updatedAt,
    this.isDeleted = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['_id']?.toString() ??
          json['id']?.toString(), // Handle MongoDB ObjectId
      title: json['title'],
      description: json['description'],
      completed: json['completed'] ?? false,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      isDeleted: json['is_deleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'completed': completed,
      'is_deleted': isDeleted,
    };
  }
}
