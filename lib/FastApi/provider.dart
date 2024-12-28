// lib/providers/todo_provider.dart
import 'package:bhm/FastApi/ApiService.dart';
import 'package:bhm/FastApi/todo_model.dart';
import 'package:flutter/foundation.dart';

class TodoProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Todo> _todos = [];
  bool _isLoading = false;

  List<Todo> get todos => _todos;
  bool get isLoading => _isLoading;

  Future<void> loadTodos() async {
    _isLoading = true;
    notifyListeners();

    try {
      _todos = await _apiService.getTodos();
    } catch (e) {
      print('Error loading todos: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTodo(Todo todo) async {
    try {
      final id = await _apiService.createTodo(todo);
      todo.id = id;
      _todos.add(todo);
      notifyListeners();
    } catch (e) {
      print('Error adding todo: $e');
      rethrow;
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      await _apiService.updateTodo(todo.id!, todo);
      final index = _todos.indexWhere((t) => t.id == todo.id);
      if (index != -1) {
        _todos[index] = todo;
        notifyListeners();
      }
    } catch (e) {
      print('Error updating todo: $e');
      rethrow;
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      await _apiService.deleteTodo(id);
      _todos.removeWhere((todo) => todo.id == id);
      notifyListeners();
    } catch (e) {
      print('Error deleting todo: $e');
      rethrow;
    }
  }
}
