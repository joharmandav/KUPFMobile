
class ServiceSetupDto {
  List<OffersModel> serviceSetupDto;
  int totalRecords;

  ServiceSetupDto({
    required this.serviceSetupDto,
    required this.totalRecords,
  });

  factory ServiceSetupDto.fromJson(Map<String, dynamic> json) => ServiceSetupDto(
    serviceSetupDto: List<OffersModel>.from(json["serviceSetupDto"].map((x) => OffersModel.fromJson(x))),
    totalRecords: json["totalRecords"],
  );

  Map<String, dynamic> toJson() => {
    "serviceSetupDto": List<dynamic>.from(serviceSetupDto.map((x) => x.toJson())),
    "totalRecords": totalRecords,
  };
}


class OffersModel {
  OffersModel({
     this.tenentId,
     this.serviceId,
     this.masterServiceId,
     this.serIdbyUser,
    this.serviceName1,
    this.serviceName2,
    this.serviceType,
    this.serviceTypeName,
    this.serviceSubType,
    this.allowSponser,
     this.allowedNonEmployes,
     this.minMonthsService,
     this.minInstallment,
     this.maxInstallment,
     this.frozen,
     this.previousEmployees,
    this.serApproval1,
    this.approvalBy1,
    this.approvedDate1,
    this.serApproval2,
    this.approvalBy2,
    this.approvedDate2,
    this.serApproval3,
    this.approvalBy3,
    this.approvedDate3,
    this.serApproval4,
    this.approvalBy4,
    this.approvedDate4,
    this.serApproval5,
    this.approvalBy5,
    this.approvedDate5,
    this.finalApproval,
    this.remarks,
    this.keyword,
    this.loanAct,
    this.hajjAct,
    this.persLoanAct,
    this.consumerLoanAct,
    this.otherAct1,
    this.otherAct2,
    this.otherAct3,
    this.otherAct4,
    this.otherAct5,
    this.sortBy,
    this.active,
    this.crupId,
    this.userid,
    this.entrydate,
    this.entrytime,
    this.updttime,
    this.uploadDate,
    this.uploadby,
    this.syncDate,
    this.syncby,
    this.synId,
    this.allowDiscountPer,
    this.allowDiscountAmount,
    this.allowDiscountDefault,
    this.englishHtml,
    this.englishWebPageName,
    this.arabicHtml,
    this.arabicWebPageName,
    this.electronicForm1,
    this.electronicForm1Url,
    this.electronicForm2,
    this.electronicForm2Url,
    this.file1,
    this.file2,
    this.offerName,
     this.offerImage,
     this.offerType,
     this.offerTypeName,
     this.offer,
     this.offerStartDate,
     this.offerEndDate,
     this.offerAmount,
  });

  int? tenentId;
  int? serviceId;
  String? masterServiceId;
  int? serIdbyUser;
  String? serviceName1;
  String? serviceName2;
  int? serviceType;
  String? serviceTypeName;
  int? serviceSubType;
  int? allowSponser;
  bool? allowedNonEmployes;
  int? minMonthsService;
  int? minInstallment;
  int? maxInstallment;
  bool? frozen;
  bool? previousEmployees;
  String? serApproval1;
  String? approvalBy1;
  String? approvedDate1;
  String? serApproval2;
  String? approvalBy2;
  String? approvedDate2;
  String? serApproval3;
  String? approvalBy3;
  String? approvedDate3;
  String? serApproval4;
  String? approvalBy4;
  String? approvedDate4;
  String? serApproval5;
  String? approvalBy5;
  String? approvedDate5;
  String? finalApproval;
  String? remarks;
  String? keyword;
  String? loanAct;
  String? hajjAct;
  String? persLoanAct;
  String? consumerLoanAct;
  String? otherAct1;
  String? otherAct2;
  String? otherAct3;
  String? otherAct4;
  String? otherAct5;
  int? sortBy;
  String? active;
  int? crupId;
  String? userid;
  String? entrydate;
  String? entrytime;
  String? updttime;
  String? uploadDate;
  String? uploadby;
  String? syncDate;
  String? syncby;
  int? synId;
  bool? allowDiscountPer;
  double? allowDiscountAmount;
  bool? allowDiscountDefault;
  String? englishHtml;
  String? englishWebPageName;
  String? arabicHtml;
  String? arabicWebPageName;
  String? electronicForm1;
  String? electronicForm1Url;
  String? electronicForm2;
  String? electronicForm2Url;
  String? file1;
  String? file2;
  String? offerImage;
  String? offerType;
  String? offerTypeName;
  String? offer;
  String? offerStartDate;
  String? offerEndDate;
  String? offerName;
  dynamic offerAmount;

