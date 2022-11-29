import '../../app/server/database/db_constant.dart';

class ServiceSetupModel {
  final int tenentID;
  final int serviceID;
  final String? serviceIconMob;
  final String? serviceIconWeb;
  final int? allowDiscountPer;
  final int? allowDiscountAmount;
  final int? allowDiscountDefault;
  final int? serviceSerialNo;
  final String masterServiceID;
  final int serIDByUser;
  final String serviceName1;
  final String serviceName2;
  final int? serviceType;
  final int? serviceSubType;
  final int? allowSponser;
  final int allowedNonEmployes;
  final int minMonthsService;
  final int minInstallment;
  final int maxInstallment;
  final int frozen;
  final int previousEmployees;
  final String? serApproval1;
  final String? approvalBy1;
  final String? approvedDate1;
  final String? serApproval2;
  final String? approvalBy2;
  final String? approvedDate2;
  final String? serApproval3;
  final String? approvalBy3;
  final String? approvedDate3;
  final String? serApproval4;
  final String? approvalBy4;
  final String? approvedDate4;
  final String? serApproval5;
  final String? approvalBy5;
  final String? approvedDate5;
  final String? finalApproval;
  final String? remarks;
  final String? keyword;
  final String? loanAct;
  final String? hajjAct;
  final String? persLoanAct;
  final String? consumerLoanAct;
  final String? otherAct1;
  final String? otherAct2;
  final String? otherAct3;
  final String? otherAct4;
  final String? otherAct5;
  final int? sortBy;
  final String? active;
  final int? crupID;
  final String? userID;
  final String? entryDate;
  final String? entryTime;
  final String? updtTime;
  final String? uploadDate;
  final String? uploadBy;
  final String? syncDate;
  final String? syncBy;
  final int? synID;
  final String? englishHTML;
  final String? arabicHTML;
  final String? electronicForm1;
  final String? electronicForm1Url;
  final String? electronicForm2;
  final String? electronicForm2Url;
  final String? englishWebPageName;
  final String? arabicWebPageName;

  ServiceSetupModel({
    required this.tenentID,
    required this.serviceID,
    required this.serviceIconMob,
    required this.serviceIconWeb,
    required this.allowDiscountPer,
    required this.allowDiscountAmount,
    required this.allowDiscountDefault,
    required this.serviceSerialNo,
    required this.masterServiceID,
    required this.serIDByUser,
    required this.serviceName1,
    required this.serviceName2,
    required this.serviceType,
    required this.serviceSubType,
    required this.allowSponser,
    required this.allowedNonEmployes,
    required this.minMonthsService,
    required this.minInstallment,
    required this.maxInstallment,
    required this.frozen,
    required this.previousEmployees,
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
    required this.finalApproval,
    required this.remarks,
    required this.keyword,
    required this.loanAct,
    required this.hajjAct,
    required this.persLoanAct,
    required this.consumerLoanAct,
    required this.otherAct1,
    required this.otherAct2,
    required this.otherAct3,
    required this.otherAct4,
    required this.otherAct5,
    required this.sortBy,
    required this.active,
    required this.crupID,
    required this.userID,
    required this.entryDate,
    required this.entryTime,
    required this.updtTime,
    required this.uploadDate,
    required this.uploadBy,
    required this.syncDate,
    required this.syncBy,
    required this.synID,
    required this.englishHTML,
    required this.arabicHTML,
    required this.electronicForm1,
    required this.electronicForm1Url,
    required this.electronicForm2,
    required this.electronicForm2Url,
    required this.englishWebPageName,
    required this.arabicWebPageName,
  });

