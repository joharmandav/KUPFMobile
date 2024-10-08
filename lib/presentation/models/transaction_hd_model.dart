
import 'dart:convert';

class TransactionHDModel {
    final int tenentId;
    final int mytransid;
    final int locationId;
    final int employeeId;
    final int sponserProvidentId;
    final int serviceId;
    final int masterServiceId;
    final int serviceTypeId;
    final int serviceSubTypeId;
    final String serviceType;
    final String serviceSubType;
    final String source;
    final int attachId;
    final dynamic transDocNo;
    final String userDefinedNumber;
    final dynamic bankId;
    final dynamic voucherNumber;
    final dynamic voucherDate;
    final dynamic accountantId;
    final dynamic benefeciaryName;
    final dynamic chequeNumber;
    final dynamic chequeDate;
    final dynamic chequeAmount;
    final dynamic collectedDate;
    final dynamic collectedBy;
    final dynamic relationship;
    final dynamic collectedPersonCid;
    final double? eachInstallmentsAmt;
    final dynamic totinstallments;
    final double? totamt;
    final double? amtPaid;
    final String loanAct;
    final String hajjAct;
    final String persLoanAct;
    final String consumerLoanAct;
    final dynamic otherAct1;
    final dynamic otherAct2;
    final dynamic otherAct3;
    final dynamic otherAct4;
    final dynamic otherAct5;
    final dynamic serApproval1;
    final dynamic approvalBy1;
    final dynamic approvedDate1;
    final dynamic serApproval2;
    final dynamic approvalBy2;
    final dynamic approvedDate2;
    final dynamic serApproval3;
    final dynamic approvalBy3;
    final dynamic approvedDate3;
    final dynamic serApproval4;
    final dynamic approvalBy4;
    final dynamic approvedDate4;
    final dynamic serApproval5;
    final dynamic approvalBy5;
    final dynamic approvedDate5;
    final String activitycode;
    final dynamic mydocno;
    final dynamic userbatchno;
    final dynamic projectno;
    final DateTime transdate;
    final dynamic reference;
    final dynamic notes;
    final dynamic glpostref;
    final dynamic glpostref1;
    final dynamic companyid;
    final dynamic discount;
    final double? discountedGiftAmount;
    final dynamic terms;
    final dynamic refTransId;
    final dynamic signatures;
    final dynamic extraSwitch1;
    final dynamic extraSwitch2;
    final String status;
    final int crupId;
    final String userid;
    final bool active;
    final DateTime entrydate;
    final DateTime entrytime;
    final DateTime updttime;
    final double? installmentAmount;
    final DateTime installmentsBegDate;
    final dynamic untilMonth;
    final double? downPayment;
    final dynamic entireLoanAmount;
    final dynamic financialAidPercentage;
    final dynamic pfFundRevenue;
    final dynamic pfFundRevenuePercentage;
    final dynamic adjustmentAmount;
    final dynamic adjustmentAmountRemarks;
    final dynamic financialAmount;
    final dynamic financialAmountRemarks;
    final dynamic noOfSponsor;
    final dynamic sponsorDueAmount;
    final String yearOfService;
    final dynamic noOfTransactions;
    final dynamic paidSubscriptionAmount;
    final dynamic subscriptionDueAmount;
    final dynamic loanAmountBalance;
    final dynamic financialAid;
    final dynamic totalAmount;
    final dynamic payPer1;
    final dynamic draftNumber1;
    final dynamic draftDate1;
    final dynamic draftAmount1;
    final dynamic bankAccount1;
    final dynamic deliveryDate1;
    final dynamic receivedBy1;
    final dynamic deliveredBy1;
    final dynamic payPer2;
    final dynamic draftNumber2;
    final dynamic draftDate2;
    final dynamic draftAmount2;
    final dynamic bankAccount2;
    final dynamic deliveryDate2;
    final dynamic receivedBy2;
    final dynamic deliveredBy2;
    final dynamic receivedDate1;
    final dynamic receivedDate2;
    final dynamic discountType;
    final int periodBegin;
    final dynamic periodEnd;
    final bool allowDiscountDefault;
    final dynamic serApproval6;
    final dynamic approvalBy6;
    final dynamic approvedDate6;
    final String pfid;
    final dynamic amountMinus;
    final dynamic amountPlus;
    final String remark;
    final dynamic isDraftCreated;
    final dynamic calculatedAmount;
    final dynamic sponsorBypassed;
    final dynamic sponsorBypassedBy;
    final dynamic draft1JvNumber;
    final dynamic draft1Relationship;
    final dynamic draft2JvNumber;
    final dynamic draft2Relationship;
    final dynamic systemRemarks;

