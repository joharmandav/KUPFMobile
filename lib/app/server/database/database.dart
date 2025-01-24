
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'db_constant.dart';

class DatabaseManager extends GetxService {
  static DatabaseManager? _databaseManger;
  static late Database _database;

  DatabaseManager._createInstance();

  factory DatabaseManager() {
    _databaseManger ??= DatabaseManager._createInstance();
    return _databaseManger!;
  }

  Future<DatabaseManager> initialize() async {
    _database = await initializeDatabase();
    return this;
  }

  Future<Database> initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, Constants.database);

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int newVersion) async {
    // await db.execute(Constants.socialUserInfoScheme);
    // await db.execute(Constants.functionMSTScheme);
    // await db.execute(Constants.functionUserScheme);
    // await db.execute(Constants.refTableScheme);
    // await db.execute(Constants.serviceSetupTableScheme);
  }

  Future<List<Map<String, dynamic>>> getMapList(String table) async {
    return await _database.query(table);
  }

  Future<int> insert(String table, dynamic model) async {
    return await _database.insert(table, model.toMap());
  }

  Future<int> update(String table, dynamic model) async {

    // if (table == Constants.ALERTS_TABLE){
    //   AlertsModel alertsModel = model;
    //   return await _database.update(table, alertsModel.toMap(),
    //       where: '${Constants.ID} = ?', whereArgs: [alertsModel.alertId]);
    // } else {
    //   Category category = model;
    //   return await _database.update(table, category.toMap(),
    //       where: '${Constants.ID} = ?', whereArgs: [category.id]);
    // }
    /// Yaad k liye
    return 1;
  }

  Future<int> delete(String table, int? id) async {

    return await _database.rawDelete(
        'DELETE FROM $table WHERE ${Constants.id} = $id');
  }

  Future<int> deleteLastSearches(String table, String? id) async {

    return _database.delete(table, where: "${Constants.id} = ?", whereArgs: [id]);
    // return await db.rawDelete(
    //     'DELETE FROM $table WHERE ${Constants.ID} = $id');
  }

  Future<bool> checkData(String table, String id) async {

    var result = await _database.rawQuery(
        'SELECT * FROM $table WHERE ${Constants.id} = $id');

    return result.isNotEmpty ? result[0].isNotEmpty : false;
  }

  Future<int> clear(String table) async {
    return await _database.delete(table);
  }

  Future<int?> getCount(String table) async {

    List<Map<String, dynamic>> list = await _database.rawQuery('SELECT COUNT (*) FROM $table');
    return Sqflite.firstIntValue(list);
  }

  Future<bool> checkRecord(String table, String id) async {

    var list = await _database.rawQuery('SELECT * FROM $table WHERE ${Constants.id} = $id');
    return list.isNotEmpty;
  }

  /*Future<List<Category>> getCategoryList() async {
    var noteMapList = await getMapList(Constants.CATEGORY_TABLE);
    int count = noteMapList.length;

    List<Category> list = [];

    for (int i = 0; i < count; i++) {
      list.add(Category.fromMapObject(noteMapList[i]));
    }

    return list;
  }

  Future<List<Test>> getLabTestList() async {
    var noteMapList = await getMapList(Constants.TEST_TABLE);
    int count = noteMapList.length;

    List<Test> list = [];

    for (int i = 0; i < count; i++) {
      try {
        list.add(Test.fromMap(noteMapList[i]));
      } catch (e) {
        print("Test List::: $e");
      }
    }

    return list;
  }

  Future<List<AlertsModel>> getAlerts() async {
    var noteMapList = await getMapList(Constants.ALERTS_TABLE);
    int count = noteMapList.length;

    List<AlertsModel> list = [];

    for (int i = 0; i < count; i++) {
      list.add(AlertsModel.fromMap(noteMapList[i]));
    }

    return list;
  }

  Future<List<LastSearchesModel>> getLastSearchesList() async {
    var noteMapList = await getMapList(Constants.LAST_SEARCHES_TABLE);
    int count = noteMapList.length;

    List<LastSearchesModel> list = [];

    for (int i = count - 1; i >= 0; i--) {
      list.add(LastSearchesModel.fromMapObject(noteMapList[i]));
    }

    return list;
  }*/
}