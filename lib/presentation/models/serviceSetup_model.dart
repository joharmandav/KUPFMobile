import 'dart:convert';

class ServiceSetupModel {
  int? tenentId;
  int? serviceId;
  String? serviceIconMob;
  String? serviceIconWeb;
  String? serviceSerialNo;
  String? masterServiceId;
  int? serIdbyUser;
  String? serviceShortName;
  String? serviceName1;
  String? serviceName2;
  int? serviceType;
  int? serviceSubType;
  int? allowSponser;
  bool allowedNonEmployees;
  int? minMonthsService;
  int? minInstallment;
  int? maxInstallment;
  bool frozen;
  bool previousEmployees;
  String? serApproval1;
  String? approvalBy1;
  DateTime? approvedDate1;
  String? serApproval2;
  String? approvalBy2;
  DateTime? approvedDate2;
  String? serApproval3;
  String? approvalBy3;
  DateTime? approvedDate3;
  String? serApproval4;
  String? approvalBy4;
  DateTime? approvedDate4;
  String? serApproval5;
  String? approvalBy5;
  DateTime? approvedDate5;
  String? serApproval6;
  String? approvalBy6;
  DateTime? approvedDate6;
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
  String? sortBy;
  String? active;
  int? crupId;
  String? userid;
  DateTime? entrydate;
  DateTime? entrytime;
  DateTime? updttime;
  DateTime? uploadDate;
  String? uploadby;
  DateTime? syncDate;
  String? syncby;
  int? synId;
  bool allowDiscountPer;
  String? discountType;
  double allowDiscountAmount;
  bool allowDiscountDefault;
  String? offerName;
  String? englishHTML;
  String? englishWebPageName;
  String? arabicHTML;
  String? arabicWebPageName;
  String? electronicForm1;
  String? electronicForm1URL;
  String? electronicForm2;
  String? electronicForm2URL;
  String? offerImage;
  String? offerType;
  String? offer;
  DateTime? offerStartDate;
  DateTime? offerEndDate;
  double? offerAmount;
  String? offerTypeName;
  String? webArabic;
  String? webEnglish;
  String? isElectronicForm;
  String? contractType;
  String? tab1;
  String? tab2;
  String? tab3;
  String? tab4;
  String? tab5;
  String? tab6;
  int? documentsCount;
  int? terminationID;
  bool isOffer;
  int? menuID;


