import '../../app/server/database/db_constant.dart';

class TransactionHDModel {
  final int tenentID;
  final int myTransID;
  final int locationID;
  final int? employeeID;
  final int? sponserProvidentID;
  final int? serviceID;
  final int? masterServiceID;
  final String? serviceType;
  final String? serviceSubType;
  final String? source;
  final int? attachID;
  final String? userdefinedNumber;
  final String? transDocNo;
  final int? bankID;
  final String? voucherNumber;
  final String? voucherDate;
  final int? accountantID;
  final String? benefeciaryName;
  final String? chequeNumber;
  final String? chequeDate;
  final String? chequeAmount;
  final String? collectedDate;
  final String? collectedBy;
  final String? relationShip;
  final String? collectedPersonCID;
  final String installmentsBegDate;
  final int? periodBegin;
  final String eachInstallmentsAmt;
  final String totInstallments;
  final String? discount;
  final String discountedGiftAmount;
  final String totalAmount;
  final String amountPaid;
  final String? loanAct;
  final String? hajjAct;
  final String? persLoanAct;
  final String? consumerLoanAct;
  final String? otherAct1;
  final String? otherAct2;
  final String? otherAct3;
  final String? otherAct4;
  final String? otherAct5;
  final String? serApproval1;
  final String? serApproval2;
  final String? serApproval3;
  final String? serApproval4;
  final String? serApproval5;
  final String? approvalBy1;
  final String? approvalBy2;
  final String? approvalBy3;
  final String? approvalBy4;
  final String? approvalBy5;
  final String? approvedDate1;
  final String? approvedDate2;
  final String? approvedDate3;
  final String? approvedDate4;
  final String? approvedDate5;
  final String? activityCode;
  final String myDocNo;
  final String? userBatchNo;
  final String prjectNo;
  final String transDate;
  final String reference;
  final String notes;
  final String glPostRef;
  final String glPostRef1;
  final int? companyID;
  final int? terms;
  final int? refTransID;
  final String? signatures;
  final String? extraSwitch1;
  final String? extraSwitch2;
  final String? status;
  final int? crupID;
  final String? userID;
  final String? active;
  final String? entryDate;
  final String? entryTime;
  final String? updateTime;

  TransactionHDModel({
    required this.tenentID,
    required this.myTransID,
    required this.locationID,
    this.employeeID,
    this.sponserProvidentID,
    this.serviceID,
    this.masterServiceID,
    this.serviceType,
    this.serviceSubType,
    this.source,
    this.attachID,
    this.userdefinedNumber,
    this.transDocNo,
    this.bankID,
    this.voucherNumber,
    this.voucherDate,
    this.accountantID,
    this.benefeciaryName,
    this.chequeNumber,
    this.chequeDate,
    this.chequeAmount,
    this.collectedDate,
    this.collectedBy,
    this.relationShip,
    this.collectedPersonCID,
    required this.installmentsBegDate,
    this.periodBegin,
    required this.eachInstallmentsAmt,
    required this.totInstallments,
    this.discount,
    required this.discountedGiftAmount,
    required this.totalAmount,
    required this.amountPaid,
    this.loanAct,
    this.hajjAct,
    this.persLoanAct,
    this.consumerLoanAct,
    this.otherAct1,
    this.otherAct2,
    this.otherAct3,
    this.otherAct4,
    this.otherAct5,
    this.serApproval1,
    this.serApproval2,
    this.serApproval3,
    this.serApproval4,
    this.serApproval5,
    this.approvalBy1,
    this.approvalBy2,
    this.approvalBy3,
    this.approvalBy4,
    this.approvalBy5,
    this.approvedDate1,
    this.approvedDate2,
    this.approvedDate3,
    this.approvedDate4,
    this.approvedDate5,
    this.activityCode,
    required this.myDocNo,
    this.userBatchNo,
    required this.prjectNo,
    required this.transDate,
    required this.reference,
    required this.notes,
    required this.glPostRef,
    required this.glPostRef1,
    this.companyID,
    this.terms,
    this.refTransID,
    this.signatures,
    this.extraSwitch1,
    this.extraSwitch2,
    this.status,
    this.crupID,
    this.userID,
    this.active,
    this.entryDate,
    this.entryTime,
    this.updateTime,
  });

