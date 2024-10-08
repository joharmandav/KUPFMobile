import 'package:get/get_core/src/get_main.dart';
import 'package:kupf_mobile/app/server/database/db_constant.dart';
import 'package:kupf_mobile/presentation/models/crup_audit_model.dart';
import 'package:kupf_mobile/presentation/models/detailed_employee_model.dart';
import 'package:kupf_mobile/presentation/models/function_user_model.dart';
import 'package:kupf_mobile/presentation/models/service_setup_model.dart';
import 'package:kupf_mobile/presentation/models/transDtSubMonthly_model.dart';
import 'package:kupf_mobile/presentation/models/transactionHddMs_model.dart';
import 'package:kupf_mobile/presentation/models/transaction_dt_model.dart';
import 'package:kupf_mobile/presentation/models/transaction_hdd_approval_details_model.dart';
import 'package:kupf_mobile/presentation/models/web_content_model.dart';
import 'package:kupf_mobile/presentation/models/web_page_url_model.dart';
import 'package:kupf_mobile/presentation/models/web_pages_model.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import '../../../presentation/models/function_mst_model.dart';
import '../../../presentation/models/ref_table_model.dart';
import '../../../presentation/models/transaction_hd_model.dart';

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
      await db.execute(Constants.serviceSetupTableSchemal);
      await db.execute(Constants.crupAuditTablelSchema);
      await db.execute(Constants.functionMSTModelSchema);
      await db.execute(Constants.functionUserModelScehema);
      await db.execute(Constants.refTableScheme);
      await db.execute(Constants.transactionDTSchema);
      await db.execute(Constants.transactionHdScehma);
      await db.execute(Constants.transactionHDDApprovalDetailScehma);
      await db.execute(Constants.transactionHDDMSSchema);
      await db.execute(Constants.transactionHDTerminationScehma);
      await db.execute(Constants.transDTSubMonSchema);
      await db.execute(Constants.webContentScehma);
      await db.execute(Constants.webPagesSchema);
      await db.execute(Constants.webPagesUrlScehma);
      await db.execute(Constants.employeeViewScehma);
      print("All Tables created successfully.");
    } catch (e) {
      print("Error creating  table: $e");
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

  // insert all data in tables
  Future<void> insertDataIntoTables(Map<String, dynamic> data) async {
  final db = _database;
    var detailedEmployeeData = data['detailedEmployee'];
    if(detailedEmployeeData!=null){
     if(detailedEmployeeData is List){
      // If it's a list, map the items to your model
      List<DetailedEmployeeModel> detailedEmplModel = detailedEmployeeData
          .map((item) => DetailedEmployeeModel.fromMap(item))
          .toList();
      
      // Insert each item into the database
      for (var model in detailedEmplModel) {
        await db.insert(
          'DetailedEmployee',
          model.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
     }
    }else if(detailedEmployeeData is Map<String, dynamic>){
      // If it's a single map, treat it as one object
      DetailedEmployeeModel detailedEmplModel =
          DetailedEmployeeModel.fromMap(detailedEmployeeData);
      
      // Insert the single object into the database
      await db.insert(
        'DetailedEmployee',
        detailedEmplModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }else{
            print("Unexpected data format for detailedEmployeeTablel");

    }
    }else{
          print("No data available for detailedEmployeeTablel");

    }
 // printing data
  List<Map<String, dynamic>> insertedDetailedEmployeeData =
      await db.query(Constants.detailedEmployeeTablel);
  print("DATA OF DETAILED EMP TABLE: $insertedDetailedEmployeeData");

   // TransactionHD table
  var transhdData = data['transactionHD'];

if (transhdData != null) {
  if (transhdData is List) {
    // If it's a list, map the items to your model
    List<TransactionHDModel> transhdModelList = transhdData
        .map((item) => TransactionHDModel.fromMap(item))
        .toList();

    // Insert each item into the database
    for (var model in transhdModelList) {
      await db.insert(
        'TransactionHD',
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  } else {
    print("Unexpected data format for TransactionHD Table: ${transhdData.runtimeType}");
  }
} else {
  print("No data available for TransactionDT Table");
}

   // printing data
  List<Map<String, dynamic>> inserdTransacHdTble =
      await db.query(Constants.transactionHdTable);
  print("DATA OF TransactionHD TABLE: $inserdTransacHdTble");

  
  // TransactionDT table
    var transDtData = data['transactionDT'];
    if(transDtData!=null){
     if(transDtData is List){
       List<TransactionDtModel> transDtModelList = transDtData
        .map((item) => TransactionDtModel.fromMap(item))
        .toList();

    for (var model in transDtModelList) {
    await db.insert(
      'TransactionDT',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
     } else {
    print("Unexpected data format for TransactionDT Table: ${transDtData.runtimeType}");
  }
    }else{
        print("No data available for TransactionDT Table");

    }
    // printing data
     List<Map<String, dynamic>> inserdTransacDTTble =
      await db.query(Constants.transactionDTTable);
  print("DATA OF TransactionDT TABLE: $inserdTransacDTTble");

 
 
  // REFTABLE
  var refTableData = data['refTable'];
  if(refTableData!=null){
   if(refTableData is List){
     List<RefTableModel> refTableModelList = refTableData
        .map((item) => RefTableModel.fromMap(item))
        .toList();

    for (var model in refTableModelList) {
    await db.insert(
      'REFTABLE',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
   }else{
        print("Unexpected data format for REF Table: ${refTableData.runtimeType}");

   }
  }else{
           print("No data available for REf Table");

  }
  // printing data
 List<Map<String, dynamic>> insertRefTAbleDAta =
      await db.query(Constants.refTable);
  print("DATA OF REf TABLE: $insertRefTAbleDAta");
 


  // serviceSetup table
  var serViceSetupData = data['serviceSetup'];
  if(serViceSetupData!=null){
  if(serViceSetupData is List){
    List<ServiceSetupModel> ssetpModelList = serViceSetupData
        .map((item) => ServiceSetupModel.fromMap(item))
        .toList();

    for (var model in ssetpModelList) {
    await db.insert(
      'ServiceSetup',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  }else{

  }
  }else{

  }
  // printing data
   List<Map<String, dynamic>> sstPData =
      await db.query(Constants.serviceSetupTable);
  print("DATA OF SERVICE SETUP: $sstPData");
  // TODO
 
  // WebPages table
  List<WebPagesModel> webPageModel = (data[Constants.webPagesTable] as List)
      .map((item) => WebPagesModel.fromMap(item))
      .toList();
  for (var model in webPageModel) {
    await db.insert(
      Constants.webPagesTable,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  // WebPageUrls table
  List<WebPageUrlModel> webPageUrlModel = (data[Constants.webPageUrlTable] as List)
      .map((item) => WebPageUrlModel.fromMap(item))
      .toList();
  for (var model in webPageUrlModel) {
    await db.insert(
      Constants.webPageUrlTable,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
    // WebContent table
  List<WebContentModel> webContentModel = (data[Constants.webContentTable] as List)
      .map((item) => WebContentModel.fromMap(item))
      .toList();
  for (var model in webContentModel) {
    await db.insert(
      Constants.webContentTable,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  // CRUP_AUDIT table is emty
  List<CRUPAuditModel> crupAuditModel = (data[Constants.crupAuditTable] as List)
      .map((item) => CRUPAuditModel.fromMap(item))
      .toList();
  for (var model in crupAuditModel) {
    await db.insert(
      Constants.crupAuditTable,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

 

  

  // FUNCTION_MST table
  List<FunctionMSTModel> functionMstModel = (data[Constants.functionMSTTable] as List)
      .map((item) => FunctionMSTModel.fromMap(item))
      .toList();
  for (var model in functionMstModel) {
    await db.insert(
      Constants.functionMSTTable,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // FUNCTION_USER table
  List<FunctionUserModel> functionUserModel = (data[Constants.functionUserTable] as List)
      .map((item) => FunctionUserModel.fromMap(item))
      .toList();
  for (var model in functionUserModel) {
    await db.insert(
      Constants.functionUserTable,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  // TransDTSubMonthly table
  List<TransactionDtSubMonthlyModel> transSubMonModel =
      (data[Constants.transDTSubMonTable] as List)
          .map((item) => TransactionDtSubMonthlyModel.fromMap(item))
          .toList();
  for (var model in transSubMonModel) {
    await db.insert(
      Constants.transDTSubMonTable,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  


 

  // TransactionHDDApprovalDetails table
  List<TransactionHDDApprovalDetailsModel> trsacHddAproModel =
      (data[Constants.transactionHDDApprovalDetailsTable] as List)
          .map((item) => TransactionHDDApprovalDetailsModel.fromMap(item))
          .toList();
  for (var model in trsacHddAproModel) {
    await db.insert(
      Constants.transactionHDDApprovalDetailsTable,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // TransactionHDDM table
  List<TransactionHddmsModel> transHddmsModel = (data[Constants.transactionHDDMSTable] as List)
      .map((item) => TransactionHddmsModel.fromMap(item))
      .toList();
  for (var model in transHddmsModel) {
    await db.insert(
      Constants.transactionHDDMSTable,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

 


  

  

  // TODO: Add EmployeeView if necessary
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

 Future<List<TransactionHDModel>> insertTransactionData(List<dynamic> transactions) async {
  final db = _database; // Ensure _database is initialized elsewhere.

  // Inserting new transactions
  for (var transaction in transactions) {
    await db.insert(
      Constants.transactionHdTable, // Table name
      TransactionHDModel.fromMap(transaction).toMap(), // Convert transaction to map
      conflictAlgorithm: ConflictAlgorithm.replace, // Replace if conflicts occur
    );
  }

  // Retrieving and logging existing records from the table
  List<TransactionHDModel> adultList = [];
  var adult = await db.query(
    Constants.transactionHdTable,
  );

  if (adult.isNotEmpty) {
    for (var item in adult) {
      adultList.add(TransactionHDModel.fromMap(item)); // Add items to the list
      Get.log(item.toString()); // Log item to console
    }
  }

  // Return the retrieved list
  return adultList; 
}


}