  factory ServiceSetupModel.fromJson(Map<String, dynamic> json) => ServiceSetupModel(
    tenentID: json["tenentId"],
    serviceID: json["serviceId"],
    masterServiceID: json["masterServiceId"],
    serIDByUser: json["serIdbyUser"],
    serviceName1: json["serviceName1"],
    serviceName2: json["serviceName2"],
    serviceType: json["serviceType"],
    // serviceTypeName: json["serviceTypeName"],
    serviceSubType: json["serviceSubType"],
    allowSponser: json["allowSponser"],
    allowedNonEmployes: (json["allowedNonEmployes"] as bool) ? 1 : 0,
    minMonthsService: json["minMonthsService"],
    minInstallment: json["minInstallment"],
    maxInstallment: json["maxInstallment"],
    frozen: (json["frozen"] as bool) ? 1 : 0,
    previousEmployees: (json["previousEmployees"] as bool) ? 1 : 0,
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
    finalApproval: json["finalApproval"],
    remarks: json["remarks"],
    keyword: json["keyword"],
    loanAct: json["loanAct"],
    hajjAct: json["hajjAct"],
    persLoanAct: json["persLoanAct"],
    consumerLoanAct: json["consumerLoanAct"],
    otherAct1: json["otherAct1"],
    otherAct2: json["otherAct2"],
    otherAct3: json["otherAct3"],
    otherAct4: json["otherAct4"],
    otherAct5: json["otherAct5"],
    sortBy: json["sortBy"],
    active: json["active"],
    crupID: json["crupId"],
    userID: json["userid"],
    entryDate: json["entrydate"],
    entryTime: json["entrytime"],
    updtTime: json["updttime"],
    uploadDate: json["uploadDate"],
    uploadBy: json["uploadby"],
    syncDate: json["syncDate"],
    syncBy: json["syncby"],
    synID: json["synId"],
    allowDiscountPer: (json["allowDiscountPer"] as bool) ? 1 : 0,
    allowDiscountAmount: json["allowDiscountAmount"],
    allowDiscountDefault: (json["allowDiscountDefault"] as bool) ? 1 : 0,
    englishHTML: json["englishHTML"],
    englishWebPageName: json["englishWebPageName"],
    arabicHTML: json["arabicHTML"],
    arabicWebPageName: json["arabicWebPageName"],
    electronicForm1: json["electronicForm1"],
    electronicForm1Url: json["electronicForm1URL"],
    electronicForm2: json["electronicForm2"],
    electronicForm2Url: json["electronicForm2URL"],
    serviceIconMob: json[Constants.serviceIconMob],
    serviceIconWeb: json[Constants.serviceIconWeb],
    serviceSerialNo: json[Constants.serviceSerialNo],
    // file1: json["file1"],
    // file2: json["file2"],
  );

  Map<String, dynamic> toJson() => {
    "tenentId": tenentID,
    "serviceId": serviceID,
    "masterServiceId": masterServiceID,
    "serIdbyUser": serIDByUser,
    "serviceName1": serviceName1,
    "serviceName2": serviceName2,
    "serviceType": serviceType,
    // "serviceTypeName": serviceTypeName,
    "serviceSubType": serviceSubType,
    "allowSponser": allowSponser,
    "allowedNonEmployes": allowedNonEmployes == 1,
    "minMonthsService": minMonthsService,
    "minInstallment": minInstallment,
    "maxInstallment": maxInstallment,
    "frozen": frozen == 1,
    "previousEmployees": previousEmployees == 1,
    "serApproval1": serApproval1,
    "approvalBy1": approvalBy1,
    "approvedDate1": approvedDate1,
    "serApproval2": serApproval2,
    "approvalBy2": approvalBy2,
    "approvedDate2": approvedDate2,
    "serApproval3": serApproval3,
    "approvalBy3": approvalBy3,
    "approvedDate3": approvedDate3,
    "serApproval4": serApproval4,
    "approvalBy4": approvalBy4,
    "approvedDate4": approvedDate4,
    "serApproval5": serApproval5,
    "approvalBy5": approvalBy5,
    "approvedDate5": approvedDate5,
    "finalApproval": finalApproval,
    "remarks": remarks,
    "keyword": keyword,
    "loanAct": loanAct,
    "hajjAct": hajjAct,
    "persLoanAct": persLoanAct,
    "consumerLoanAct": consumerLoanAct,
    "otherAct1": otherAct1,
    "otherAct2": otherAct2,
    "otherAct3": otherAct3,
    "otherAct4": otherAct4,
    "otherAct5": otherAct5,
    "sortBy": sortBy,
    "active": active,
    "crupId": crupID,
    "userid": userID,
    "entrydate": entryDate,
    "entrytime": entryTime,
    "updttime": updtTime,
    "uploadDate": uploadDate,
    "uploadby": uploadBy,
    "syncDate": syncDate,
    "syncby": syncBy,
    "synId": synID,
    "allowDiscountPer": allowDiscountPer == 1,
    "allowDiscountAmount": allowDiscountAmount,
    "allowDiscountDefault": allowDiscountDefault == 1,
    "englishHTML": englishHTML,
    "englishWebPageName": englishWebPageName,
    "arabicHTML": arabicHTML,
    "arabicWebPageName": arabicWebPageName,
    "electronicForm1": electronicForm1,
    "electronicForm1URL": electronicForm1Url,
    "electronicForm2": electronicForm2,
    "electronicForm2URL": electronicForm2Url,
    // "file1": file1,
    // "file2": file2,
  };

