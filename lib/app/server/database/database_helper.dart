import 'package:kupf_mobile/app/server/database/db_constant.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseManger;
  static late Database _database;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    _databaseManger ??= DatabaseHelper._createInstance();
    return _databaseManger!;
  }

  Future<DatabaseHelper> initialize() async {
    _database = await initializeDatabase('app.db');
    return this;
  }

  Future<Database> initializeDatabase(String filePath) async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }
 

  Future<void> _createDB(Database db, int version) async {
  try {
    await db.execute(Constants.detailEmpTableScehma);
    print("Table 'DetailedEmployee' created successfully.");
  } catch (e) {
    print("Error creating 'DetailedEmployee' table: $e");
  }
}


  // Upgrade database schema from version 1 to 2, adding new columns
  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await addNewColums(db);
    }
  }

//  TODO REMOVE AFTER TESTING
  Future<void> addNewColums(Database db) async {}

  Future<int> insertData(Map<String, dynamic> data) async {
    final db = _database;
    // Check if the entry already exists
    final List<Map<String, dynamic>> existingEmployeeDetails = await db.query(
      'DetailedEmployee',
      where: 'employeeID = ?',
      whereArgs: [data['employeeID']],
    );
    if (existingEmployeeDetails.isNotEmpty) {
      print("Entry already exists.");
      return -1; // Indicate that the entry already exists
    }

    return await db.insert('DetailedEmployee', data);
  }
  
  
  Future<int> updateData(Map<String, dynamic> data) async {
    final db = _database.database;

    return await db.update(
      'DetailedEmployee',
      data,
      where: 'employeeID = ?',
      whereArgs: [data['employeeID']],
    );
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final db = _database;
    return await db.query(Constants.detailedEmployeeTablel);
  }

  Future close() async {
    final db = _database;
    db.close();
  }

}