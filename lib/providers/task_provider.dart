import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deled_new_app/services/firestore_service.dart';
import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasklist = [];

  List<Task> get tasks => _tasklist;
  final _firestore = FirebaseFirestore.instance;

  /// Add a new task
  Future<void> addTask(Map<String, dynamic> task) async {
    await FirestoreService().addtasks(task);
    _tasklist.add(Task.fromJson(task));
    notifyListeners();
  }

  /// Remove a task by ID
  Future<void> removeTask(String id) async {
    await FirestoreService().removetasks(id);
    _tasklist.removeWhere((task) => task.taskid == id);

    notifyListeners();
  }

  /// Fetch tasks as a stream
  ///
  Stream<List<Task>> fetchTask() {
    return _firestore.collection('tasks').snapshots().map((snapshot) => snapshot
        .docs
        .map((doc) => Task.fromJson(doc.data()..['taskid'] = doc.id))
        .toList());
  }

  /// Listen to task updates and notify listeners
  void listenToTasks() {
    fetchTask().listen((taskList) {
      _tasklist = taskList;
      notifyListeners();
    });
  }
}

class Task {
  String taskName;
  String taskid;
  Task({
    required this.taskName,
    required this.taskid,
  });

  Map<String, dynamic> toJson() {
    return {'taskName': taskName};
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskName: json['taskName'] ?? '',
      taskid: json['taskid'] ?? '',
    );
  }
}