  factory ServiceSetupModel.fromMap(Map<String, dynamic> map) =>
      ServiceSetupModel(
        tenentID: map[Constants.tenentID],
        serviceID: map[Constants.serviceID],
        serviceIconMob: map[Constants.serviceIconMob],
        serviceIconWeb: map[Constants.serviceIconWeb],
        allowDiscountPer: map[Constants.allowDiscountPer],
        allowDiscountAmount: map[Constants.allowDiscountAmount],
        allowDiscountDefault: map[Constants.allowDiscountDefault],
        serviceSerialNo: map[Constants.serviceSerialNo],
        masterServiceID: map[Constants.masterServiceID],
        serIDByUser: map[Constants.serIDByUser],
        serviceName1: map[Constants.serviceName1],
        serviceName2: map[Constants.serviceName2],
        serviceType: map[Constants.serviceType],
        serviceSubType: map[Constants.serviceSubType],
        allowSponser: map[Constants.allowSponser],
        allowedNonEmployes: map[Constants.allowedNonEmployes],
        minMonthsService: map[Constants.minMonthsService],
        minInstallment: map[Constants.minInstallment],
        maxInstallment: map[Constants.maxInstallment],
        frozen: map[Constants.frozen],
        previousEmployees: map[Constants.previousEmployees],
        serApproval1: map[Constants.serApproval1],
        approvalBy1: map[Constants.approvalBy1],
        approvedDate1: map[Constants.approvedDate1],
        serApproval2: map[Constants.serApproval2],
        approvalBy2: map[Constants.approvalBy2],
        approvedDate2: map[Constants.approvedDate2],
        serApproval3: map[Constants.serApproval3],
        approvalBy3: map[Constants.approvalBy3],
        approvedDate3: map[Constants.approvedDate3],
        serApproval4: map[Constants.serApproval4],
        approvalBy4: map[Constants.approvalBy4],
        approvedDate4: map[Constants.approvedDate4],
        serApproval5: map[Constants.serApproval5],
        approvalBy5: map[Constants.approvalBy5],
        approvedDate5: map[Constants.approvedDate5],
        finalApproval: map[Constants.finalApproval],
        remarks: map[Constants.remarks],
        keyword: map[Constants.keyword],
        loanAct: map[Constants.loanAct],
        hajjAct: map[Constants.hajjAct],
        persLoanAct: map[Constants.persLoanAct],
        consumerLoanAct: map[Constants.consumerLoanAct],
        otherAct1: map[Constants.otherAct1],
        otherAct2: map[Constants.otherAct2],
        otherAct3: map[Constants.otherAct3],
        otherAct4: map[Constants.otherAct4],
        otherAct5: map[Constants.otherAct5],
        sortBy: map[Constants.sortBy],
        active: map[Constants.active],
        crupID: map[Constants.crupID],
        userID: map[Constants.userID],
        entryDate: map[Constants.entryDate],
        entryTime: map[Constants.entryTime],
        updtTime: map[Constants.updateTime],
        uploadDate: map[Constants.uploadDate],
        uploadBy: map[Constants.uploadBY],
        syncDate: map[Constants.syncDate],
        syncBy: map[Constants.syncBY],
        synID: map[Constants.synID],
        englishHTML: map[Constants.englishHTML],
        arabicHTML: map[Constants.arabicHTML],
        electronicForm1: map[Constants.electronicForm1],
        electronicForm1Url: map[Constants.electronicForm1URL],
        electronicForm2: map[Constants.electronicForm2],
        electronicForm2Url: map[Constants.electronicForm2URL],
        englishWebPageName: map[Constants.englishWebPageName],
        arabicWebPageName: map[Constants.arabicWebPageName],
      );