    TransactionHDModel({
        required this.tenentId,
        required this.mytransid,
        required this.locationId,
        required this.employeeId,
        required this.sponserProvidentId,
        required this.serviceId,
        required this.masterServiceId,
        required this.serviceTypeId,
        required this.serviceSubTypeId,
        required this.serviceType,
        required this.serviceSubType,
        required this.source,
        required this.attachId,
        required this.transDocNo,
        required this.userDefinedNumber,
        required this.bankId,
        required this.voucherNumber,
        required this.voucherDate,
        required this.accountantId,
        required this.benefeciaryName,
        required this.chequeNumber,
        required this.chequeDate,
        required this.chequeAmount,
        required this.collectedDate,
        required this.collectedBy,
        required this.relationship,
        required this.collectedPersonCid,
        required this.eachInstallmentsAmt,
        required this.totinstallments,
        required this.totamt,
        required this.amtPaid,
        required this.loanAct,
        required this.hajjAct,
        required this.persLoanAct,
        required this.consumerLoanAct,
        required this.otherAct1,
        required this.otherAct2,
        required this.otherAct3,
        required this.otherAct4,
        required this.otherAct5,
        required this.serApproval1,
        required this.approvalBy1,
        required this.approvedDate1,
        required this.serApproval2,
        required this.approvalBy2,
        required this.approvedDate2,
        required this.serApproval3,
        required this.approvalBy3,
        required this.approvedDate3,
        required this.serApproval4,
        required this.approvalBy4,
        required this.approvedDate4,
        required this.serApproval5,
        required this.approvalBy5,
        required this.approvedDate5,
        required this.activitycode,
        required this.mydocno,
        required this.userbatchno,
        required this.projectno,
        required this.transdate,
        required this.reference,
        required this.notes,
        required this.glpostref,
        required this.glpostref1,
        required this.companyid,
        required this.discount,
        required this.discountedGiftAmount,
        required this.terms,
        required this.refTransId,
        required this.signatures,
        required this.extraSwitch1,
        required this.extraSwitch2,
        required this.status,
        required this.crupId,
        required this.userid,
        required this.active,
        required this.entrydate,
        required this.entrytime,
        required this.updttime,
        required this.installmentAmount,
        required this.installmentsBegDate,
        required this.untilMonth,
        required this.downPayment,
        required this.entireLoanAmount,
        required this.financialAidPercentage,
        required this.pfFundRevenue,
        required this.pfFundRevenuePercentage,
        required this.adjustmentAmount,
        required this.adjustmentAmountRemarks,
        required this.financialAmount,
        required this.financialAmountRemarks,
        required this.noOfSponsor,
        required this.sponsorDueAmount,
        required this.yearOfService,
        required this.noOfTransactions,
        required this.paidSubscriptionAmount,
        required this.subscriptionDueAmount,
        required this.loanAmountBalance,
        required this.financialAid,
        required this.totalAmount,
        required this.payPer1,
        required this.draftNumber1,
        required this.draftDate1,
        required this.draftAmount1,
        required this.bankAccount1,
        required this.deliveryDate1,
        required this.receivedBy1,
        required this.deliveredBy1,
        required this.payPer2,
        required this.draftNumber2,
        required this.draftDate2,
        required this.draftAmount2,
        required this.bankAccount2,
        required this.deliveryDate2,
        required this.receivedBy2,
        required this.deliveredBy2,
        required this.receivedDate1,
        required this.receivedDate2,
        required this.discountType,
        required this.periodBegin,
        required this.periodEnd,
        required this.allowDiscountDefault,
        required this.serApproval6,
        required this.approvalBy6,
        required this.approvedDate6,
        required this.pfid,
        required this.amountMinus,
        required this.amountPlus,
        required this.remark,
        required this.isDraftCreated,
        required this.calculatedAmount,
        required this.sponsorBypassed,
        required this.sponsorBypassedBy,
        required this.draft1JvNumber,
        required this.draft1Relationship,
        required this.draft2JvNumber,
        required this.draft2Relationship,
        required this.systemRemarks,
    });