    ServiceSetupModel({
        required this.tenentId,
        required this.serviceId,
        required this.serviceIconMob,
        required this.serviceIconWeb,
        required this.serviceSerialNo,
        required this.masterServiceId,
        required this.serIdbyUser,
        required this.serviceShortName,
        required this.serviceName1,
        required this.serviceName2,
        required this.serviceType,
        required this.serviceSubType,
        required this.allowSponser,
        required this.allowedNonEmployees,
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
        required this.serApproval6,
        required this.approvalBy6,
        required this.approvedDate6,
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
        required this.crupId,
        required this.userid,
        required this.entrydate,
        required this.entrytime,
        required this.updttime,
        required this.uploadDate,
        required this.uploadby,
        required this.syncDate,
        required this.syncby,
        required this.synId,
        required this.allowDiscountPer,
        required this.discountType,
        required this.allowDiscountAmount,
        required this.allowDiscountDefault,
        required this.offerName,
        required this.englishHTML,
        required this.englishWebPageName,
        required this.arabicHTML,
        required this.arabicWebPageName,
        required this.electronicForm1,
        required this.electronicForm1URL,
        required this.electronicForm2,
        required this.electronicForm2URL,
        required this.offerImage,
        required this.offerType,
        required this.offer,
        required this.offerStartDate,
        required this.offerEndDate,
        required this.offerAmount,
        required this.offerTypeName,
        required this.webArabic,
        required this.webEnglish,
        required this.isElectronicForm,
        required this.contractType,
        required this.tab1,
        required this.tab2,
        required this.tab3,
        required this.tab4,
        required this.tab5,
        required this.tab6,
        required this.documentsCount,
        required this.terminationID,
        required this.isOffer,
        required this.menuID,
    });
    // Factory method to parse the JSON data
  factory ServiceSetupModel.fromJson(Map<String, dynamic> json) {
    return ServiceSetupModel(
      tenentId: json['tenentId']??0,
      serviceId: json['serviceId']??0,
      serviceIconMob: json['serviceIconMob']??"",
      serviceIconWeb: json['serviceIconWeb']??"",
      serviceSerialNo: json['serviceSerialNo']??"",
      masterServiceId: json['masterServiceId']??"",
      serIdbyUser: json['serIdbyUser']??0,
      serviceShortName: json['serviceShortName']??"",
      serviceName1: json['serviceName1']??"",
      serviceName2: json['serviceName2']??"",
      serviceType: json['serviceType']??0,
      serviceSubType: json['serviceSubType']??0,
      allowSponser: json['allowSponser']??0,
      allowedNonEmployees: json['allowedNonEmployes'] ?? false,
      minMonthsService: json['minMonthsService']??0,
      minInstallment: json['minInstallment']??0,
      maxInstallment: json['maxInstallment']??0,
      frozen: json['frozen'] ?? false,
      previousEmployees: json['previousEmployees'] ?? false,
      serApproval1: json['serApproval1']??"",
      approvalBy1: json['approvalBy1']??"",
      approvedDate1: json['approvedDate1'] != null ? DateTime.parse(json['approvedDate1']) : null,
      serApproval2: json['serApproval2']??"",
      approvalBy2: json['approvalBy2']??"",
      approvedDate2: json['approvedDate2'] != null ? DateTime.parse(json['approvedDate2']) : null,
      serApproval3: json['serApproval3']??"",
      approvalBy3: json['approvalBy3']??"",
      approvedDate3: json['approvedDate3'] != null ? DateTime.parse(json['approvedDate3']) : null,
      serApproval4: json['serApproval4']??"",
      approvalBy4: json['approvalBy4']??"",
      approvedDate4: json['approvedDate4'] != null ? DateTime.parse(json['approvedDate4']) : null,
      serApproval5: json['serApproval5']??"",
      approvalBy5: json['approvalBy5']??"",
      approvedDate5: json['approvedDate5'] != null ? DateTime.parse(json['approvedDate5']) : null,
      serApproval6: json['serApproval6']??"",
      approvalBy6: json['approvalBy6']??"",
      approvedDate6: json['approvedDate6'] != null ? DateTime.parse(json['approvedDate6']) : null,
      finalApproval: json['finalApproval']??"",
      remarks: json['remarks']??"",
      keyword: json['keyword']??"",
      loanAct: json['loanAct']??"",
      hajjAct: json['hajjAct']??"",
      persLoanAct: json['persLoanAct']??"",
      consumerLoanAct: json['consumerLoanAct']??"",
      otherAct1: json['otherAct1']??"",
      otherAct2: json['otherAct2']??"",
      otherAct3: json['otherAct3']??"",
      otherAct4: json['otherAct4']??"",
      otherAct5: json['otherAct5']??"",
      sortBy: json['sortBy']??"",
      active: json['active']??"",
      crupId: json['crupId']??0,
      userid: json['userid']??"",
      entrydate: json['entrydate'] != null ? DateTime.parse(json['entrydate']) : null,
      entrytime: json['entrytime'] != null ? DateTime.parse(json['entrytime']) : null,
      updttime: DateTime.parse(json['updttime']),
      uploadDate: DateTime.parse(json['uploadDate']),
      uploadby: json['uploadby']??"",
      syncDate: DateTime.parse(json['syncDate']),
      syncby: json['syncby']??"",
      synId: json['synId']??0,
      allowDiscountPer: json['allowDiscountPer'],
      discountType: json['discountType']??"",
      allowDiscountAmount: json['allowDiscountAmount'],
      allowDiscountDefault: json['allowDiscountDefault'],
      offerName: json['offerName']??"",
      englishHTML: json['englishHTML']??"",
      englishWebPageName: json['englishWebPageName']??"",
      arabicHTML: json['arabicHTML']??"",
      arabicWebPageName: json['arabicWebPageName']??"",
      electronicForm1: json['electronicForm1']??"",
      electronicForm1URL: json['electronicForm1URL']??"",
      electronicForm2: json['electronicForm2']??"",
      electronicForm2URL: json['electronicForm2URL']??"",
      offerImage: json['offerImage']??"",
      offerType: json['offerType']??"",
      offer: json['offer']??"",
      offerStartDate: json['offerStartDate'] != null ? DateTime.parse(json['offerStartDate']) : null,
      offerEndDate: json['offerEndDate'] != null ? DateTime.parse(json['offerEndDate']) : null,
      offerAmount: json['offerAmount'],
      offerTypeName: json['offerTypeName']??"",
      webArabic: json['webArabic']??"",
      webEnglish: json['webEnglish']??"",
      isElectronicForm: json['isElectronicForm']??"",
      contractType: json['contractType']??"",
      tab1: json['tab1']??"",
      tab2: json['tab2']??"",
      tab3: json['tab3']??"",
      tab4: json['tab4']??"",
      tab5: json['tab5']??"",
      tab6: json['tab6']??'',
      documentsCount: json['documentsCount']??0,
      terminationID: json['terminationID']??0,
      isOffer: json['isOffer'],
      menuID: json['menuID']??0,
    );
  }

