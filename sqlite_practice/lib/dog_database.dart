import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class dogDatabase {
  static Database?  db;

  Future<Database> getDatabse ()async
  {
    final dirPath = await getDatabasesPath();
    final path = join(dirPath,'dog_database.db');

    // open database
    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db,version){
        db.execute(
          ''' CREATE TABLE dogs(id INTEGER PRIMARY KEY,name TEXT, age INTEGER)'''
        );
      }
    );
    return database;
  }
  // to check whether table created or not
 Future<Database> getDb()async{
    if(db != null)
      {
        return db!;
      }
    else{
      db = await getDatabse();
      return db!;
    }
 }

  //insert a Dog
 Future<void> insertDog(int id ,String name,int age) async {
    final db = await getDb();
    await db.insert(
        'dogs',
        {
          'id': id,
          'name' : name,
          'age' : age
        }
    );
 }

 // retrieve dog

 Future<List<Map>> getDog()async{
   final db = await getDb();
   final data  = await db.query("dogs");
   for(var d in data )
     {
       print(d);
     }
   return data;
 }


 // delete the dog
Future<void> deleteDog(int id)async
{
  final db = await getDb();
  await db.delete(
    'dogs',
    where: 'id = ?',
   whereArgs: [id]
);
}
  Future<void> updateDog(int id)async
  {
    final db = await getDb();
    await db.update(
        'dogs',
        {
          'id' : 1,
          'name' : 'chutii',
          'age' : 4
        }
    );
  }
}