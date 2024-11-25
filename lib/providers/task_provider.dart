import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasklist = [];

  List<Task> get tasks => _tasklist;

  void addTask(Task task) {
    _tasklist.add(task);
    notifyListeners();
  }
  void removeTask(int index) {
    _tasklist.removeAt(index);
    notifyListeners();
  }
}

class Task {
  String taskName;
  Task(this.taskName);
}
