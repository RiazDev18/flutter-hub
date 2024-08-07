import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../services/db_helper.dart';  // Import the database helper

class Task {
  final String id;
  String description;
  DateTime? dueDate;
  TimeOfDay? dueTime;
  bool isDone;

  Task({
    required this.id,
    required this.description,
    this.dueDate,
    this.dueTime,
    this.isDone = false,
  });
}

class TaskProvider with ChangeNotifier {
  List<Task> _toDoList = [];
  final DBHelper dbHelper = DBHelper();

  TaskProvider() {
    _loadTasks();
  }

  List<Task> get itemsList {
    return _toDoList;
  }

  List<Task> get completedTasks {
    return _toDoList.where((task) => task.isDone).toList();
  }

  List<Task> get pendingTasks {
    return _toDoList.where((task) => !task.isDone).toList();
  }

  Future<void> _loadTasks() async {
    _toDoList = await dbHelper.getTasks();
    notifyListeners();
    print('Tasks loaded: ${_toDoList.length}');
  }

  Task getById(String id) {
    return _toDoList.firstWhere((task) => task.id == id);
  }

  Future<void> createNewTask(Task task) async {
    await dbHelper.insertTask(task);
    _toDoList.add(task);
    notifyListeners();
    print('Task added: ${task.description}');
  }

  Future<void> editTask(Task task) async {
    await dbHelper.updateTask(task);
    int index = _toDoList.indexWhere((t) => t.id == task.id);
    if (index >= 0) {
      _toDoList[index] = task;
      notifyListeners();
      print('Task updated: ${task.description}');
    }
  }

  Future<void> removeTask(String id) async {
    await dbHelper.deleteTask(id);
    _toDoList.removeWhere((task) => task.id == id);
    notifyListeners();
    print('Task removed: $id');
  }

  Future<void> changeStatus(String id) async {
    int index = _toDoList.indexWhere((task) => task.id == id);
    if (index >= 0) {
      _toDoList[index].isDone = !_toDoList[index].isDone;
      await dbHelper.updateTask(_toDoList[index]);
      notifyListeners();
      print('Task status changed: ${_toDoList[index].description}');
    }
  }
}
