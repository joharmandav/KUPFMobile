import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kupf/helper/toaster.dart';
import 'package:kupf/presentation/models/crup_audit_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

import '../../../presentation/models/detailed_employee_model.dart';
import '../../../presentation/models/function_mst_model.dart';
import '../../../presentation/models/function_user_model.dart';
import '../../../presentation/models/kupf_image_model.dart';
import '../../../presentation/models/offers_model.dart';
import '../../../presentation/models/ref_table_model.dart';
import '../../../presentation/models/service_setup_model.dart';
import '../../../presentation/models/transaction_dt_model.dart';
import '../../../presentation/models/transaction_hd_model.dart';
import '../../../presentation/models/transaction_hdd_approval_details_model.dart';
import '../../../presentation/models/web_pages_model.dart';
import 'db_constant.dart';


class DbManager extends GetxService {
  static DbManager? _databaseManger;
  static late Database _database;

  DbManager._createInstance();

  factory DbManager() {
    _databaseManger ??= DbManager._createInstance();
    return _databaseManger!;
  }

  Future<Database> get database async {
    _database = await initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, Constants.kupfDatabase);

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      Get.log("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data =
      await rootBundle.load(join("assets/database", Constants.kupfDatabase));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      Get.log("Opening existing database");
    }

    return await openDatabase(path);
  }

  Future<List<Map<String, dynamic>>> getMapList(String table) async {
    // final db = await database;
    return await _database.query(table);
  }

  Future<int> insert(String table, dynamic model) async {
    // final db = await database;
    return await _database.insert(table, model.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  Future<int> update(String table, dynamic model) async {

    final db = await database;
    return await _database.update(
      table,
      model.toMap(),
      // Ensure that the table has a matching id.
      where: '${Constants.tenentID} = ?',
      // Pass the table's id as a whereArg to prevent SQL injection.
      whereArgs: [model.tenentID],
    );
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
    // return 1;
  }

  Future<int> updateEmployeeDetails(DetailedEmployeeModel model) async {

    // final db = await database;
    try {
      return await _database.update(
        Constants.detailedEmployeeTable,
        model.toMap(),
        // Ensure that the table has a matching id.
        where: '${Constants.employeeID} = ?',
        // Pass the table's id as a whereArg to prevent SQL injection.
        whereArgs: [model.employeeID],
      );
    } on Exception catch (e) {
      Toaster.showError(e.toString());
      return 0;
    }
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
    // return 1;
  }



  Future<int> delete(String table, int? id) async {
    final db = await database;
    return await _database.delete(
        table,
        // Use a `where` clause to delete a specific table.
        where: '${Constants.tenentID} = ?',
        // Pass the table id as a whereArg to prevent SQL injection.
        whereArgs: [id],
      );
  }

  Future<List<CRUPAuditModel>> getCRUPAuditByTenantID(int value) async {
    final db = await database;
    List<CRUPAuditModel> adultList = [];

    var adult = await db.rawQuery(
      "SELECT * FROM ${Constants.crupAuditTable} WHERE ${Constants.tenantID} = '$value';",
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(CRUPAuditModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<DetailedEmployeeModel?> getLogin(String loginID, String password, String deviceID) async {
    final db = await database;
    // List<FunctionMSTModel> adultList = [];
    DetailedEmployeeModel? detailedEmployeeModel;
    var adult = await db.rawQuery(
      "SELECT * FROM ${Constants.detailedEmployeeTable} WHERE ${Constants.employeeLoginID} = '$loginID' AND ${Constants.employeePassword} = '$password' AND ${Constants.tenentID} = '21' AND ${Constants.deLocationID} = '1';",
    );

    Get.log(adult.toString());

    if (adult.isNotEmpty) {
      detailedEmployeeModel = DetailedEmployeeModel.fromMap(adult.first);
      detailedEmployeeModel.deviceID = deviceID;
      var result = await updateEmployeeDetails(detailedEmployeeModel);
      Get.log(result.toString());
      Get.log(adult.toString());
    }
    return detailedEmployeeModel;
  }

  Future<List<RefTableModel>> getDepartments() async {
    final db = await database;
    List<RefTableModel> departmentList = [];

    var department = await db.rawQuery(
      "SELECT * FROM ${Constants.refTable} WHERE ${Constants.refType} = 'KUPF' AND ${Constants.refSubType} = 'Department';",
    );

    if (department.isNotEmpty) {
      for (var item in department) {
        departmentList.add(RefTableModel.fromMap(item));
      }
    }
    return departmentList;
  }

  Future<List<RefTableModel>> getOccupation() async {
    final db = await database;
    List<RefTableModel> occupationList = [];

    var occupation = await db.rawQuery(
      "SELECT * FROM ${Constants.refTable} WHERE ${Constants.refType} = 'KUPF' AND ${Constants.refSubType} = 'Occupation';",
    );

    if (occupation.isNotEmpty) {
      for (var item in occupation) {
        occupationList.add(RefTableModel.fromMap(item));
      }
    }
    return occupationList;
  }

  Future<List<FunctionMSTModel>> getFunctionMSTByTenentID(int value) async {
    final db = await database;
    List<FunctionMSTModel> adultList = [];

    var adult = await db.rawQuery(
      "SELECT * FROM ${Constants.functionMSTTable} WHERE ${Constants.tenentID} = '$value';",
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(FunctionMSTModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<List<FunctionUserModel>> getFunctionUserByTenentID(int value) async {
    final db = await database;
    List<FunctionUserModel> adultList = [];
    var adult = await db.rawQuery(
      "SELECT * FROM ${Constants.functionUserTable} WHERE ${Constants.tenentID} = '$value';",
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(FunctionUserModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<List<CRUPAuditModel>> getCRUPAudit() async {
    final db = await database;
    List<CRUPAuditModel> adultList = [];
    var adult = await db.query(
      Constants.crupAuditTable,
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(CRUPAuditModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<List<DetailedEmployeeModel>> getDetailedEmployee() async {
    final db = await database;
    List<DetailedEmployeeModel> adultList = [];
    var adult = await db.query(
      Constants.detailedEmployeeTable,
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(DetailedEmployeeModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<List<FunctionMSTModel>> getFunctionMST() async {
    final db = await database;
    List<FunctionMSTModel> adultList = [];
    var adult = await db.query(
      Constants.functionMSTTable,
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(FunctionMSTModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<List<FunctionUserModel>> getFunctionUser() async {
    final db = await database;
    List<FunctionUserModel> adultList = [];
    var adult = await db.query(
      Constants.functionUserTable,
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(FunctionUserModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<List<KUPFImageModel>> getKUPFImages() async {
    final db = await database;
    List<KUPFImageModel> adultList = [];
    var adult = await db.query(
      Constants.kupfImageTable,
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(KUPFImageModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<List<RefTableModel>> getREFTable() async {
    final db = await database;
    List<RefTableModel> adultList = [];
    var adult = await db.query(
      Constants.refTable,
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(RefTableModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<List<WebPagesModel>> getWebPages() async {
    final db = await database;
    List<WebPagesModel> adultList = [];
    var adult = await db.query(
      Constants.webPagesTable,
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(WebPagesModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<List<WebPageUrlModel>> getWebPageUrls() async {
    final db = await database;
    List<WebPageUrlModel> adultList = [];
    var adult = await db.query(
      Constants.webPageUrlTable,
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(WebPageUrlModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<List<TransactionDTModel>> getTransactionDT() async {
    final db = await database;
    List<TransactionDTModel> adultList = [];
    var adult = await db.query(
      Constants.transactionDTTable,
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(TransactionDTModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<List<TransactionHDModel>> getTransactionHDD() async {
    final db = await database;
    List<TransactionHDModel> adultList = [];
    var adult = await db.query(
      Constants.transactionHdTable,
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(TransactionHDModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<List<TransactionHDDApprovalDetailsModel>> getTransactionHDDApprovalDetail() async {
    final db = await database;
    List<TransactionHDDApprovalDetailsModel> adultList = [];
    var adult = await db.query(
      Constants.transactionHDDApprovalDetailsTable,
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(TransactionHDDApprovalDetailsModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<List<ServiceSetupModel>> getServiceSetup() async {
    final db = await database;
    List<ServiceSetupModel> adultList = [];
    var adult = await db.query(
      Constants.serviceSetupTable,
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        adultList.add(ServiceSetupModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return adultList;
  }

  Future<List<OffersModel>> getOffers() async {
    final db = await database;
    List<OffersModel> offers = [];
    var adult = await db.query(
      Constants.serviceSetupTable,
    );

    if (adult.isNotEmpty) {
      for (var item in adult) {
        offers.add(OffersModel.fromMap(item));
        Get.log(item.toString());
      }
    }
    return offers;
  }

  /*Future<List<IncludedDrug>> filterDrug(String value) async {
    final db = await database;
    List<IncludedDrug> filteredCompanies = [];
    var res = await db.rawQuery(
        "SELECT * FROM ${DBConstants.DRUG_TABLE} WHERE NAME like '${value.toUpperCase()}%';");

    if (res.length != null) {
      for (var item in res) {
        filteredCompanies.add(IncludedDrug.fromJson(item));
      }
    }
    return filteredCompanies;
  }

  Future<List<BrandListModel>> filterBrand(String value) async {
    final db = await database;
    List<BrandListModel> filteredCompanies = [];
    var res = await db.rawQuery(
        "SELECT * FROM ${DBConstants.BRAND_TABLE} WHERE BNAME like '${value.toUpperCase()}%';");

    if (res.length != null) {
      for (var item in res) {
        filteredCompanies.add(BrandListModel.fromJson(item));
      }
    }
    return filteredCompanies;
  }

  Future<List<BDACList>> getBrandDetail(String name) async {
    final db = await database;
    List<BDACList> filteredCompanies = [];
    List<BDACList> brandDrugCompanyList = [];
    var did = await db.rawQuery("SELECT DID FROM BRAND_DRUG WHERE NAME = '$name'");
    List<int> code = [];
    did.forEach((element) {
      if (!code.contains(element['DID'])) {
        code.add(element['DID']);
      }
    });
    for (int i in code){
      brandDrugCompanyList.addAll(await filterBDACList(i));
    }
    // await code.forEach((element) async {
    // });
    filteredCompanies.addAll(brandDrugCompanyList);
    return filteredCompanies;
  }

  Future<List<AvailableForm>> getBrandModelDetail(int value) async {
    final db = await database;
    List<BrandListModel> brandList = [];
    List<AvailableForm> formList = [];
    // var res = await db.rawQuery("SELECT b.*, bd.* FROM BRAND as b inner join BRAND_DRUG as bd on b.BID = bd.BID WHERE b.BID = '$value';");
    var res =
    await db.rawQuery("SELECT * FROM BRAND_DRUG where BID = ?", [value]);
    var result = await db.rawQuery(
        "SELECT d.* FROM BRAND_DRUG as bd inner join DRUG as d ON d.CODE = bd.DID where BID = ?",
        [value]);
    List<IncludedDrug> drug = [];
    if (res.length != null) {
      for (var item in res) {
        brandList.add(BrandListModel.fromJson(item));
      }
      for (var item in result) {
        drug.add(IncludedDrug.fromJson(item));
      }
      List<Packing> packings = [];
      String formName = brandList[0].form;
      for (int i = 0; i < brandList.length; i++) {
        Packing packingObj = new Packing();
        BrandListModel brand = brandList[i];
        if (formName == brandList[i].form) {
          Packing packing = addPackingValue(
            packingObj,
            drug[i].name ?? "",
            brand,
          );
          packings.add(packing);
        } else {
          List<Packing> newPacking = List.unmodifiable(packings);
          AvailableForm newForm =
          new AvailableForm(name: formName, packings: newPacking);
          formList.add(newForm);
          packings.clear();
          Packing packing = addPackingValue(
            packingObj,
            drug[i].name ?? "",
            brand,
          );
          packings.add(packing);
          formName = brand.form;
        }
      }
      AvailableForm form =
      new AvailableForm(name: formName, packings: packings);
      formList.add(form);
    }
    return formList;
  }

  Packing addPackingValue(
      Packing packing,
      String includedDrug,
      BrandListModel brandListModel,
      ) {
    packing.name = brandListModel.name;
    packing.price = brandListModel.retailprice;
    packing.category = brandListModel.category;
    packing.mg = "Packing : " + brandListModel.packing;
    packing.includedDrugString =
        includedDrug + ": " + brandListModel.mg + ",";
    return packing;
  }

  Future<IncludedDrug> filterDrugDetail(int value) async {
    final db = await database;
    IncludedDrug filteredCompanies = IncludedDrug();
    var res = await db.rawQuery(
      "SELECT * FROM ${DBConstants.DRUG_TABLE} WHERE CODE = '$value';",
    );

    if (res.length != null) {
      for (var item in res) {
        filteredCompanies = IncludedDrug.fromJson(item);
      }
    }
    return filteredCompanies;
  }

  Future<List<IncludedDrug>> getDrugDetail(String name) async {
    final db = await database;
    List<IncludedDrug> drugList = [];
    List drugDetails = await db.rawQuery(
        "SELECT d.* FROM DRUG as d INNER JOIN BRAND_DRUG as bd on bd.DID = d.CODE WHERE bd.NAME = '$name'");

    if (drugDetails.length > 0) {
      int code;
      for (var item in drugDetails) {
        IncludedDrug drug = IncludedDrug.fromJson(item);
        if (code != drug.code) {
          drugList.add(drug);
          code = drug.code;
          print(code);
        }
      }
    }
    return drugList;
  }

  Future<DosageModel> getDosage(int value) async {
    final db = await database;
    List<Adult> adultList = [];
    List<Adult> paedriaticList = [];
    List<Adult> neonatalList = [];
    DosageModel dosage;

    var adult = await db.rawQuery(
      "SELECT * FROM adult WHERE CODE = '$value';",
    );

    var paedriatic = await db.rawQuery(
      "SELECT * FROM Paedriatic WHERE CODE = '$value';",
    );

    var neonatal = await db.rawQuery(
      "SELECT * FROM Neonatal WHERE CODE = '$value';",
    );

    if (paedriatic.length > 0) {
      for (var item in paedriatic) {
        paedriaticList.add(Adult.fromJson(item));
      }
    }

    if (neonatal.length > 0) {
      for (var item in neonatal) {
        neonatalList.add(Adult.fromJson(item));
      }
    }

    if (adult.length > 0) {
      for (var item in adult) {
        adultList.add(Adult.fromJson(item));
      }

      dosage = new DosageModel(
          adult: adultList, paedriatic: paedriaticList, neonatal: neonatalList);
    }
    return dosage;
  }

  Future<List<BDACList>> filterBDACList(int value) async {
    final db = await database;
    List<BDACList> filteredCompanies = [];
    var res = await db.rawQuery(
      "select b.BID, b.BNAME, c.ID, c.NAME, bd.FORM, bd.DID from DRUG as s " +
          "inner join BRAND_DRUG as bd on s.CODE = bd.DID " +
          "inner join BRAND as b on b.BID = bd.BID " +
          "inner join COMPANY as c on c.ID = b.CID " +
          "where s.CODE = '$value';",
    );

    if (res.length != null) {
      for (var item in res) {
        filteredCompanies.add(BDACList.fromJson(item));
      }
    }
    return filteredCompanies;
  }*/
}
