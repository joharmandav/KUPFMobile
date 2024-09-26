import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

    DatabaseHelper._init();
      Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app.db');
    return _database!;
  }

   Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    print("FILE PATH: $path");

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }
  
   Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE my_table (
      TenentId INTEGER NOT NULL,
      locationId INTEGER NOT NULL,
      employeId  INTEGER NOT NULL,
      englishName TEXT,
      arabicName  TEXT,
      empDob      DATETIME,
      empGender   SMALLINT,
      number TEXT

    )
    ''');
    print("Table 'my_table' created.");

  }

   Future<int> insertData(Map<String, dynamic> data) async {
    final db = await instance.database;
    return await db.insert('my_table', data);
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final db = await instance.database;
    return await db.query('my_table');
  }


  Future close() async {
    final db = await instance.database;
    db.close();
  }

}