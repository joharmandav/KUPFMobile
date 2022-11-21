import '../../app/server/database/db_constant.dart';

class CRUPAuditModel {
  final int tenantID;
  final int locationID;
  final int crupID;
  final int mySerial;
  final int auditNo;
  final String auditType;
  final String tableName;
  final String fieldName;
  final String oldValue;
  final String newValue;
  final String updateDate;
  final String updateUserName;
  final String createdDate;
  final String createdUserName;

  CRUPAuditModel({
    required this.tenantID,
    required this.locationID,
    required this.crupID,
    required this.mySerial,
    required this.auditNo,
    required this.auditType,
    required this.tableName,
    required this.fieldName,
    required this.oldValue,
    required this.newValue,
    required this.updateDate,
    required this.updateUserName,
    required this.createdDate,
    required this.createdUserName,
  });

  factory CRUPAuditModel.fromMap(Map<String, dynamic> map) => CRUPAuditModel(
        tenantID: map[Constants.tenantID],
        locationID: map[Constants.auditLocationID],
        crupID: map[Constants.crupID],
        mySerial: map[Constants.mySerial],
        auditNo: map[Constants.auditNo],
        auditType: map[Constants.auditType],
        tableName: map[Constants.tableName],
        fieldName: map[Constants.fieldName],
        oldValue: map[Constants.oldValue],
        newValue: map[Constants.newValue],
        updateDate: map[Constants.updateDate],
        updateUserName: map[Constants.updateUserName],
        createdDate: map[Constants.createdDate],
        createdUserName: map[Constants.createdUserName],
      );

  Map<String, dynamic> toMap() => {
    Constants.tenantID: tenantID,
    Constants.auditLocationID: locationID,
    Constants.crupID: crupID,
    Constants.mySerial: mySerial,
    Constants.auditNo: auditNo,
    Constants.auditType: auditType,
    Constants.tableName: tableName,
    Constants.fieldName: fieldName,
    Constants.oldValue: oldValue,
    Constants.newValue: newValue,
    Constants.updateDate: updateDate,
    Constants.updateUserName: updateUserName,
    Constants.createdDate: createdDate,
    Constants.createdUserName: createdUserName,
  };
}
