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
  final bool active;
  final String? entryDate;
  final String? entryTime;
  final String? updateTime;
  final String?  approvalRemarks;
  final int? mySeq;
  final int? displayPeriodCode;
  final String? approvalBypassed;
  final String? approvalBypassedBy;
  final String? displayStatus;

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
    required this.active,
    this.entryDate,
    this.entryTime,
    this.updateTime,
    this.approvalBypassed,
    this.approvalRemarks,
    this.displayPeriodCode,
    this.displayStatus,
    this.mySeq,
    this.approvalBypassedBy,
  });

  factory TransactionHDDApprovalDetailsModel.fromMap(
          Map<String, dynamic> map) =>
      TransactionHDDApprovalDetailsModel(
        tenetID: map['tenentId'],
        myTransID: map['mytransid'],
        locationID: map['locationId'],
        serApprovalID: map['serApprovalId'],
        serApproval: map['serApproval'],
        employeeID: map['employeeId'],
        serviceID: map['serviceType'],
        masterServiceID: map['masterServiceId'],
        approvalDate: map['approvalDate'],
        rejectionType: map['rejectionType'],
        rejectionRemarks: map['rejectionRemarks'],
        attachID: map['attachId'],
        status: map['status'],
        crupID: map['crupId'],
        userID: map['userid'],
        active: map['active'],
        entryDate: map['entrydate'],
        entryTime: map['entrytime'],
        updateTime: map['updttime'],
        approvalRemarks: map['approvalRemarks'],
        mySeq: map['mySeq'],
        displayPeriodCode: map['displayPERIOD_CODE'],
        approvalBypassed: map['approvalBypassed'],
        displayStatus: map['displayStatus'],
        approvalBypassedBy: map['approvalBypassedBy'],
      );

  Map<String, dynamic> toMap() => {
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
    'USERID': userID,
    Constants.active: active,
    Constants.entryDate: entryDate,
    Constants.entryTime: entryTime,
    Constants.updateTime: updateTime,
    'ApprovalRemarks':approvalRemarks,
    'mySeq':mySeq,
    'DisplayPERIOD_CODE':displayPeriodCode,
    'ApprovalBypassed':approvalBypassed,
    'DisplayStatus':displayStatus,
    'ApprovalBypassedBy':approvalBypassedBy

  };
}
