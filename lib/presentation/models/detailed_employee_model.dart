import 'package:intl/intl.dart';

import '../../app/server/database/db_constant.dart';

class DetailedEmployeeModel {
  final int tenentID;
  final int locationID;
  final int employeeID;
  final String? contractType;
  final String? pfID;
  final String? subscribedDate;
  final String? agreedSubAmount;
  final String? reSubscribed;
  final String employeeType;
  String? arabicName;
  String? englishName;
  final int? jobTitleCode;
  final String? jobTitleName;
  final String token;
  int? department;
  String? departmentName;
  int? employeeGender;
  dynamic employeeBirthday;
  int? maritalStatus;
  int? salary;
  String workTelephone;
  String workEmail;
  String? mobileNumber;
  String? next2KinName;
  String? next2KinMobNumber;
  final int? nationCode;
  final String? nationName;
  final String cidNumber;
  String paciNumber;
  String otherID;
  final int subscriptionStatus;
  final int? employeeStatus;
  final String? joinedDate;
  final String? endDate;
  final int? terminationID;
  final String? subscriptionDate;
  final String? reSubscriptionDate;
  final String? loanAct;
  final String? hajjAct;
  final String? persLoanAct;
  final String? consumerLoanAct;
  final String? otherAct1;
  final String? otherAct2;
  final String? otherAct3;
  final String? otherAct4;
  final String? otherAct5;
  final String? membership;
  final String? membershipJoiningDate;
  final String? termination;
  final String? terminationDate;
  final String? employeeStreet1;
  final String? employeeStreet2;
  final String? cityCode;
  final int? countryCode;
  final String? remarks;
  final String? userID;
  final String? activeDirectoryID;
  final int? mainHRRoleID;
  final String? employeeLoginID;
  final String? employeePassword;
  final bool? active;
  final bool? deleted;
  final String? dateTime;
  String? deviceID;
  String? refName1;
  String? refName2;
  final String? uploadDate;
  String? uploadBy;
  final String? syncDate;
  final String? syncBy;
  final int? synID;

  DetailedEmployeeModel({
    required this.tenentID,
    required this.locationID,
    required this.employeeID,
    this.contractType,
    this.pfID,
    this.subscribedDate,
    this.agreedSubAmount,
    this.reSubscribed,
    required this.token,
    required this.employeeType,
    this.arabicName,
    this.englishName,
    this.jobTitleCode,
    this.jobTitleName,
    this.department,
    this.departmentName,
    this.employeeGender,
    this.employeeBirthday,
    this.maritalStatus,
    this.salary,
    required this.workTelephone,
    required this.workEmail,
    this.mobileNumber,
    this.next2KinName,
    this.next2KinMobNumber,
    this.nationCode,
    this.nationName,
    required this.cidNumber,
    required this.paciNumber,
    required this.otherID,
    required this.subscriptionStatus,
    this.employeeStatus,
    this.joinedDate,
    this.endDate,
    this.terminationID,
    this.subscriptionDate,
    this.reSubscriptionDate,
    this.loanAct,
    this.hajjAct,
    this.persLoanAct,
    this.consumerLoanAct,
    this.otherAct1,
    this.otherAct2,
    this.otherAct3,
    this.otherAct4,
    this.otherAct5,
    this.membership,
    this.membershipJoiningDate,
    this.termination,
    this.terminationDate,
    required this.employeeStreet1,
    required this.employeeStreet2,
    required this.cityCode,
    required this.countryCode,
    this.remarks,
    this.userID,
    this.activeDirectoryID,
    this.mainHRRoleID,
    this.employeeLoginID,
    this.employeePassword,
    this.active,
    this.deleted,
    this.dateTime,
    required this.deviceID,
    this.uploadDate,
    this.uploadBy,
    this.syncDate,
    this.syncBy,
    this.synID,
    this.refName1,
    this.refName2,
  });