    // factory ServiceSetupModel.fromJson(String str) => ServiceSetupModel.fromMap(json.decode(str));

    // String toJson() => json.encode(toMap());

    // factory ServiceSetupModel.fromMap(Map<String, dynamic> json) => ServiceSetupModel(
    //     tenentId: json["tenentId"],
    //     serviceId: json["serviceId"],
    //     serviceIconMob: json["serviceIconMob"]??"",
    //     serviceIconWeb: json["serviceIconWeb"]??"",
    //     serviceSerialNo: json["serviceSerialNo"]??"",
    //     masterServiceId: json["masterServiceId"]??"",
    //     serIdbyUser: json["serIdbyUser"]??0,
    //     serviceShortName: json["serviceShortName"]??"",
    //     serviceName1: json["serviceName1"]??"",
    //     serviceName2: json["serviceName2"]??"",
    //     serviceType: json["serviceType"]??0,
    //     serviceSubType: json["serviceSubType"]??0,
    //     allowSponser: json["allowSponser"]??0,
    //     allowedNonEmployes: json["allowedNonEmployes"],
    //     minMonthsService: json["minMonthsService"]??0,
    //     minInstallment: json["minInstallment"]??0,
    //     maxInstallment: json["maxInstallment"]??0,
    //     frozen: json["frozen"],
    //     previousEmployees: json["previousEmployees"],
    //     serApproval1: json["serApproval1"]??"",
    //     approvalBy1: json["approvalBy1"]??"",
    //     approvedDate1: json["approvedDate1"],
    //     serApproval2: json["serApproval2"],
    //     approvalBy2: json["approvalBy2"],
    //     approvedDate2: json["approvedDate2"],
    //     serApproval3: json["serApproval3"]??"",
    //     approvalBy3: json["approvalBy3"]??"",
    //     approvedDate3: json["approvedDate3"],
    //     serApproval4: json["serApproval4"]??"",
    //     approvalBy4: json["approvalBy4"]??"",
    //     approvedDate4: json["approvedDate4"],
    //     serApproval5: json["serApproval5"]??"",
    //     approvalBy5: json["approvalBy5"]??"",
    //     approvedDate5: json["approvedDate5"],
    //     serApproval6: json["serApproval6"],
    //     approvalBy6: json["approvalBy6"]??"",
    //     approvedDate6: json["approvedDate6"],
    //     finalApproval: json["finalApproval"]??"",
    //     remarks: json["remarks"],
    //     keyword: json["keyword"],
    //     loanAct: json["loanAct"],
    //     hajjAct: json["hajjAct"],
    //     persLoanAct: json["persLoanAct"],
    //     consumerLoanAct: json["consumerLoanAct"]??"",
    //     otherAct1: json["otherAct1"]??"",
    //     otherAct2: json["otherAct2"]??"",
    //     otherAct3: json["otherAct3"]??"",
    //     otherAct4: json["otherAct4"]??"",
    //     otherAct5: json["otherAct5"]??"",
    //     sortBy: json["sortBy"],
    //     active: json["active"]??"",
    //     crupId: json["crupId"]??0,
    //     userid: json["userid"],
    //     entrydate: json["entrydate"],
    //     entrytime: json["entrytime"],
    //     updttime: DateTime.parse(json["updttime"]),
    //     uploadDate: DateTime.parse(json["uploadDate"]),
    //     uploadby: json["uploadby"],
    //     syncDate: DateTime.parse(json["syncDate"]),
    //     syncby: json["syncby"],
    //     synId: json["synId"]??0,
    //     allowDiscountPer: json["allowDiscountPer"],
    //     discountType: json["discountType"],
    //     allowDiscountAmount: json["allowDiscountAmount"],
    //     allowDiscountDefault: json["allowDiscountDefault"],
    //     offerName: json["offerName"]??"",
    //     englishHtml: json["englishHTML"]??"",
    //     englishWebPageName: json["englishWebPageName"],
    //     arabicHtml: json["arabicHTML"]??"",
    //     arabicWebPageName: json["arabicWebPageName"],
    //     electronicForm1: json["electronicForm1"],
    //     electronicForm1Url: json["electronicForm1URL"],
    //     electronicForm2: json["electronicForm2"],
    //     electronicForm2Url: json["electronicForm2URL"],
    //     offerImage: json["offerImage"],
    //     offerType: json["offerType"],
    //     offer: json["offer"]??"",
    //     offerStartDate: json["offerStartDate"],
    //     offerEndDate: json["offerEndDate"],
    //     offerAmount: json["offerAmount"],
    //     offerTypeName: json["offerTypeName"],
    //     webArabic: json["webArabic"]??"",
    //     webEnglish: json["webEnglish"]??"",
    //     isElectronicForm: json["isElectronicForm"],
    //     contractType: json["contractType"],
    //     tab1: json["tab1"]??"",
    //     tab2: json["tab2"]??"",
    //     tab3: json["tab3"]??"",
    //     tab4: json["tab4"]??"",
    //     tab5: json["tab5"]??"",
    //     tab6: json["tab6"]??"",
    //     documentsCount: json["documentsCount"]??0,
    //     terminationId: json["terminationID"]??0,
    //     isOffer: json["isOffer"],
    //     menUId: json["menU_ID"]??0,
    // );