  factory TransactionHDModel.fromMap(Map<String, dynamic> map) =>
      TransactionHDModel(
        tenentID: map[Constants.tenentID],
        myTransID: map[Constants.myTransID],
        locationID: map[Constants.thLocationID],
        employeeID: map[Constants.employeeID],
        sponserProvidentID: map[Constants.sponserProvidentID],
        serviceID: map[Constants.serviceID],
        masterServiceID: map[Constants.masterServiceID],
        serviceType: map[Constants.serviceType],
        serviceSubType: map[Constants.serviceSubType],
        source: map[Constants.source],
        attachID: map[Constants.attachID],
        userdefinedNumber: map[Constants.userDefinedNumber],
        transDocNo: map[Constants.transDocNo],
        bankID: map[Constants.bankID],
        voucherNumber: map[Constants.voucherNumber],
        voucherDate: map[Constants.voucherDate],
        accountantID: map[Constants.accountantID],
        benefeciaryName: map[Constants.benefeciaryName],
        chequeNumber: map[Constants.chequeNumber],
        chequeDate: map[Constants.chequeDate],
        chequeAmount: map[Constants.chequeAmount],
        collectedDate: map[Constants.collectedDate],
        collectedBy: map[Constants.collectedBy],
        relationShip: map[Constants.relationShip],
        collectedPersonCID: map[Constants.collectedPersonCID],
        installmentsBegDate: map[Constants.installmentsBegDate],
        periodBegin: map[Constants.periodBegin],
        eachInstallmentsAmt: map[Constants.eachInstallmentsAmt],
        totInstallments: map[Constants.totInstallments],
        discount: map[Constants.discount],
        discountedGiftAmount: map[Constants.discountedGiftAmount],
        totalAmount: map[Constants.totalAmount],
        amountPaid: map[Constants.amountPaid],
        loanAct: map[Constants.loanAct],
        hajjAct: map[Constants.hajjAct],
        persLoanAct: map[Constants.persLoanAct],
        consumerLoanAct: map[Constants.consumerLoanAct],
        otherAct1: map[Constants.otherAct1],
        otherAct2: map[Constants.otherAct2],
        otherAct3: map[Constants.otherAct3],
        otherAct4: map[Constants.otherAct4],
        otherAct5: map[Constants.otherAct5],
        serApproval1: map[Constants.serApproval1],
        serApproval2: map[Constants.serApproval2],
        serApproval3: map[Constants.serApproval3],
        serApproval4: map[Constants.serApproval4],
        serApproval5: map[Constants.serApproval5],
        approvalBy1: map[Constants.approvalBy1],
        approvalBy2: map[Constants.approvalBy2],
        approvalBy3: map[Constants.approvalBy3],
        approvalBy4: map[Constants.approvalBy4],
        approvalBy5: map[Constants.approvalBy5],
        approvedDate1: map[Constants.approvedDate1],
        approvedDate2: map[Constants.approvedDate2],
        approvedDate3: map[Constants.approvedDate3],
        approvedDate4: map[Constants.approvedDate4],
        approvedDate5: map[Constants.approvedDate5],
        activityCode: map[Constants.activityCode],
        myDocNo: map[Constants.myDocNo],
        userBatchNo: map[Constants.userBatchNo],
        prjectNo: map[Constants.projectNo],
        transDate: map[Constants.transDate],
        reference: map[Constants.reference],
        notes: map[Constants.notes],
        glPostRef: map[Constants.glPostRef],
        glPostRef1: map[Constants.glPostRef1],
        companyID: map[Constants.companyID],
        terms: map[Constants.terms],
        refTransID: map[Constants.refTransID],
        signatures: map[Constants.signatures],
        extraSwitch1: map[Constants.extraSwitch1],
        extraSwitch2: map[Constants.extraSwitch2],
        status: map[Constants.status],
        crupID: map[Constants.crupID],
        userID: map[Constants.userID],
        active: map[Constants.active],
        entryDate: map[Constants.entryDate],
        entryTime: map[Constants.entryTime],
        updateTime: map[Constants.updateTime],
      );

