import 'dart:convert';

class TransactionDtSubMonthlyModel {
    final int tenentId;
    final int locationId;
    final int mytransid;
    final int myid;
    final int employeeId;
    final int installmentNumber;
    final int periodCode;
    final double installmentAmount;
    final int receivedAmount;
    final double pendingAmount;
    final int discountAmount;
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
    final dynamic totRecAmount;
    final int seqId;
    final dynamic jvNumber;

    TransactionDtSubMonthlyModel({
        required this.tenentId,
        required this.locationId,
        required this.mytransid,
        required this.myid,
        required this.employeeId,
        required this.installmentNumber,
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
        required this.totRecAmount,
        required this.seqId,
        required this.jvNumber,
    });

    factory TransactionDtSubMonthlyModel.fromJson(String str) => TransactionDtSubMonthlyModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TransactionDtSubMonthlyModel.fromMap(Map<String, dynamic> json) => TransactionDtSubMonthlyModel(
        tenentId: json["tenentId"],
        locationId: json["locationId"],
        mytransid: json["mytransid"],
        myid: json["myid"],
        employeeId: json["employeeId"],
        installmentNumber: json["installmentNumber"],
        periodCode: json["periodCode"],
        installmentAmount: json["installmentAmount"]?.toDouble(),
        receivedAmount: json["receivedAmount"],
        pendingAmount: json["pendingAmount"]?.toDouble(),
        discountAmount: json["discountAmount"],
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
        totRecAmount: json["totRecAmount"],
        seqId: json["seqId"],
        jvNumber: json["jvNumber"],
    );

    Map<String, dynamic> toMap() => {
        "tenentId": tenentId,
        "locationId": locationId,
        "mytransid": mytransid,
        "myid": myid,
        "employeeId": employeeId,
        "installmentNumber": installmentNumber,
        "periodCode": periodCode,
        "installmentAmount": installmentAmount,
        "receivedAmount": receivedAmount,
        "pendingAmount": pendingAmount,
        "discountAmount": discountAmount,
        "discountReference": discountReference,
        "universityBatchNo": universityBatchNo,
        "receivedDate": receivedDate,
        "effectedAccount": effectedAccount,
        "otherReference": otherReference,
        "activityid": activityid,
        "crupId": crupId,
        "glpost": glpost,
        "glpost1": glpost1,
        "glpostref1": glpostref1,
        "glpostref": glpostref,
        "active": active,
        "switch1": switch1,
        "delFlag": delFlag,
        "userid": userid,
        "entrydate": entrydate.toIso8601String(),
        "totRecAmount": totRecAmount,
        "seqId": seqId,
        "jvNumber": jvNumber,
    };
}