  factory OffersModel.fromJson(Map<String, dynamic> json) => 5 == 6 ? OffersModel(
    tenentId: json["tenentId"],
    serviceId: json["serviceId"],
    masterServiceId: json["masterServiceId"],
    serIdbyUser: json["serIdbyUser"],
    serviceName1: json["serviceName1"],
    serviceName2: json["serviceName2"],
    serviceType: json["serviceType"],
    serviceTypeName: json["serviceTypeName"],
    serviceSubType: json["serviceSubType"],
    allowSponser: json["allowSponser"],
    allowedNonEmployes: json["allowedNonEmployes"],
    minMonthsService: json["minMonthsService"],
    minInstallment: json["minInstallment"],
    maxInstallment: json["maxInstallment"],
    frozen: json["frozen"],
    previousEmployees: json["previousEmployees"],
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
    crupId: json["crupId"],
    userid: json["userid"],
    entrydate: json["entrydate"],
    entrytime: json["entrytime"],
    updttime: json["updttime"],
    uploadDate: json["uploadDate"],
    uploadby: json["uploadby"],
    syncDate: json["syncDate"],
    syncby: json["syncby"],
    synId: json["synId"],
    allowDiscountPer: json["allowDiscountPer"],
    allowDiscountAmount: json["allowDiscountAmount"],
    allowDiscountDefault: json["allowDiscountDefault"],
    englishHtml: json["englishHTML"],
    englishWebPageName: json["englishWebPageName"],
    arabicHtml: json["arabicHTML"],
    arabicWebPageName: json["arabicWebPageName"],
    electronicForm1: json["electronicForm1"],
    electronicForm1Url: json["electronicForm1URL"],
    electronicForm2: json["electronicForm2"],
    electronicForm2Url: json["electronicForm2URL"],
    file1: json["file1"],
    file2: json["file2"],
    offerImage: json["offerImage"],
    offerType: json["offerType"],
    offerTypeName: json["offerTypeName"],
    offer: json["offer"],
    offerStartDate: json["offerStartDate"],
    offerEndDate: json["offerEndDate"],
    offerAmount: json["offerAmount"],
    offerName: json['offerName'],
  ) :
  OffersModel(
    tenentId: json["TenentID"],
    serviceId: json["ServiceID"],
    // serviceIconMob: json["ServiceIconMob"],
    // serviceIconWeb: json["ServiceIconWeb"],
    allowDiscountPer: json["AllowDiscountPer"],
    allowDiscountAmount: json["AllowDiscountAmount"],
    allowDiscountDefault: json["AllowDiscountDefault"],
    // serviceSerialNo: json["ServiceSerialNo"],
    masterServiceId: json["MasterServiceID"],
    // serIdByUser: json["SerIDByUser"],
    serviceName1: json["ServiceName1"],
    serviceName2: json["ServiceName2"],
    serviceType: json["ServiceType"],
    serviceSubType: json["ServiceSubType"],
    allowSponser: json["AllowSponser"],
    allowedNonEmployes: json["AllowedNonEmployes"],
    minMonthsService: json["MinMonthsService"],
    minInstallment: json["MinInstallment"],
    maxInstallment: json["MaxInstallment"],
    frozen: json["Frozen"],
    previousEmployees: json["PreviousEmployees"],
    serApproval1: json["SerApproval1"],
    approvalBy1: json["ApprovalBy1"],
    approvedDate1: json["ApprovedDate1"],
    serApproval2: json["SerApproval2"],
    approvalBy2: json["ApprovalBy2"],
    approvedDate2: json["ApprovedDate2"],
    serApproval3: json["SerApproval3"],
    approvalBy3: json["ApprovalBy3"],
    approvedDate3: json["ApprovedDate3"],
    serApproval4: json["SerApproval4"],
    approvalBy4: json["ApprovalBy4"],
    approvedDate4: json["ApprovedDate4"],
    serApproval5: json["SerApproval5"],
    approvalBy5: json["ApprovalBy5"],
    approvedDate5: json["ApprovedDate5"],
    finalApproval: json["FinalApproval"],
    remarks: json["REMARKS"],
    keyword: json["Keyword"],
    // mainServiceType: json["Main Service Type"],
    loanAct: json["LoanAct"],
    hajjAct: json["HajjAct"],
    persLoanAct: json["PersLoanAct"],
    consumerLoanAct: json["ConsumerLoanAct"],
    otherAct1: json["OtherAct1"],
    otherAct2: json["OtherAct2"],
    otherAct3: json["OtherAct3"],
    otherAct4: json["OtherAct4"],
    otherAct5: json["OtherAct5"],
    sortBy: json["SortBy"],
    active: json["Active"],
    crupId: json["CRUP_ID"],
    userid: json["USERID"],
    entrydate: json["ENTRYDATE"],
    entrytime: json["ENTRYTIME"],
    updttime: json["UPDTTIME"],
    uploadDate: json["UploadDate"],
    uploadby: json["Uploadby"],
    syncDate: json["SyncDate"],
    syncby: json["Syncby"],
    synId: json["SynID"],
    englishHtml: json["EnglishHTML"],
    arabicHtml: json["ArabicHTML"],
    electronicForm1: json["ElectronicForm1"],
    electronicForm1Url: json["ElectronicForm1URL"],
    electronicForm2: json["ElectronicForm2"],
    electronicForm2Url: json["ElectronicForm2URL"],
    englishWebPageName: json["EnglishWebPageName"],
    arabicWebPageName: json["ArabicWebPageName"],
    offerName: json["offerName"],
  );


