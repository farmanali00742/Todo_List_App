import 'package:flutter/foundation.dart';
import 'todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [];

  void addTodo(String category, String description) {
    Todo newTodo = Todo(category: category, description: description);
    todos.add(newTodo);
    notifyListeners();
  }

  void delete(int index) {
    todos.removeAt(index);
    notifyListeners();
  }

  void update(int index, String cat, String des) {
    todos[index].description = des;
    todos[index].category = cat;
    notifyListeners();
  }
}