  factory DetailedEmployeeModel.fromMap(Map<String, dynamic> map) =>
      DetailedEmployeeModel(
        tenentID: map[Constants.tenentID],
        locationID: map[Constants.deLocationID],
        employeeID: map[Constants.employeeID],
        contractType: map[Constants.contractType],
        pfID: map[Constants.pfID],
        token: map[Constants.token] ?? "",
        subscribedDate:map[Constants.subscribedDate] == null ? null :map[Constants.subscribedDate],
        agreedSubAmount: map[Constants.agreedSubAmount],
        reSubscribed:map[Constants.reSubscribed] == null ? null : map[Constants.reSubscribed],
        employeeType: map[Constants.employeeType],
        arabicName: map[Constants.arabicName],
        englishName: map[Constants.englishName],
        jobTitleCode: map[Constants.jobTitleCode],
        jobTitleName: map[Constants.jobTitleName],
        department: map[Constants.department],
        departmentName: map[Constants.departmentName],
        employeeGender: map[Constants.employeeGender],
        employeeBirthday: map[Constants.employeeBirthday],
        maritalStatus: map[Constants.empMaritalStatus],
        salary: map[Constants.salary],
        workTelephone: map[Constants.empWorkTelephone],
        workEmail: map[Constants.empWorkEmail],
        mobileNumber: map[Constants.mobileNumber],
        next2KinName: map[Constants.next2KinName],
        next2KinMobNumber: map[Constants.next2KinMobNumber],
        nationCode: map[Constants.nationCode],
        nationName: map[Constants.nationName],
        cidNumber: map[Constants.empCIDNum],
        paciNumber: map[Constants.empPaciNum],
        otherID: map[Constants.empOtherID],
        subscriptionStatus: map[Constants.subscriptionStatus],
        employeeStatus: map[Constants.empStatus],
        joinedDate: map[Constants.joinedDate] == null ? null :map[Constants.joinedDate],
        endDate: map[Constants.endDate] == null ? null : map[Constants.endDate],
        terminationID: map[Constants.terminationID],
        subscriptionDate: map[Constants.subscriptionDate] == null ? null : map[Constants.subscriptionDate],
        reSubscriptionDate:map[Constants.reSubscriptionDate] == null ? null : map[Constants.reSubscriptionDate],
        loanAct: map[Constants.loanAct],
        hajjAct: map[Constants.hajjAct],
        persLoanAct: map[Constants.persLoanAct],
        consumerLoanAct: map[Constants.consumerLoanAct],
        otherAct1: map[Constants.otherAct1],
        otherAct2: map[Constants.otherAct2],
        otherAct3: map[Constants.otherAct3],
        otherAct4: map[Constants.otherAct4],
        otherAct5: map[Constants.otherAct5],
        membership: map[Constants.membership],
        membershipJoiningDate:map[Constants.membershipJoiningDate] == null ? null: map[Constants.membershipJoiningDate],
        termination: map[Constants.termination],
        terminationDate:map[Constants.terminationDate] == null ? null : map[Constants.terminationDate],
        employeeStreet1: map[Constants.empStreet1],
        employeeStreet2: map[Constants.empStreet2],
        cityCode: map[Constants.cityCode],
        countryCode: map[Constants.countryCode],
        remarks: map[Constants.remarks],
        userID: map[Constants.empUserID],
        activeDirectoryID: map[Constants.activeDirectoryID],
        mainHRRoleID: map[Constants.mainHRRoleID],
        employeeLoginID: map[Constants.employeeLoginID],
        employeePassword: map[Constants.employeePassword],
        active: map[Constants.active],
        deleted: map[Constants.deleted],
        dateTime:map[Constants.dateTime] == null ? null : map[Constants.dateTime],
        deviceID: map[Constants.deviceID],
        uploadDate:map[Constants.uploadDate] == null ? null : map[Constants.uploadDate],
        uploadBy: map[Constants.uploadBY],
        syncDate:map[Constants.syncDate]== null ? null: map[Constants.syncDate],
        syncBy: map[Constants.syncBY],
        synID: map[Constants.synID],
      );