  Map<String, dynamic> toJson() => {
    "tenentId": tenentId,
    "serviceId": serviceId,
    "masterServiceId": masterServiceId,
    "serIdbyUser": serIdbyUser,
    "serviceName1": serviceName1,
    "serviceName2": serviceName2,
    "serviceType": serviceType,
    "serviceTypeName": serviceTypeName,
    "serviceSubType": serviceSubType,
    "allowSponser": allowSponser,
    "allowedNonEmployes": allowedNonEmployes,
    "minMonthsService": minMonthsService,
    "minInstallment": minInstallment,
    "maxInstallment": maxInstallment,
    "frozen": frozen,
    "previousEmployees": previousEmployees,
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
    "crupId": crupId,
    "userid": userid,
    "entrydate": entrydate,
    "entrytime": entrytime,
    "updttime": updttime,
    "uploadDate": uploadDate,
    "uploadby": uploadby,
    "syncDate": syncDate,
    "syncby": syncby,
    "synId": synId,
    "allowDiscountPer": allowDiscountPer,
    "allowDiscountAmount": allowDiscountAmount,
    "allowDiscountDefault": allowDiscountDefault,
    "englishHTML": englishHtml,
    "englishWebPageName": englishWebPageName,
    "arabicHTML": arabicHtml,
    "arabicWebPageName": arabicWebPageName,
    "electronicForm1": electronicForm1,
    "electronicForm1URL": electronicForm1Url,
    "electronicForm2": electronicForm2,
    "electronicForm2URL": electronicForm2Url,
    "file1": file1,
    "file2": file2,
    "offerImage": offerImage,
    "offerType": offerType,
    "offer": offer,
    "offerStartDate": offerStartDate,
    "offerEndDate": offerEndDate,
    "offerAmount": offerAmount,
    "offerName" : offerName
  };