    factory TransactionHDModel.fromJson(String str) => TransactionHDModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TransactionHDModel.fromMap(Map<String, dynamic> json) => TransactionHDModel(
        tenentId: json["tenentId"],
        mytransid: json["mytransid"],
        locationId: json["locationId"],
        employeeId: json["employeeId"],
        sponserProvidentId: json["sponserProvidentID"],
        serviceId: json["serviceId"],
        masterServiceId: json["masterServiceId"],
        serviceTypeId: json["serviceTypeId"],
        serviceSubTypeId: json["serviceSubTypeId"],
        serviceType: json["serviceType"],
        serviceSubType: json["serviceSubType"],
        source: json["source"],
        attachId: json["attachId"],
        transDocNo: json["transDocNo"],
        userDefinedNumber: json["userDefinedNumber"],
        bankId: json["bankId"],
        voucherNumber: json["voucherNumber"],
        voucherDate: json["voucherDate"],
        accountantId: json["accountantID"],
        benefeciaryName: json["benefeciaryName"],
        chequeNumber: json["chequeNumber"],
        chequeDate: json["chequeDate"],
        chequeAmount: json["chequeAmount"],
        collectedDate: json["collectedDate"],
        collectedBy: json["collectedBy"],
        relationship: json["relationship"],
        collectedPersonCid: json["collectedPersonCID"],
        eachInstallmentsAmt: json["eachInstallmentsAmt"]?.toDouble(),
        totinstallments: json["totinstallments"],
        totamt: json["totamt"]?.toDouble(),
        amtPaid: json["amtPaid"]?.toDouble(),
        loanAct: json["loanAct"],
        hajjAct: json["hajjAct"],
        persLoanAct: json["persLoanAct"],
        consumerLoanAct: json["consumerLoanAct"],
        otherAct1: json["otherAct1"],
        otherAct2: json["otherAct2"],
        otherAct3: json["otherAct3"],
        otherAct4: json["otherAct4"],
        otherAct5: json["otherAct5"],
        serApproval1: json["serApproval1"],
        approvalBy1: json["approvalBy1"],
        approvedDate1: json["approvedDate1"],
        serApproval2: json["serApproval2"],
        approvalBy2: json["approvalBy2"],
        approvedDate2: json["approvedDate2"],
        serApproval3: json["serApproval3"],
        approvalBy3: json["approvalBy3"],
        approvedDate3: json["approvedDate3"],
        serApproval4: json["serApproval4"],
        approvalBy4: json["approvalBy4"],
        approvedDate4: json["approvedDate4"],
        serApproval5: json["serApproval5"],
        approvalBy5: json["approvalBy5"],
        approvedDate5: json["approvedDate5"],
        activitycode: json["activitycode"],
        mydocno: json["mydocno"],
        userbatchno: json["userbatchno"],
        projectno: json["projectno"],
        transdate: DateTime.parse(json["transdate"]),
        reference: json["reference"],
        notes: json["notes"],
        glpostref: json["glpostref"],
        glpostref1: json["glpostref1"],
        companyid: json["companyid"],
        discount: json["discount"],
        discountedGiftAmount: json["discountedGiftAmount"]?.toDouble(),
        terms: json["terms"],
        refTransId: json["refTransId"],
        signatures: json["signatures"],
        extraSwitch1: json["extraSwitch1"],
        extraSwitch2: json["extraSwitch2"],
        status: json["status"],
        crupId: json["crupId"],
        userid: json["userid"],
        active: json["active"],
        entrydate: DateTime.parse(json["entrydate"]),
        entrytime: DateTime.parse(json["entrytime"]),
        updttime: DateTime.parse(json["updttime"]),
        installmentAmount: json["installmentAmount"]?.toDouble(),
        installmentsBegDate: DateTime.parse(json["installmentsBegDate"]),
        untilMonth: json["untilMonth"],
        downPayment: json["downPayment"]?.toDouble(),
        entireLoanAmount: json["entireLoanAmount"],
        financialAidPercentage: json["financialAidPercentage"],
        pfFundRevenue: json["pfFundRevenue"],
        pfFundRevenuePercentage: json["pfFundRevenuePercentage"],
        adjustmentAmount: json["adjustmentAmount"],
        adjustmentAmountRemarks: json["adjustmentAmountRemarks"],
        financialAmount: json["financialAmount"],
        financialAmountRemarks: json["financialAmountRemarks"],
        noOfSponsor: json["noOfSponsor"],
        sponsorDueAmount: json["sponsorDueAmount"],
        yearOfService: json["yearOfService"],
        noOfTransactions: json["noOfTransactions"],
        paidSubscriptionAmount: json["paidSubscriptionAmount"],
        subscriptionDueAmount: json["subscriptionDueAmount"],
        loanAmountBalance: json["loanAmountBalance"],
        financialAid: json["financialAid"],
        totalAmount: json["totalAmount"],
        payPer1: json["payPer1"],
        draftNumber1: json["draftNumber1"],
        draftDate1: json["draftDate1"],
        draftAmount1: json["draftAmount1"],
        bankAccount1: json["bankAccount1"],
        deliveryDate1: json["deliveryDate1"],
        receivedBy1: json["receivedBy1"],
        deliveredBy1: json["deliveredBy1"],
        payPer2: json["payPer2"],
        draftNumber2: json["draftNumber2"],
        draftDate2: json["draftDate2"],
        draftAmount2: json["draftAmount2"],
        bankAccount2: json["bankAccount2"],
        deliveryDate2: json["deliveryDate2"],
        receivedBy2: json["receivedBy2"],
        deliveredBy2: json["deliveredBy2"],
        receivedDate1: json["receivedDate1"],
        receivedDate2: json["receivedDate2"],
        discountType: json["discountType"],
        periodBegin: json["periodBegin"],
        periodEnd: json["periodEnd"],
        allowDiscountDefault: json["allowDiscountDefault"],
        serApproval6: json["serApproval6"],
        approvalBy6: json["approvalBy6"],
        approvedDate6: json["approvedDate6"],
        pfid: json["pfid"],
        amountMinus: json["amountMinus"],
        amountPlus: json["amountPlus"],
        remark: json["remark"],
        isDraftCreated: json["isDraftCreated"],
        calculatedAmount: json["calculatedAmount"],
        sponsorBypassed: json["sponsorBypassed"],
        sponsorBypassedBy: json["sponsorBypassedBy"],
        draft1JvNumber: json["draft1JVNumber"],
        draft1Relationship: json["draft1Relationship"],
        draft2JvNumber: json["draft2JVNumber"],
        draft2Relationship: json["draft2Relationship"],
        systemRemarks: json["systemRemarks"],
    );

