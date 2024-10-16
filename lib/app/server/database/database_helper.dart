import 'package:get/get_core/src/get_main.dart';
import 'package:kupf_mobile/app/server/database/db_constant.dart';
import 'package:kupf_mobile/presentation/models/crup_audit_model.dart';
import 'package:kupf_mobile/presentation/models/detailed_employee_model.dart';
import 'package:kupf_mobile/presentation/models/function_user_model.dart';
import 'package:kupf_mobile/presentation/models/serviceSetup_model.dart';
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
  insertServiceSetupData(data);


 
  // WebPages table
  var webPageData = data['webPages'];
  if(webPageData!=null){
  if(webPageData is List){
    List<WebPagesModel> webPageModelList = webPageData
        .map((item) => WebPagesModel.fromMap(item))
        .toList();

    for (var model in webPageModelList) {
    await db.insert(
      'WebPages',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  }else{

  }
  }else{

  }
  // printing data
   List<Map<String, dynamic>> webPageDataP =
      await db.query(Constants.webPagesTable);
  print("DATA OF WEB PAGE DATA: $webPageDataP");

  // WebPageUrls table
 var webPageUrlData = data['webPageUrl'];
  if(webPageUrlData!=null){
  if(webPageUrlData is List){
    List<WebPageUrlModel> webPageUrlModelList = webPageUrlData
        .map((item) => WebPageUrlModel.fromMap(item))
        .toList();

    for (var model in webPageUrlModelList) {
    await db.insert(
      'WebPageUrls',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  }else{

  }
  }else{

  }
  // printing data
   List<Map<String, dynamic>> webPageUrlDataP =
      await db.query(Constants.webPageUrlTable);
  print("DATA OF WEB PAGE URL DATA: $webPageUrlDataP");


    // WebContent table
   var webPageContentData = data['webContent'];
  if(webPageContentData!=null){
  if(webPageContentData is List){
    List<WebContentModel> webPageContentModelList = webPageContentData
        .map((item) => WebContentModel.fromMap(item))
        .toList();

    for (var model in webPageContentModelList) {
    await db.insert(
      'WebContent',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  }else{

  }
  }else{

  }
  // printing data
   List<Map<String, dynamic>> webPageContentDataP =
      await db.query(Constants.webContentTable);
  print("DATA OF WEB PAGE Content DATA: $webPageContentDataP");

  // TODO LATER CRUP_AUDIT table is emty 
 
 // FUNCTION_MST table
   var fuctMstData = data['functioN_MST'];
  if(fuctMstData!=null){
  if(fuctMstData is List){
    List<FunctionMSTModel> fuctMstModelList = fuctMstData
        .map((item) => FunctionMSTModel.fromJson(item))
        .toList();

    for (var model in fuctMstModelList) {
    await db.insert(
      'FUNCTION_MST',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  }else{

  }
  }else{

  }
  // printing data
   List<Map<String, dynamic>> fuctMstDataP =
      await db.query(Constants.functionMSTTable);
  print("DATA OF FUCTION MST DATA: $fuctMstDataP");

  // FUNCTION_USER table 
   var fuctUsrData = data['functioN_USER'];
  if(fuctUsrData!=null){
  if(fuctUsrData is List){
    List<FunctionUserModel> fuctUsrModelList = fuctUsrData
        .map((item) => FunctionUserModel.fromJson(item))
        .toList();

    for (var model in fuctUsrModelList) {
    await db.insert(
      'FUNCTION_USER',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  }else{

  }
  }else{

  }
  // printing data
   List<Map<String, dynamic>> fuctUsrDataP =
      await db.query(Constants.functionUserTable);
  print("DATA OF FUCTION USER DATA: $fuctUsrDataP");

  // TransDTSubMonthly table 
  var transDTSubMonData = data['transDTSubMonthly'];
  if(transDTSubMonData!=null){
  if(transDTSubMonData is List){
    List<TransactionDtSubMonthlyModel> transDTSubMonModelList = transDTSubMonData
        .map((item) => TransactionDtSubMonthlyModel.fromMap(item))
        .toList();

    for (var model in transDTSubMonModelList) {
    await db.insert(
      'TransDTSubMonthly',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  }else{

  }
  }else{

  }
  // printing data
   List<Map<String, dynamic>> transDTSubMonDataP =
      await db.query(Constants.transDTSubMonTable);
  print("DATA OF TransDT SUB MONTHLY  DATA: $transDTSubMonDataP");
  


 

  // TransactionHDDApprovalDetails table 
   var transHDAprovalDeTMData = data['transactionHddapprovalDetail'];
  if(transHDAprovalDeTMData!=null){
  if(transHDAprovalDeTMData is List){
    List<TransactionHDDApprovalDetailsModel> trnHDDAprDetMModelList = transHDAprovalDeTMData
        .map((item) => TransactionHDDApprovalDetailsModel.fromMap(item))
        .toList();

    for (var model in trnHDDAprDetMModelList) {
    await db.insert(
      'TransactionHDDApprovalDetails',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  }else{

  }
  }else{

  }
  // printing data
   List<Map<String, dynamic>> trnHDDAprDatap =
      await db.query(Constants.transactionHDDApprovalDetailsTable);
  print("DATA OF TransactionHDDAPROVAL DETAILS DATA: $trnHDDAprDatap");


  // TransactionHDDM table
     var transHDdMData = data['transactionHddm'];
  if(transHDdMData!=null){
  if(transHDdMData is List){
    List<TransactionHddmsModel> trnsHdMModelList = transHDdMData
        .map((item) => TransactionHddmsModel.fromMap(item))
        .toList();

    for (var model in trnsHdMModelList) {
    await db.insert(
      'TransactionHDDMS',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  }else{

  }
  }else{

  }
  // printing data
   List<Map<String, dynamic>> trnsHdMDataP =
      await db.query(Constants.transactionHDDMSTable);
  print("DATA OF TransactionHDDMS DATA: $trnsHdMDataP");

 


  

  

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
// Make fuction s of others tables and add it like below added
Future<void> insertDetailedEmployeeData(Map<String,dynamic> data)async{
final db = _database;
var detailEmployeeData = data['detailedEmployee'];
if(detailEmployeeData is List){
   List<DetailedEmployeeModel> detailEmployeeModelList =  detailEmployeeData.map((item)=>DetailedEmployeeModel.fromMap(item)).toList();
    for(var model in detailEmployeeModelList){
    await db.insert('DetailedEmployee', model.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }
  }
 
}
Future<void> insertransactionHdData(Map<String,dynamic> data)async{
  final db = _database;
var transactionHdData = data['transactionHD'];
if(transactionHdData is List){
   List<TransactionHDModel> transactionHdModelList =  transactionHdData.map((item)=>TransactionHDModel.fromMap(item)).toList();
    for(var model in transactionHdModelList){
    await db.insert('TransactionHD', model.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }
  }
}
Future<void> inserttransactionDTData(Map<String,dynamic> data)async{
  final db = _database;
  var transactionDT = data['transactionDT'];
  if(transactionDT is List){
   List<TransactionDtModel> transactionDTModelList =  transactionDT.map((item)=>TransactionDtModel.fromMap(item)).toList();
    for(var model in transactionDTModelList){
    await db.insert('TransactionDT', model.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }
  }
}
Future<void> insertrefTableData(Map<String,dynamic> data)async{
  final db = _database;
  var refTabledata = data['refTable'];
  if(refTabledata is List){
   List<RefTableModel> refTablModelList =  refTabledata.map((item)=>RefTableModel.fromMap(item)).toList();
    for(var model in refTablModelList){
    await db.insert('REFTABLE', model.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }
  }
}
Future<void> insertwebPagesData(Map<String,dynamic> data)async{
  final db = _database;
  var webPagesData = data['webPages'];
  if(webPagesData is List){
   List<WebPagesModel> webPagesModelList =  webPagesData.map((item)=>WebPagesModel.fromMap(item)).toList();
    for(var model in webPagesModelList){
    await db.insert('WebPages', model.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }
  }
}
Future<void> insertWebPageUrlData(Map<String,dynamic> data)async{
  final db = _database;
  var webPageUrlData = data['webPageUrl'];
  if(webPageUrlData is List){
   List<WebPageUrlModel> webPageUrlModelList =  webPageUrlData.map((item)=>WebPageUrlModel.fromMap(item)).toList();
    for(var model in webPageUrlModelList){
    await db.insert('WebPageUrls', model.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }
  }
}
Future<void> insertWebContentData(Map<String,dynamic> data)async{
  final db = _database;
  var webContentData = data['webContent'];
   if(webContentData is List){
   List<WebContentModel> webContentModelList =  webContentData.map((item)=>WebContentModel.fromMap(item)).toList();
    for(var model in webContentModelList){
    await db.insert('WebContent', model.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }
  }
}
Future<void> insertCrupAuditData(Map<String,dynamic> data)async{
  final db = _database;
  var crupAuditData = data['crupAudit'];
   if(crupAuditData is List){
   List<CRUPAuditModel> crupAuditModelList =  crupAuditData.map((item)=>CRUPAuditModel.fromMap(item)).toList();
    for(var model in crupAuditModelList){
    await db.insert('table', model.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }
  }
}
Future<void> insertFuctionMstData(Map<String,dynamic> data)async{
  final db = _database;
  var fuctionMstData = data['function_MST'];
   if(fuctionMstData is List){
   List<FunctionMSTModel> fuctionMSTModelList =  fuctionMstData.map((item)=>FunctionMSTModel.fromJson(item)).toList();
    for(var model in fuctionMSTModelList){
    await db.insert('FUNCTION_MST', model.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }
  }
}
Future<void> insertfunctionUsrData(Map<String,dynamic> data)async{
  final db = _database;
  var fuctionUsrData = data['fuctioN_USER'];
  if(fuctionUsrData is List){
   List<FunctionUserModel> fuctionUsrDataList =  fuctionUsrData.map((item)=>FunctionUserModel.fromJson(item)).toList();
    for(var model in fuctionUsrDataList){
    await db.insert('FUNCTION_USER', model.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }
  }
}
Future<void> insertTransDtSubMonData(Map<String,dynamic> data)async{
  final db = _database;
  var transactionDtSubMonData = data['transDTSubMonthly'];
   if(transactionDtSubMonData is List){
   List<TransactionDtSubMonthlyModel> transactionDtSubMonModelList =  transactionDtSubMonData.map((item)=>TransactionDtSubMonthlyModel.fromMap(item)).toList();
    for(var model in transactionDtSubMonModelList){
    await db.insert('TransDTSubMonthly', model.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }
  }
}
Future<void> insertTrnsHdAproDetailsData(Map<String,dynamic> data)async{
  final db = _database;
  var transHdAproDetaData = data['transactionHddapprovalDetail'];
  if(transHdAproDetaData is List){
   List<TransactionHDDApprovalDetailsModel> transHdAproDetaDataModelList =  transHdAproDetaData.map((item)=>TransactionHDDApprovalDetailsModel.fromMap(item)).toList();
    for(var model in transHdAproDetaDataModelList){
    await db.insert('TransactionHDDApprovalDetails', model.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }
  }
}
Future<void> insertTrnsHddMData(Map<String,dynamic> data)async{
  final db = _database;
  var transHddMData = data['transactionHddm'];
  if(transHddMData is List){
    List<TransactionHddmsModel> transHddMModelList =  transHddMData.map((item)=>TransactionHddmsModel.fromMap(item)).toList();
    for(var model in transHddMModelList){
    await db.insert('TransactionHDDMS', model.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
    }
  }
}
//  service setup table data
  Future<void> insertServiceSetupData(Map<String, dynamic> data) async {
    final db = _database;
  // Extract service setup data from the provided data map
  var serviceSetupData = data['serviceSetup'];

  // Check if service setup data is not null and is a list
  if (serviceSetupData is List) {
    // Map the data to a list of ServiceSetupModel objects
    List<ServiceSetupModel> serviceSetupModels = serviceSetupData
        .map((item) => ServiceSetupModel.fromMap(item))
        .toList();

    // Insert each ServiceSetupModel into the database
    for (var model in serviceSetupModels) {
       print("Inserting SERVICE SETUP DATA: ${model.toMap()}");
      await db.insert(
        'ServiceSetup',
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}
 
//  selecting employee details from employee table
Future<DetailedEmployeeModel> getDetailedEmployeeDetails()async{
    final db = _database;
  List<DetailedEmployeeModel> detailEmplList = [];
   var empDet = await db.rawQuery("SELECT * FROM ${Constants.employeeViewTable} WHERE employeeID='18101949'");
 if (empDet.isNotEmpty) {
    return DetailedEmployeeModel.fromMap(empDet.first);  // Assuming fetching for a single employee
  } else {
    throw Exception('No employee data found');
  }
}
// Future<List<RefTableModel>> getOccupation() async {
//     final db = await database;
//     List<RefTableModel> occupationList = [];

//     var occupation = await db.rawQuery(
//       "SELECT * FROM ${Constants.refTable} WHERE ${Constants.refType} = 'KUPF' AND ${Constants.refSubType} = 'Occupation';",
//     );

//     if (occupation.isNotEmpty) {
//       for (var item in occupation) {
//         occupationList.add(RefTableModel.fromMap(item));
//       }
//     }
//     return occupationList;
//   }




}
