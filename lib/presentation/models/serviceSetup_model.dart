import 'dart:convert';

class ServiceSetupModel {
    final int tenentId;
    final int serviceId;
    final dynamic serviceIconMob;
    final dynamic serviceIconWeb;
    final dynamic serviceSerialNo;
    final dynamic masterServiceId;
    final dynamic serIdbyUser;
    final dynamic serviceShortName;
    final dynamic serviceName1;
    final dynamic serviceName2;
    final dynamic serviceType;
    final dynamic serviceSubType;
    final dynamic allowSponser;
    final dynamic allowedNonEmployes;
    final dynamic minMonthsService;
    final dynamic minInstallment;
    final dynamic maxInstallment;
    final dynamic frozen;
    final dynamic previousEmployees;
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
    final dynamic serApproval6;
    final dynamic approvalBy6;
    final dynamic approvedDate6;
    final dynamic finalApproval;
    final dynamic remarks;
    final dynamic keyword;
    final dynamic loanAct;
    final dynamic hajjAct;
    final dynamic persLoanAct;
    final dynamic consumerLoanAct;
    final String? otherAct1;
    final String? otherAct2;
    final String? otherAct3;
    final String? otherAct4;
    final dynamic otherAct5;
    final dynamic sortBy;
    final dynamic active;
    final dynamic crupId;
    final dynamic userid;
    final dynamic entrydate;
    final dynamic entrytime;
    final dynamic updttime;
    final dynamic uploadDate;
    final dynamic uploadby;
    final dynamic syncDate;
    final dynamic syncby;
    final dynamic synId;
    final dynamic allowDiscountPer;
    final dynamic discountType;
    final dynamic allowDiscountAmount;
    final dynamic allowDiscountDefault;
    final dynamic offerName;
    final dynamic englishHtml;
    final dynamic englishWebPageName;
    final dynamic arabicHtml;
    final dynamic arabicWebPageName;
    final dynamic electronicForm1;
    final dynamic electronicForm1Url;
    final dynamic electronicForm2;
    final dynamic electronicForm2Url;
    final dynamic offerImage;
    final dynamic offerType;
    final dynamic offer;
    final dynamic offerStartDate;
    final dynamic offerEndDate;
    final dynamic offerAmount;
    final dynamic offerTypeName;
    final dynamic webArabic;
    final dynamic webEnglish;
    final dynamic isElectronicForm;
    final dynamic contractType;
    final dynamic tab1;
    final dynamic tab2;
    final dynamic tab3;
    final dynamic tab4;
    final dynamic tab5;
    final dynamic tab6;
    final dynamic documentsCount;
    final dynamic terminationId;
    final dynamic isOffer;
    final dynamic menUId;

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
        required this.englishHtml,
        required this.englishWebPageName,
        required this.arabicHtml,
        required this.arabicWebPageName,
        required this.electronicForm1,
        required this.electronicForm1Url,
        required this.electronicForm2,
        required this.electronicForm2Url,
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
        required this.terminationId,
        required this.isOffer,
        required this.menUId,
    });

    factory ServiceSetupModel.fromJson(Map<String, dynamic> json) => ServiceSetupModel.fromMap(json);

    Map<String, dynamic> toJson() => toMap();

    factory ServiceSetupModel.fromMap(Map<String, dynamic> json) => ServiceSetupModel(
        tenentId: json["tenentId"],
        serviceId: json["serviceId"],
        serviceIconMob: json["serviceIconMob"],
        serviceIconWeb: json["serviceIconWeb"],
        serviceSerialNo: json["serviceSerialNo"],
        masterServiceId: json["masterServiceId"],
        serIdbyUser: json["serIdbyUser"],
        serviceShortName: json["serviceShortName"],
        serviceName1: json["serviceName1"],
        serviceName2: json["serviceName2"],
        serviceType: json["serviceType"],
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
        serApproval6: json["serApproval6"],
        approvalBy6: json["approvalBy6"],
        approvedDate6: json["approvedDate6"],
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
        discountType: json["discountType"],
        allowDiscountAmount: json["allowDiscountAmount"],
        allowDiscountDefault: json["allowDiscountDefault"],
        offerName: json["offerName"],
        englishHtml: json["englishHTML"],
        englishWebPageName: json["englishWebPageName"],
        arabicHtml: json["arabicHTML"],
        arabicWebPageName: json["arabicWebPageName"],
        electronicForm1: json["electronicForm1"],
        electronicForm1Url: json["electronicForm1URL"],
        electronicForm2: json["electronicForm2"],
        electronicForm2Url: json["electronicForm2URL"],
        offerImage: json["offerImage"],
        offerType: json["offerType"],
        offer: json["offer"],
        offerStartDate: json["offerStartDate"],
        offerEndDate: json["offerEndDate"],
        offerAmount: json["offerAmount"],
        offerTypeName: json["offerTypeName"],
        webArabic: json["webArabic"],
        webEnglish: json["webEnglish"],
        isElectronicForm: json["isElectronicForm"],
        contractType: json["contractType"],
        tab1: json["tab1"],
        tab2: json["tab2"],
        tab3: json["tab3"],
        tab4: json["tab4"],
        tab5: json["tab5"],
        tab6: json["tab6"],
        documentsCount: json["documentsCount"],
        terminationId: json["terminationID"],
        isOffer: json["isOffer"],
        menUId: json["menU_ID"],
    );

    

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
        "AllowedNonEmployes": allowedNonEmployes,
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
        "EnglishHTML": englishHtml,
        "EnglishWebPageName": englishWebPageName,
        "ArabicHTML": arabicHtml,
        "ArabicWebPageName": arabicWebPageName,
        "ElectronicForm1": electronicForm1,
        "ElectronicForm1URL": electronicForm1Url,
        "ElectronicForm2": electronicForm2,
        "ElectronicForm2URL": electronicForm2Url,
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
        "TerminationID": terminationId,
        "ISOffer": isOffer,
        "MENU_ID": menUId,
    };
}