    Map<String, dynamic> toMap() => {
        "TenentID": tenentId,
        "MYTRANSID": mytransid,
        "locationID": locationId,
        "employeeID": employeeId,
        "SponserProvidentID": sponserProvidentId,
        "ServiceID": serviceId,
        "MasterServiceID": masterServiceId,
        "ServiceTypeId": serviceTypeId,
        "ServiceSubTypeId": serviceSubTypeId,
        "ServiceType": serviceType,
        "ServiceSubType": serviceSubType,
        "Source": source,
        "AttachID": attachId,
        "TransDocNo": transDocNo,
        "UserDefinedNumber": userDefinedNumber,
        "BankID": bankId,
        "VoucherNumber": voucherNumber,
        "VoucherDate": voucherDate,
        "AccountantID": accountantId,
        "BenefeciaryName": benefeciaryName,
        "ChequeNumber": chequeNumber,
        "ChequeDate": chequeDate,
        "ChequeAmount": chequeAmount,
        "CollectedDate": collectedDate,
        "CollectedBy": collectedBy,
        "Relationship": relationship,
        "CollectedPersonCID": collectedPersonCid,
        "EachInstallmentsAmt": eachInstallmentsAmt,
        "TOTInstallments": totinstallments,
        "TOTAMT": totamt,
        "AmtPaid": amtPaid,
        "LoanAct": loanAct,
        "HajjAct": hajjAct,
        "PersLoanAct": persLoanAct,
        "ConsumerLoanAct": consumerLoanAct,
        "OtherAct1": otherAct1,
        "OtherAct2": otherAct2,
        "OtherAct3": otherAct3,
        "OtherAct4": otherAct4,
        "OtherAct5": otherAct5,
        "SerApproval1": serApproval1,
        "ApprovalBy1": approvalBy1,
        "ApprovedDate1": approvedDate1,
        "SerApproval2": serApproval2,
        "ApprovalBy2": approvalBy2,
        "ApprovedDate2": approvedDate2,
        "SerApproval3": serApproval3,
        "ApprovalBy3": approvalBy3,
        "ApprovedDate3": approvedDate3,
        "SerApproval4": serApproval4,
        "ApprovalBy4": approvalBy4,
        "ApprovedDate4": approvedDate4,
        "SerApproval5": serApproval5,
        "ApprovalBy5": approvalBy5,
        "ApprovedDate5": approvedDate5,
        "ACTIVITYCODE": activitycode,
        "MYDOCNO": mydocno,
        "USERBATCHNO": userbatchno,
        "PROJECTNO": projectno,
        "TRANSDATE": transdate.toIso8601String(),
        "REFERENCE": reference,
        "NOTES": notes,
        "GLPOSTREF": glpostref,
        "GLPOSTREF1": glpostref1,
        "COMPANYID": companyid,
        "Discount": discount,
        "DiscountedGiftAmount": discountedGiftAmount,
        "Terms": terms,
        "RefTransID": refTransId,
        "signatures": signatures,
        "ExtraSwitch1": extraSwitch1,
        "ExtraSwitch2": extraSwitch2,
        "Status": status,
        "CRUP_ID": crupId,
        "USERID": userid,
        "ACTIVE": active,
        "ENTRYDATE": entrydate.toIso8601String(),
        "ENTRYTIME": entrytime.toIso8601String(),
        "UPDTTIME": updttime.toIso8601String(),
        "InstallmentAmount": installmentAmount,
        "InstallmentsBegDate": installmentsBegDate.toIso8601String(),
        "UntilMonth": untilMonth,
        "DownPayment": downPayment,
        "EntireLoanAmount": entireLoanAmount,
        "FinancialAidPercentage": financialAidPercentage,
        "PFFundRevenue": pfFundRevenue,
        "PFFundRevenuePercentage": pfFundRevenuePercentage,
        "AdjustmentAmount": adjustmentAmount,
        "AdjustmentAmountRemarks": adjustmentAmountRemarks,
        "FinancialAmount": financialAmount,
        "FinancialAmountRemarks": financialAmountRemarks,
        "NoOfSponsor": noOfSponsor,
        "SponsorDueAmount": sponsorDueAmount,
        "YearOfService": yearOfService,
        "NoOfTransactions": noOfTransactions,
        "PaidSubscriptionAmount": paidSubscriptionAmount,
        "SubscriptionDueAmount": subscriptionDueAmount,
        "LoanAmountBalance": loanAmountBalance,
        "FinancialAid": financialAid,
        "TotalAmount": totalAmount,
        "PayPer1": payPer1,
        "DraftNumber1": draftNumber1,
        "DraftDate1": draftDate1,
        "DraftAmount1": draftAmount1,
        "BankAccount1": bankAccount1,
        "DeliveryDate1": deliveryDate1,
        "ReceivedBy1": receivedBy1,
        "DeliveredBy1": deliveredBy1,
        "PayPer2": payPer2,
        "DraftNumber2": draftNumber2,
        "DraftDate2": draftDate2,
        "DraftAmount2": draftAmount2,
        "BankAccount2": bankAccount2,
        "DeliveryDate2": deliveryDate2,
        "ReceivedBy2": receivedBy2,
        "DeliveredBy2": deliveredBy2,
        "ReceivedDate1": receivedDate1,
        "ReceivedDate2": receivedDate2,
        "DiscountType": discountType,
        "PeriodBegin": periodBegin,
        "PeriodEnd": periodEnd,
        "AllowDiscountDefault": allowDiscountDefault,
        "SerApproval6": serApproval6,
        "ApprovalBy6": approvalBy6,
        "ApprovedDate6": approvedDate6,
        "PFID": pfid,
        "AmountMinus": amountMinus,
        "AmountPlus": amountPlus,
        "Remark": remark,
        "IsDraftCreated": isDraftCreated,
        "CalculatedAmount": calculatedAmount,
        "SponsorBypassed": sponsorBypassed,
        "SponsorBypassedBy": sponsorBypassedBy,
        "Draft1JVNumber": draft1JvNumber,
        "Draft1Relationship": draft1Relationship,
        "Draft2JVNumber": draft2JvNumber,
        "Draft2Relationship": draft2Relationship,
        "SystemRemarks": systemRemarks,
    };



