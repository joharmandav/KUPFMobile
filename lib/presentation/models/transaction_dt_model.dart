import '../../app/server/database/db_constant.dart';

class TransactionDTModel {
  final int tenentID;
  final int locationID;
  final int myTransID;
  final int myID;
  final int? employeeID;
  final int installmentNumber;
  final int? attachID;
  final int? periodCode;
  final int installmentAmount;
  final int receivedAmount;
  final int? pendingAmount;
  final int? discountAmount;
  final String? discountReference;
  final String? universityBatchNo;
  final String? receivedDate;
  final String? effectedAccount;
  final String? otherReference;
  final int activityID;
  final int? crupID;
  final String glPost;
  final String glPost1;
  final String glPostRef1;
  final String? glPostRef;
  final int? active;
  final String? switch1;
  final int? delFlag;

  TransactionDTModel({
    required this.tenentID,
    required this.locationID,
    required this.myTransID,
    required this.myID,
    this.employeeID,
    required this.installmentNumber,
    this.attachID,
    this.periodCode,
    required this.installmentAmount,
    required this.receivedAmount,
    this.pendingAmount,
    this.discountAmount,
    this.discountReference,
    this.universityBatchNo,
    this.receivedDate,
    this.effectedAccount,
    this.otherReference,
    required this.activityID,
    this.crupID,
    required this.glPost,
    required this.glPost1,
    required this.glPostRef1,
    this.glPostRef,
    this.active,
    this.switch1,
    this.delFlag,
  });

  factory TransactionDTModel.fromMap(Map<String, dynamic> map) =>
      TransactionDTModel(
        tenentID: map[Constants.tenentID],
        locationID: map[Constants.locationID],
        myTransID: map[Constants.myTransID],
        myID: map[Constants.myID],
        employeeID: map[Constants.employeeID],
        installmentNumber: map[Constants.installmentNumber],
        attachID: map[Constants.attachID],
        periodCode: map[Constants.periodCode],
        installmentAmount: map[Constants.installmentAmount],
        receivedAmount: map[Constants.receivedAmount],
        pendingAmount: map[Constants.pendingAmount],
        discountAmount: map[Constants.discountAmount],
        discountReference: map[Constants.discountReference],
        universityBatchNo: map[Constants.universityBatchNo],
        receivedDate: map[Constants.receivedDate],
        effectedAccount: map[Constants.effectedAmount],
        otherReference: map[Constants.otherReference],
        activityID: map[Constants.activityID],
        crupID: map[Constants.crupID],
        glPost: map[Constants.glPost],
        glPost1: map[Constants.glPost1],
        glPostRef1: map[Constants.glPostRef1],
        glPostRef: map[Constants.glPostRef],
        active: map[Constants.active],
        switch1: map[Constants.switch1],
        delFlag: map[Constants.delFlag],
      );

  Map<String, dynamic> toMap() => {
    Constants.tenentID: tenentID,
    Constants.locationID: locationID,
    Constants.myTransID: myTransID,
    Constants.myID: myID,
    Constants.employeeID: employeeID,
    Constants.installmentNumber: installmentNumber,
    Constants.attachID: attachID,
    Constants.periodCode: periodCode,
    Constants.installmentAmount: installmentAmount,
    Constants.receivedAmount: receivedAmount,
    Constants.pendingAmount: pendingAmount,
    Constants.discountAmount: discountAmount,
    Constants.discountReference: discountReference,
    Constants.universityBatchNo: universityBatchNo,
    Constants.receivedDate: receivedDate,
    Constants.effectedAmount: effectedAccount,
    Constants.otherReference: otherReference,
    Constants.activityID: activityID,
    Constants.crupID: crupID,
    Constants.glPost: glPost,
    Constants.glPost1: glPost1,
    Constants.glPostRef1: glPostRef1,
    Constants.glPostRef: glPostRef,
    Constants.active: active,
    Constants.switch1: switch1,
    Constants.delFlag: delFlag,
  };
}