  Map<String, dynamic> toMap() => {
    Constants.tenentID: tenentID,
    Constants.deLocationID: locationID,
    Constants.employeeID: employeeID,
    Constants.contractType: contractType,
    Constants.pfID: pfID,
    Constants.token : token,
    Constants.subscribedDate: subscribedDate == null ? null : subscribedDate!,
    Constants.agreedSubAmount: agreedSubAmount,
    Constants.reSubscribed: reSubscribed == null ? null :reSubscribed!,
    Constants.employeeType: employeeType,
    Constants.arabicName: arabicName,
    Constants.englishName: englishName,
    Constants.jobTitleCode: jobTitleCode,
    Constants.jobTitleName: jobTitleName,
    Constants.department: department,
    Constants.departmentName: departmentName,
    Constants.employeeGender: employeeGender,
    Constants.employeeBirthday: employeeBirthday,
    Constants.empMaritalStatus: maritalStatus,
    Constants.salary: salary,
    Constants.empWorkTelephone: workTelephone,
    Constants.empWorkEmail: workEmail,
    Constants.mobileNumber: mobileNumber,
    Constants.next2KinName: next2KinName,
    Constants.next2KinMobNumber: next2KinMobNumber,
    Constants.nationCode: nationCode,
    Constants.nationName: nationName,
    Constants.empCIDNum: cidNumber,
    Constants.empPaciNum: paciNumber,
    Constants.empOtherID: otherID,
    Constants.subscriptionStatus: subscriptionStatus,
    Constants.empStatus: employeeStatus,
    Constants.joinedDate: joinedDate == null ? null :joinedDate!,
    Constants.endDate:endDate == null ? null : endDate!,
    Constants.terminationID: terminationID,
    Constants.subscriptionDate: subscriptionDate == null ? null :subscriptionDate!,
    Constants.reSubscriptionDate: reSubscriptionDate == null ? null :reSubscriptionDate!,
    Constants.loanAct: loanAct,
    Constants.hajjAct: hajjAct,
    Constants.persLoanAct: persLoanAct,
    Constants.consumerLoanAct: consumerLoanAct,
    Constants.otherAct1: otherAct1,
    Constants.otherAct2: otherAct2,
    Constants.otherAct3: otherAct3,
    Constants.otherAct4: otherAct4,
    Constants.otherAct5: otherAct5,
    Constants.membership: membership,
    Constants.membershipJoiningDate: membershipJoiningDate == null ? null :membershipJoiningDate!,
    Constants.termination: termination,
    Constants.terminationDate: terminationDate == null ? null :terminationDate!,
    Constants.empStreet1: employeeStreet1,
    Constants.empStreet2: employeeStreet2,
    Constants.cityCode: cityCode,
    Constants.countryCode: countryCode,
    Constants.remarks: remarks,
    Constants.empUserID: userID,
    Constants.activeDirectoryID: activeDirectoryID,
    Constants.mainHRRoleID: mainHRRoleID,
    Constants.employeeLoginID: employeeLoginID,
    Constants.employeePassword: employeePassword,
    Constants.active: active,
    Constants.deleted: deleted,
    Constants.dateTime: dateTime == null ? null :dateTime!,
    Constants.deviceID: deviceID,
    Constants.uploadDate: uploadDate == null ? null :uploadDate!,
    Constants.uploadBY: uploadBy,
    Constants.syncDate: syncDate == null ? null :syncDate!,
    Constants.syncBY: syncBy,
    Constants.synID: synID,
  };

