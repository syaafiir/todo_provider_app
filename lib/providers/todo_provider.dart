import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final List<String> _todos = [];

  List<String> get todos => List.unmodifiable(_todos);

  void addTodo(String text) {
    if (text.trim().isEmpty) return;
    _todos.add(text.trim());
    notifyListeners();
  }

  void removeTodoAt(int index) {
    if (index < 0 || index >= _todos.length) return;
    _todos.removeAt(index);
    notifyListeners();
  }

  void clearAll() {
    _todos.clear();
    notifyListeners();
  }
}