  Map<String, dynamic> toMap() => {
    Constants.tenentID: tenentID,
    Constants.myTransID: myTransID,
    Constants.thLocationID: locationID,
    Constants.employeeID: employeeID,
    Constants.sponserProvidentID: sponserProvidentID,
    Constants.serviceID: serviceID,
    Constants.masterServiceID: masterServiceID,
    Constants.serviceType: serviceType,
    Constants.serviceSubType: serviceSubType,
    Constants.source: source,
    Constants.attachID: attachID,
    Constants.userDefinedNumber: userdefinedNumber,
    Constants.transDocNo: transDocNo,
    Constants.bankID: bankID,
    Constants.voucherNumber: voucherNumber,
    Constants.voucherDate: voucherDate,
    Constants.accountantID: accountantID,
    Constants.benefeciaryName: benefeciaryName,
    Constants.chequeNumber: chequeNumber,
    Constants.chequeDate: chequeDate,
    Constants.chequeAmount: chequeAmount,
    Constants.collectedDate: collectedDate,
    Constants.collectedBy: collectedBy,
    Constants.relationShip: relationShip,
    Constants.collectedPersonCID: collectedPersonCID,
    Constants.installmentsBegDate: installmentsBegDate,
    Constants.periodBegin: periodBegin,
    Constants.eachInstallmentsAmt: eachInstallmentsAmt,
    Constants.totInstallments: totInstallments,
    Constants.discount: discount,
    Constants.discountedGiftAmount: discountedGiftAmount,
    Constants.totalAmount: totalAmount,
    Constants.amountPaid: amountPaid,
    Constants.loanAct: loanAct,
    Constants.hajjAct: hajjAct,
    Constants.persLoanAct: persLoanAct,
    Constants.consumerLoanAct: consumerLoanAct,
    Constants.otherAct1: otherAct1,
    Constants.otherAct2: otherAct2,
    Constants.otherAct3: otherAct3,
    Constants.otherAct4: otherAct4,
    Constants.otherAct5: otherAct5,
    Constants.serApproval1: serApproval1,
    Constants.serApproval2: serApproval2,
    Constants.serApproval3: serApproval3,
    Constants.serApproval4: serApproval4,
    Constants.serApproval5: serApproval5,
    Constants.approvalBy1: approvalBy1,
    Constants.approvalBy2: approvalBy2,
    Constants.approvalBy3: approvalBy3,
    Constants.approvalBy4: approvalBy4,
    Constants.approvalBy5: approvalBy5,
    Constants.approvedDate1: approvedDate1,
    Constants.approvedDate2: approvedDate2,
    Constants.approvedDate3: approvedDate3,
    Constants.approvedDate4: approvedDate4,
    Constants.approvedDate5: approvedDate5,
    Constants.activityCode: activityCode,
    Constants.myDocNo: myDocNo,
    Constants.userBatchNo: userBatchNo,
    Constants.projectNo: prjectNo,
    Constants.transDate: transDate,
    Constants.reference: reference,
    Constants.notes: notes,
    Constants.glPostRef: glPostRef,
    Constants.glPostRef1: glPostRef1,
    Constants.companyID: companyID,
    Constants.terms: terms,
    Constants.refTransID: refTransID,
    Constants.signatures: signatures,
    Constants.extraSwitch1: extraSwitch1,
    Constants.extraSwitch2: extraSwitch2,
    Constants.status: status,
    Constants.crupID: crupID,
    Constants.userID: userID,
    Constants.active: active,
    Constants.entryDate: entryDate,
    Constants.entryTime: entryTime,
    Constants.updateTime: updateTime,
  };
}