  factory OffersModel.fromMap(Map<String, dynamic> json) => OffersModel(
    tenentId: json["tenentId"],
    serviceId: json["serviceId"],
    masterServiceId: json["masterServiceId"],
    serIdbyUser: json["serIdbyUser"],
    serviceName1: json["serviceName1"],
    serviceName2: json["serviceName2"],
    serviceType: json["serviceType"],
    serviceTypeName: json["serviceTypeName"],
    serviceSubType: json["serviceSubType"],
    allowSponser: json["allowSponser"],
    allowedNonEmployes: json["allowedNonEmployes"] == 1 ? true : false,
    minMonthsService: json["minMonthsService"],
    minInstallment: json["minInstallment"],
    maxInstallment: json["maxInstallment"],
    frozen: json["frozen"] == 1 ? true : false,
    previousEmployees: json["previousEmployees"] == 1 ? true : false,
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
    crupId: json["crupId"],
    userid: json["userid"],
    entrydate: json["entrydate"],
    entrytime: json["entrytime"],
    updttime: json["updttime"],
    uploadDate: json["uploadDate"],
    uploadby: json["uploadby"],
    syncDate: json["syncDate"],
    syncby: json["syncby"],
    synId: json["synId"],
    allowDiscountPer: json["allowDiscountPer"] != null && json["allowDiscountPer"] == 1 ? true : false,
    allowDiscountAmount: json["allowDiscountAmount"],
    allowDiscountDefault: json["allowDiscountDefault"] != null && json["allowDiscountDefault"] == 1  ? true : false,
    englishHtml: json["englishHTML"],
    englishWebPageName: json["englishWebPageName"],
    arabicHtml: json["arabicHTML"],
    arabicWebPageName: json["arabicWebPageName"],
    electronicForm1: json["electronicForm1"],
    electronicForm1Url: json["electronicForm1URL"],
    electronicForm2: json["electronicForm2"],
    electronicForm2Url: json["electronicForm2URL"],
    file1: json["file1"],
    file2: json["file2"],
    offerImage: json["offerImage"],
    offerType: json["offerType"],
    offerTypeName: json["offerTypeName"],
    offer: json["offer"],
    offerStartDate: json["offerStartDate"],
    offerEndDate: json["offerEndDate"],
    offerAmount: json["offerAmount"],
    offerName: json['offerName'],
  );

  Map<String, dynamic> toMap() => {
    "tenentId": tenentId,
    "serviceId": serviceId,
    "masterServiceId": masterServiceId,
    "serIdbyUser": serIdbyUser,
    "serviceName1": serviceName1,
    "serviceName2": serviceName2,
    "serviceType": serviceType,
    "serviceTypeName": serviceTypeName,
    "serviceSubType": serviceSubType,
    "allowSponser": allowSponser,
    "allowedNonEmployes": allowedNonEmployes == null ? 0 : allowedNonEmployes! ? 1 : 0,
    "minMonthsService": minMonthsService,
    "minInstallment": minInstallment,
    "maxInstallment": maxInstallment,
    "frozen": frozen == null ? 0 : frozen! ? 1 : 0,
    "previousEmployees": previousEmployees == null ? 0 :previousEmployees! ? 1 : 0,
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
    "crupId": crupId,
    "userid": userid,
    "entrydate": entrydate,
    "entrytime": entrytime,
    "updttime": updttime,
    "uploadDate": uploadDate,
    "uploadby": uploadby,
    "syncDate": syncDate,
    "syncby": syncby,
    "synId": synId,
    "allowDiscountPer": allowDiscountPer! ? 1 : 0,
    "allowDiscountAmount": allowDiscountAmount,
    "allowDiscountDefault": allowDiscountDefault! ? 1 : 0,
    "englishHTML": englishHtml,
    "englishWebPageName": englishWebPageName,
    "arabicHTML": arabicHtml,
    "arabicWebPageName": arabicWebPageName,
    "electronicForm1": electronicForm1,
    "electronicForm1URL": electronicForm1Url,
    "electronicForm2": electronicForm2,
    "electronicForm2URL": electronicForm2Url,
    "file1": file1,
    "file2": file2,
    "offerImage": offerImage,
    "offerType": offerType,
    "offerTypeName": offerTypeName,
    "offer": offer,
    "offerStartDate": offerStartDate,
    "offerEndDate": offerEndDate,
    "offerAmount": offerAmount,
    "offerName": offerName
  };


  double getDiscountedAmount() {
    return ((allowDiscountAmount ?? 0.0 / 100) * offerAmount);
  }
}
