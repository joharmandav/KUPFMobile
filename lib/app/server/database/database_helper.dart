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

import '../../../presentation/models/employee_view_model.dart';
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

//   // insert all data in tables

 // TODO: Add EmployeeView if necessary

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
    return await db.query('DetailedEmployee');
  }

  Future close() async {
    final db = _database;
    db.close();
  }


// new
// Make fuction s of others tables and add it like below added
Future<void> insertDetailedEmployeeData(Map<String,dynamic> data)async{
final db = _database;
var detailEmployeeData = data['detailedEmployee'];
if(detailEmployeeData is Map<String,dynamic>){
      DetailedEmployeeModel detailEmployeeModel = DetailedEmployeeModel.fromMap(detailEmployeeData);

  
      print("Inserting detailedEmployee DATA: ${detailEmployeeModel.toMap()}");

    await db.insert(Constants.detailedEmployeeTablel, detailEmployeeModel.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
     var insertedData = await db.query(
      Constants.detailedEmployeeTablel,
      where: 'employeeId = ?', 
      whereArgs: [detailEmployeeModel.employeeId],

    );
    // Print the inserted data
    if (insertedData.isNotEmpty) {
      print("Inserted Employee Data: ${insertedData.first}");
    } else {
      print("No data found after insertion");
    }



  
  }
 
}
Future<void> insertransactionHdData(Map<String,dynamic> data)async{
  final db = _database;
var transactionHdData = data['transactionHD'];
if(transactionHdData is List){
   List<TransactionHDModel> transactionHdModelList =  transactionHdData.map((item)=>TransactionHDModel.fromMap(item)).toList();
    for(var model in transactionHdModelList){
            print("Inserting transactionHD DATA: ${model.toMap()}");

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
      print("Inserting transactionDT DATA: ${model.toMap()}");
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
                                    print("Inserting refTable DATA: ${model.toMap()}");

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
                              print("Inserting webPages DATA: ${model.toMap()}");

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
                        print("Inserting webPageUrl DATA: ${model.toMap()}");

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
                  print("Inserting webContent DATA: ${model.toMap()}");

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
            print("Inserting crupAudit DATA: ${model.toMap()}");
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
              print("Inserting function_MST DATA: ${model.toMap()}");

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
        print("Inserting fuctioN_USER DATA: ${model.toMap()}");
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
       print("Inserting transDTSubMonthly DATA: ${model.toMap()}");
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
       print("Inserting transactionHddapprovalDetail DATA: ${model.toMap()}");
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
       print("Inserting transactionHddm DATA: ${model.toMap()}");
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
 
//  selecting employee details from employee table to shpow in profile
Future<EmployeeViewModel> getDetailedEmployeeDetails()async{
  final db = _database;
   var empDet = await db.rawQuery("SELECT * FROM ${Constants.employeeViewTable} WHERE ${Constants.employeeID}=?",['18101949']);
 if (empDet.isNotEmpty) {
  print("Employee DETALAl>>>>>>>>>  $empDet");
  print("FIRSt VAL>>>>>>>>>...  ${empDet.first}");
    return EmployeeViewModel.fromMap(empDet.first);  
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