  factory DetailedEmployeeModel.fromJson(Map<String, dynamic> json) => DetailedEmployeeModel(
    tenentID: json["tenentId"],
    locationID: json["locationId"],
    employeeID: json["employeeId"],
    contractType: json["contractType"],
    pfID: json["pfid"],
    token: json['token'] ?? "",
    subscribedDate: json["subscribedDate"],
    agreedSubAmount: json["agreedSubAmount"].toString(),
    reSubscribed: json["reSubscribed"],
    employeeType: json["employeeType"],
    arabicName: json["arabicName"],
    englishName: json["englishName"],
    jobTitleCode: json["jobTitleCode"],
    jobTitleName: json["jobTitleName"],
    department: json["department"],
    departmentName: json["departmentName"],
    employeeGender: json["empGender"],
    employeeBirthday: json["empBirthday"],
    maritalStatus: json["empMaritalStatus"] == "Single" || json["empMaritalStatus"] == "1" ? 1 : 0,
    salary: json["salary"] == null ? 0 : int.tryParse(double.parse(json["salary"].toString()).toStringAsFixed(0)),
    workTelephone: json["empWorkTelephone"],
    workEmail: json["empWorkEmail"],
    mobileNumber: json["mobileNumber"],
    next2KinName: json["next2KinName"],
    next2KinMobNumber: json["next2KinMobNumber"],
    nationCode: json["nationCode"],
    nationName: json["nationName"],
    cidNumber: json["empCidNum"],
    paciNumber: json["empPaciNum"],
    otherID: json["empOtherId"],
    employeeStatus: json["empStatus"],
    joinedDate: json["joinedDate"],
    endDate: json["endDate"],
    terminationID: json["terminationId"],
    subscriptionDate: json["subscriptionDate"],
    reSubscriptionDate: json["reSubscripedDate"],
    loanAct: json["loanAct"],
    hajjAct: json["hajjAct"],
    consumerLoanAct: json["consumerLoanAct"],
    persLoanAct: json["persLoanAct"],
    otherAct1: json["otherAct1"],
    otherAct2: json["otherAct2"],
    otherAct3: json["otherAct3"],
    otherAct4: json["otherAct4"],
    otherAct5: json["otherAct5"],
    employeeStreet1: json["empStreet1"],
    employeeStreet2: json["empStreet2"],
    cityCode: json["cityCode"],
    countryCode: json["counCode"],
    remarks: json["remarks"],
    userID: json["userId"],
    activeDirectoryID: json["activeDirectoryId"],
    mainHRRoleID: json["mainHrroleId"],
    employeeLoginID: json["employeeLoginId"],
    employeePassword: json["employeePassword"],
    active: json["active"],
    deleted: json["deleted"],
    dateTime: json["dateTime"],
    deviceID: json["deviceId"],
    uploadDate: json["uploadDate"],
    uploadBy: json["uploadby"],
    syncDate: json["syncDate"],
    syncBy: json["syncby"],
    synID: json["synId"],
    refName1: json["refName1"],
    refName2: json["refName2"],
    membership: json["membership"],
    membershipJoiningDate: json["membershipJoiningDate"],
    termination: json["termination"],
    terminationDate: json["terminationDate"],
    subscriptionStatus: json['subscriptionStatus'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "tenentId": tenentID,
    "locationId": locationID,
    "employeeId": employeeID,
    "contractType": contractType,
    "pfid": pfID,
    "token" : token,
    "subscribedDate": subscribedDate,
    "agreedSubAmount": int.tryParse(agreedSubAmount?? "0"),
    "reSubscribed": reSubscribed,
    "employeeType": employeeType,
    "arabicName": arabicName,
    "englishName": englishName,
    "jobTitleCode": jobTitleCode,
    "jobTitleName": jobTitleName,
    "department": department,
    "departmentName": departmentName,
    "empGender": employeeGender,
    "empBirthday": employeeBirthday,
    "empMaritalStatus": maritalStatus,
    "salary": salary,
    "empWorkTelephone": workTelephone,
    "empWorkEmail": workEmail,
    "mobileNumber": mobileNumber,
    "next2KinName": next2KinName,
    "next2KinMobNumber": next2KinMobNumber,
    "nationCode": nationCode,
    "nationName": nationName,
    "empCidNum": cidNumber,
    "empPaciNum": paciNumber,
    "empOtherId": otherID,
    "empStatus": employeeStatus,
    "joinedDate": joinedDate,
    "endDate": endDate,
    "terminationId": terminationID,
    "subscriptionDate": subscriptionDate,
    "reSubscripedDate": reSubscriptionDate,
    "loanAct": loanAct,
    "hajjAct": hajjAct,
    "consumerLoanAct": consumerLoanAct,
    "persLoanAct": persLoanAct,
    "otherAct1": otherAct1,
    "otherAct2": otherAct2,
    "otherAct3": otherAct3,
    "otherAct4": otherAct4,
    "otherAct5": otherAct5,
    "empStreet1": employeeStreet1,
    "empStreet2": employeeStreet2,
    "cityCode": cityCode,
    "counCode": countryCode,
    "remarks": remarks,
    "userId": userID,
    "activeDirectoryId": activeDirectoryID,
    "mainHrroleId": mainHRRoleID,
    "employeeLoginId": employeeLoginID,
    "employeePassword": employeePassword,
    "active": active,
    "deleted": deleted,
    "dateTime": dateTime,
    "deviceId": deviceID,
    "uploadDate": uploadDate,
    "uploadby": uploadBy,
    "syncDate": syncDate,
    "syncby": syncBy,
    "synId": synID,
    "refName1": refName1,
    "refName2": refName2,
    "membership": membership,
    "membershipJoiningDate": membershipJoiningDate,
    "termination": termination,
    "terminationDate": terminationDate,
  };
}