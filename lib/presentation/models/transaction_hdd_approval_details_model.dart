import '../../app/server/database/db_constant.dart';

class TransactionHDDApprovalDetailsModel {
  final int tenetID;
  final int myTransID;
  final int locationID;
  final int serApprovalID;
  final String? serApproval;
  final int? employeeID;
  final int? serviceID;
  final int? masterServiceID;
  final String? approvalDate;
  final String? rejectionType;
  final String? rejectionRemarks;
  final int? attachID;
  final String? status;
  final int? crupID;
  final String? userID;
  final String? active;
  final String? entryDate;
  final String? entryTime;
  final String? updateTime;

  TransactionHDDApprovalDetailsModel({
    required this.tenetID,
    required this.myTransID,
    required this.locationID,
    required this.serApprovalID,
    this.serApproval,
    this.employeeID,
    this.serviceID,
    this.masterServiceID,
    this.approvalDate,
    this.rejectionType,
    this.rejectionRemarks,
    this.attachID,
    this.status,
    this.crupID,
    this.userID,
    this.active,
    this.entryDate,
    this.entryTime,
    this.updateTime,
  });

  factory TransactionHDDApprovalDetailsModel.fromMap(
          Map<String, dynamic> map) =>
      TransactionHDDApprovalDetailsModel(
        tenetID: map[Constants.tenentID],
        myTransID: map[Constants.myTransID],
        locationID: map[Constants.thLocationID],
        serApprovalID: map[Constants.serApprovalID],
        serApproval: map[Constants.serApproval],
        employeeID: map[Constants.employeeID],
        serviceID: map[Constants.serviceID],
        masterServiceID: map[Constants.masterServiceID],
        approvalDate: map[Constants.approvalDate],
        rejectionType: map[Constants.rejectionType],
        rejectionRemarks: map[Constants.rejectionRemarks],
        attachID: map[Constants.attachID],
        status: map[Constants.status],
        crupID: map[Constants.crupID],
        userID: map[Constants.userID],
        active: map[Constants.active],
        entryDate: map[Constants.entryDate],
        entryTime: map[Constants.entryTime],
        updateTime: map[Constants.updateTime],
      );

  Map<String, dynamic> toMAp() => {
    Constants.tenentID: tenetID,
    Constants.myTransID: myTransID,
    Constants.thLocationID:locationID,
    Constants.serApprovalID: serApprovalID,
    Constants.serApproval: serApproval,
    Constants.employeeID: employeeID,
    Constants.serviceID: serviceID,
    Constants.masterServiceID: masterServiceID,
    Constants.approvalDate: approvalDate,
    Constants.rejectionType: rejectionType,
    Constants.rejectionRemarks: rejectionRemarks,
    Constants.attachID: attachID,
    Constants.status: status,
    Constants.crupID: crupID,
    Constants.userID: userID,
    Constants.active: active,
    Constants.entryDate: entryDate,
    Constants.entryTime: entryTime,
    Constants.updateTime: updateTime,
  };
}
