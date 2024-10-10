import '../../app/server/database/db_constant.dart';

import 'dart:convert';

class TransactionDtModel {
    final int tenentId;
    final int locationId;
    final int mytransid;
    final int myid;
    final int employeeId;
    final int installmentNumber;
    final int attachId;
    final int periodCode;
    final double installmentAmount;
    final double receivedAmount;
    final double pendingAmount;
    final double discountAmount;
    final String discountReference;
    final String universityBatchNo;
    final dynamic receivedDate;
    final dynamic effectedAccount;
    final dynamic otherReference;
    final int activityid;
    final dynamic crupId;
    final dynamic glpost;
    final dynamic glpost1;
    final dynamic glpostref1;
    final dynamic glpostref;
    final bool active;
    final dynamic switch1;
    final dynamic delFlag;
    final String userid;
    final DateTime entrydate;
    final dynamic jvNumber;

    TransactionDtModel({
        required this.tenentId,
        required this.locationId,
        required this.mytransid,
        required this.myid,
        required this.employeeId,
        required this.installmentNumber,
        required this.attachId,
        required this.periodCode,
        required this.installmentAmount,
        required this.receivedAmount,
        required this.pendingAmount,
        required this.discountAmount,
        required this.discountReference,
        required this.universityBatchNo,
        required this.receivedDate,
        required this.effectedAccount,
        required this.otherReference,
        required this.activityid,
        required this.crupId,
        required this.glpost,
        required this.glpost1,
        required this.glpostref1,
        required this.glpostref,
        required this.active,
        required this.switch1,
        required this.delFlag,
        required this.userid,
        required this.entrydate,
        required this.jvNumber,
    });

    factory TransactionDtModel.fromJson(String str) => TransactionDtModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TransactionDtModel.fromMap(Map<String, dynamic> json) => TransactionDtModel(
        tenentId: json["tenentId"],
        locationId: json["locationId"],
        mytransid: json["mytransid"],
        myid: json["myid"],
        employeeId: json["employeeId"],
        installmentNumber: json["installmentNumber"],
        attachId: json["attachId"],
        periodCode: json["periodCode"],
        installmentAmount: json["installmentAmount"]?.toDouble()??0.0,
        receivedAmount: json["receivedAmount"]?.toDouble()??0.0,
        pendingAmount: json["pendingAmount"]?.toDouble()??0.0,
        discountAmount: json["discountAmount"]?.toDouble()??0.0,
        discountReference: json["discountReference"],
        universityBatchNo: json["universityBatchNo"],
        receivedDate: json["receivedDate"],
        effectedAccount: json["effectedAccount"],
        otherReference: json["otherReference"],
        activityid: json["activityid"],
        crupId: json["crupId"],
        glpost: json["glpost"],
        glpost1: json["glpost1"],
        glpostref1: json["glpostref1"],
        glpostref: json["glpostref"],
        active: json["active"],
        switch1: json["switch1"],
        delFlag: json["delFlag"],
        userid: json["userid"],
        entrydate: DateTime.parse(json["entrydate"]),
        jvNumber: json["jvNumber"],
    );
    Map<String, dynamic> toMap() => {
    Constants.tenentID: tenentId,
    'locationID': locationId,
    Constants.myTransID: mytransid,
    Constants.myID: myid,
    Constants.employeeID: employeeId,
    Constants.installmentNumber: installmentNumber,
    Constants.attachID: attachId,
    Constants.periodCode: periodCode,
    Constants.installmentAmount: installmentAmount,
    Constants.receivedAmount: receivedAmount,
    Constants.pendingAmount: pendingAmount,
    Constants.discountAmount: discountAmount,
    Constants.discountReference: discountReference,
    Constants.universityBatchNo: universityBatchNo,
    Constants.receivedDate: receivedDate,
    'EffectedAccount': effectedAccount,
    Constants.otherReference: otherReference,
    Constants.activityID: activityid,
    Constants.crupID: crupId,
    Constants.glPost: glpost,
    Constants.glPost1: glpost1,
    Constants.glPostRef1: glpostref1,
    Constants.glPostRef: glpostref,
    Constants.active: active,
    Constants.switch1: switch1,
    Constants.delFlag: delFlag,
    "ENTRYDATE":entrydate.toIso8601String(),
    "JVNumber":jvNumber,
    'USERID':userid

  };

}


 