    Map<String, dynamic> toMap() => {
        "TenentID": tenentId,
        "ServiceID": serviceId,
        "ServiceIconMob": serviceIconMob,
        "ServiceIconWeb": serviceIconWeb,
        "ServiceSerialNo": serviceSerialNo,
        "MasterServiceID": masterServiceId,
        "SerIDByUser": serIdbyUser,
        "ServiceShortName": serviceShortName,
        "ServiceName1": serviceName1,
        "ServiceName2": serviceName2,
        "ServiceType": serviceType,
        "ServiceSubType": serviceSubType,
        "AllowSponser": allowSponser,
        "AllowedNonEmployes": allowedNonEmployees,
        "MinMonthsService": minMonthsService,
        "MinInstallment": minInstallment,
        "MaxInstallment": maxInstallment,
        "Frozen": frozen,
        "PreviousEmployees": previousEmployees,
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
        "SerApproval6": serApproval6,
        "ApprovalBy6": approvalBy6,
        "ApprovedDate6": approvedDate6,
        "FinalApproval": finalApproval,
        "REMARKS": remarks,
        "Keyword": keyword,
        "LoanAct": loanAct,
        "HajjAct": hajjAct,
        "PersLoanAct": persLoanAct,
        "ConsumerLoanAct": consumerLoanAct,
        "OtherAct1": otherAct1,
        "OtherAct2": otherAct2,
        "OtherAct3": otherAct3,
        "OtherAct4": otherAct4,
        "OtherAct5": otherAct5,
        "SortBy": sortBy,
        "Active": active,
        "CRUP_ID": crupId,
        "USERID": userid,
        "ENTRYDATE": entrydate,
        "ENTRYTIME": entrytime,
        "UPDTTIME": updttime,
        "UploadDate": uploadDate,
        "Uploadby": uploadby,
        "SyncDate": syncDate,
        "Syncby": syncby,
        "SynID": synId,
        "AllowDiscountPer": allowDiscountPer,
        "DiscountType": discountType,
        "AllowDiscountAmount": allowDiscountAmount,
        "AllowDiscountDefault": allowDiscountDefault,
        "OfferName": offerName,
        "EnglishHTML": englishHTML,
        "EnglishWebPageName": englishWebPageName,
        "ArabicHTML": arabicHTML,
        "ArabicWebPageName": arabicWebPageName,
        "ElectronicForm1": electronicForm1,
        "ElectronicForm1URL": electronicForm1URL,
        "ElectronicForm2": electronicForm2,
        "ElectronicForm2URL": electronicForm2URL,
        "OfferImage": offerImage,
        "OfferType": offerType,
        "Offer": offer,
        "OfferStartDate": offerStartDate,
        "OfferEndDate": offerEndDate,
        "OfferAmount": offerAmount,
        "OfferTypeName": offerTypeName,
        "WebArabic": webArabic,
        "WebEnglish": webEnglish,
        "IsElectronicForm": isElectronicForm,
        "ContractType": contractType,
        "Tab1": tab1,
        "Tab2": tab2,
        "Tab3": tab3,
        "Tab4": tab4,
        "Tab5": tab5,
        "Tab6": tab6,
        "DocumentsCount": documentsCount,
        "TerminationID": terminationID,
        "ISOffer": isOffer,
        "MENU_ID": menuID,
    };
}
