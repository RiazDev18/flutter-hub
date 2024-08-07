import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';  // Import for TimeOfDay
import '../providers/task.dart';  // Import Task model

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  factory DBHelper() {
    return _instance;
  }

  DBHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('tasks.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, filePath),
      onCreate: _createDB,
      version: 1,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks(
        id TEXT PRIMARY KEY,
        description TEXT,
        dueDate TEXT,
        dueTime TEXT,
        isDone INTEGER
      )
    ''');
  }

  Future<void> insertTask(Task task) async {
    final db = await database;
    await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTask(Task task) async {
    final db = await database;
    await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(String id) async {
    final db = await database;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final maps = await db.query('tasks');

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'] as String,  // Cast to String
        description: maps[i]['description'] as String,  // Cast to String
        dueDate: maps[i]['dueDate'] != null ? DateTime.parse(maps[i]['dueDate'] as String) : null,
        dueTime: maps[i]['dueTime'] != null ? TimeOfDay.fromDateTime(DateTime.parse(maps[i]['dueTime'] as String)) : null,
        isDone: maps[i]['isDone'] == 1,
      );
    });
  }
}

extension on Task {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'dueDate': dueDate?.toIso8601String(),
      'dueTime': dueTime != null ? DateTime(0, 0, 0, dueTime!.hour, dueTime!.minute).toIso8601String() : null,
      'isDone': isDone ? 1 : 0,
    };
  }
}
