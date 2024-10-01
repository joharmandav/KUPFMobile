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

    return await openDatabase(path, version: 1, onCreate: _createDB,onUpgrade: _upgradeDB);
  }
  
   Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE my_table (
      TenentId          INTEGER NOT NULL,
      locationId        INTEGER NOT NULL,
      employeId         INTEGER NOT NULL,
      englishName       TEXT,
      arabicName        TEXT,
      empDob            DATETIME,
      empGender         SMALLINT,
      number            TEXT,
      empWorkEmail      TEXT,
      department        INTEGER,
      salary            NUMERIC,
      empPaciNum        NVARCHAR,
      empOtherId        NVARCHAR,
      next2KinName      NVARCHAR,
      next2KinMobNumber NVARCHAR,
      jobTitleName      NVARCHAR
    )
    ''');
    print("Table 'my_table' created.");

  }

   // Upgrade database schema from version 1 to 2, adding new columns
  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await addNewColums(db);
    }
  }
//  TODO REMOVE AFTER TESTING 
  Future<void> addNewColums(Database db) async{
  }

   Future<int> insertData(Map<String, dynamic> data) async {
    final db = await instance.database;
       // Check if the entry already exists
    final List<Map<String, dynamic>> existingEmployeeDetails = await db.query(
      'my_table',
      where: 'employeId = ?',
      whereArgs: [data['employeId']],

    );
     if (existingEmployeeDetails.isNotEmpty) {
      print("Entry already exists.");
      return -1; // Indicate that the entry already exists
    }
    
    return await db.insert('my_table', data);
  }

  Future<int> updateData(Map<String, dynamic> data) async {
    final db = await instance.database;

    return await db.update(
      'my_table',
      data,
      where: 'employeId = ?',
      whereArgs: [data['employeId']],
    );
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