  // Map<String, dynamic> toMap() => {
  //   Constants.tenentID: tenentId,
  //   Constants.myTransID: mytransid,
  //   Constants.thLocationID: locationId,
  //   Constants.employeeID: employeeId,
  //   Constants.sponserProvidentID: sponserProvidentId,
  //   Constants.serviceID: serviceId,
  //   Constants.masterServiceID: masterServiceId,
  //   Constants.serviceType: serviceType,
  //   Constants.serviceSubType: serviceSubType,
  //   Constants.source: source,
  //   Constants.attachID: attachId,
  //   Constants.userDefinedNumber: userDefinedNumber,
  //   Constants.transDocNo: transDocNo,
  //   Constants.bankID: bankId,
  //   Constants.voucherNumber: voucherNumber,
  //   Constants.voucherDate: voucherDate,
  //   Constants.accountantID: accountantId,
  //   Constants.benefeciaryName: benefeciaryName,
  //   Constants.chequeNumber: chequeNumber,
  //   Constants.chequeDate: chequeDate,
  //   Constants.chequeAmount: chequeAmount,
  //   Constants.collectedDate: collectedDate,
  //   Constants.collectedBy: collectedBy,
  //   Constants.relationShip: relationship,
  //   Constants.collectedPersonCID: collectedPersonCid,
  //   Constants.installmentsBegDate: installmentsBegDate.toIso8601String(),
  //   Constants.periodBegin: periodBegin,
  //   Constants.eachInstallmentsAmt: eachInstallmentsAmt,
  //   Constants.totInstallments: totinstallments,
  //   Constants.discount: discount,
  //   Constants.discountedGiftAmount: discountedGiftAmount,
  //   Constants.totalAmount: totalAmount,
  //   Constants.amountPaid: amtPaid,
  //   Constants.loanAct: loanAct,
  //   Constants.hajjAct: hajjAct,
  //   Constants.persLoanAct: persLoanAct,
  //   Constants.consumerLoanAct: consumerLoanAct,
  //   Constants.otherAct1: otherAct1,
  //   Constants.otherAct2: otherAct2,
  //   Constants.otherAct3: otherAct3,
  //   Constants.otherAct4: otherAct4,
  //   Constants.otherAct5: otherAct5,
  //   Constants.serApproval1: serApproval1,
  //   Constants.serApproval2: serApproval2,
  //   Constants.serApproval3: serApproval3,
  //   Constants.serApproval4: serApproval4,
  //   Constants.serApproval5: serApproval5,
  //   Constants.approvalBy1: approvalBy1,
  //   Constants.approvalBy2: approvalBy2,
  //   Constants.approvalBy3: approvalBy3,
  //   Constants.approvalBy4: approvalBy4,
  //   Constants.approvalBy5: approvalBy5,
  //   Constants.approvedDate1: approvedDate1,
  //   Constants.approvedDate2: approvedDate2,
  //   Constants.approvedDate3: approvedDate3,
  //   Constants.approvedDate4: approvedDate4,
  //   Constants.approvedDate5: approvedDate5,
  //   Constants.activityCode: activitycode,
  //   Constants.myDocNo: mydocno,
  //   Constants.userBatchNo: userbatchno,
  //   Constants.projectNo: projectno,
  //   Constants.transDate: transdate.toIso8601String(),
  //   Constants.reference: reference,
  //   Constants.notes: notes,
  //   Constants.glPostRef: glpostref,
  //   Constants.glPostRef1: glpostref1,
  //   Constants.companyID: companyid,
  //   Constants.terms: terms,
  //   Constants.refTransID: refTransId,
  //   Constants.signatures: signatures,
  //   Constants.extraSwitch1: extraSwitch1,
  //   Constants.extraSwitch2: extraSwitch2,
  //   Constants.status: status,
  //   Constants.crupID: crupId,
  //   Constants.userID: userid,
  //   Constants.active: active,
  //   Constants.entryDate: entrydate.toIso8601String(),
  //   Constants.entryTime: entrytime.toIso8601String(),
  //   Constants.updateTime: updttime.toIso8601String(),
  // };
}