  Map<String, dynamic> toMap() => {
        Constants.tenentID: tenentID,
        Constants.serviceID: serviceID,
        Constants.serviceIconMob: serviceIconMob,
        Constants.serviceIconWeb: serviceIconWeb,
        Constants.allowDiscountPer: allowDiscountPer,
        Constants.allowDiscountAmount: allowDiscountAmount,
        Constants.allowDiscountDefault: allowDiscountDefault,
        Constants.serviceSerialNo: serviceSerialNo,
        Constants.masterServiceID: masterServiceID,
        Constants.serIDByUser: serIDByUser,
        Constants.serviceName1: serviceName1,
        Constants.serviceName2: serviceName2,
        Constants.serviceType: serviceType,
        Constants.serviceSubType: serviceSubType,
        Constants.allowSponser: allowSponser,
        Constants.allowedNonEmployes: allowedNonEmployes,
        Constants.minMonthsService: minMonthsService,
        Constants.minInstallment: minInstallment,
        Constants.maxInstallment: maxInstallment,
        Constants.frozen: frozen,
        Constants.previousEmployees: previousEmployees,
        Constants.serApproval1: serApproval1,
        Constants.approvalBy1: approvalBy1,
        Constants.approvedDate1: approvedDate1,
        Constants.serApproval2: serApproval2,
        Constants.approvalBy2: approvalBy2,
        Constants.approvedDate2: approvedDate2,
        Constants.serApproval3: serApproval3,
        Constants.approvalBy3: approvalBy3,
        Constants.approvedDate3: approvedDate3,
        Constants.serApproval4: serApproval4,
        Constants.approvalBy4: approvalBy4,
        Constants.approvedDate4: approvedDate4,
        Constants.serApproval5: serApproval5,
        Constants.approvalBy5: approvalBy5,
        Constants.approvedDate5: approvedDate5,
        Constants.finalApproval: finalApproval,
        Constants.remarks: remarks,
        Constants.keyword: keyword,
        Constants.loanAct: loanAct,
        Constants.hajjAct: hajjAct,
        Constants.persLoanAct: persLoanAct,
        Constants.consumerLoanAct: consumerLoanAct,
        Constants.otherAct1: otherAct1,
        Constants.otherAct2: otherAct2,
        Constants.otherAct3: otherAct3,
        Constants.otherAct4: otherAct4,
        Constants.otherAct5: otherAct5,
        Constants.sortBy: sortBy,
        Constants.active: active,
        Constants.crupID: crupID,
        Constants.userID: userID,
        Constants.entryDate: entryDate,
        Constants.entryTime: entryTime,
        Constants.updateTime: updtTime,
        Constants.uploadDate: uploadDate,
        Constants.uploadBY: uploadBy,
        Constants.syncDate: syncDate,
        Constants.syncBY: syncBy,
        Constants.synID: synID,
        Constants.englishHTML: englishHTML,
        Constants.arabicHTML: arabicHTML,
        Constants.electronicForm1: electronicForm1,
        Constants.electronicForm1URL: electronicForm1Url,
        Constants.electronicForm2: electronicForm2,
        Constants.electronicForm2URL: electronicForm2Url,
        Constants.englishWebPageName: englishWebPageName,
        Constants.arabicWebPageName: arabicWebPageName,
      };
}
