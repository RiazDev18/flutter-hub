import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseService {
  static Database? db;

  Future<Database> getDatabase() async {
    final dbDirPath = await getDatabasesPath();
    final dbPath = join(dbDirPath, "student_db.db");
    final database = await openDatabase(
        dbPath,
        onCreate: (db, version) {
          db.execute('''
            CREATE TABLE students(reg_no TEXT, name TEXT NOT NULL, cell_no TEXT) 
          ''');
        },
        version: 1
    );
    return database;
  }

  Future<Database> getDB() async {
    if (db != null ) return db!;
    db = await getDatabase();
    return db!;
  }

  Future<void> addStudent(String reg_no, String name, cell_no) async {
    final db = await getDB();

    await db.insert(
        "students",
        { "reg_no": reg_no,
          "name": name,
          "cell_no": cell_no
        }
    );
  }

  Future<List<Map>> getStudents() async {
    final db = await getDB();
    final data = await db.query("students");
    for(var d in data) {
      print(d);
    }
    return data;
  }
}