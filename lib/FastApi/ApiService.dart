// lib/services/api_service.dart
import 'dart:convert';
import 'package:bhm/FastApi/todo_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://10.0.2.2:8000'; // For Android emulator
  // Use 'http://localhost:8000' for iOS simulator

  // Get all todos
  Future<List<Todo>> getTodos() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Todo.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Create todo
  Future<String> createTodo(Todo todo) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(todo.toJson()),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['id'];
      } else {
        throw Exception('Failed to create todo');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Update todo
  Future<void> updateTodo(String id, Todo todo) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(todo.toJson()),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to update todo');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Delete todo
  Future<void> deleteTodo(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      if (response.statusCode != 200) {
        throw Exception('Failed to delete todo');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
