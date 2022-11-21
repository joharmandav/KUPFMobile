import '../../app/server/database/db_constant.dart';

class DetailedEmployeeModel {
  final int tenentID;
  final int locationID;
  final String employeeID;
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
  final int? department;
  String? departmentName;
  int? employeeGender;
  dynamic employeeBirthday;
  int? maritalStatus;
  int? salary;
  final String workTelephone;
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
  final String? active;
  final String? deleted;
  final String? dateTime;
  String? deviceID;
  final String? uploadDate;
  final String? uploadBy;
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
  });

  factory DetailedEmployeeModel.fromMap(Map<String, dynamic> map) =>
      DetailedEmployeeModel(
        tenentID: map[Constants.tenentID],
        locationID: map[Constants.deLocationID],
        employeeID: map[Constants.employeeID],
        contractType: map[Constants.contractType],
        pfID: map[Constants.pfID],
        subscribedDate: map[Constants.subscribedDate],
        agreedSubAmount: map[Constants.agreedSubAmount],
        reSubscribed: map[Constants.reSubscribed],
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
        joinedDate: map[Constants.joinedDate],
        endDate: map[Constants.endDate],
        terminationID: map[Constants.terminationID],
        subscriptionDate: map[Constants.subscriptionDate],
        reSubscriptionDate: map[Constants.reSubscriptionDate],
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
        membershipJoiningDate: map[Constants.membershipJoiningDate],
        termination: map[Constants.termination],
        terminationDate: map[Constants.terminationDate],
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
        dateTime: map[Constants.dateTime],
        deviceID: map[Constants.deviceID],
        uploadDate: map[Constants.uploadDate],
        uploadBy: map[Constants.uploadBY],
        syncDate: map[Constants.syncDate],
        syncBy: map[Constants.syncBY],
        synID: map[Constants.synID],
      );

  Map<String, dynamic> toMap() => {
    Constants.tenentID: tenentID,
    Constants.deLocationID: locationID,
    Constants.employeeID: employeeID,
    Constants.contractType: contractType,
    Constants.pfID: pfID,
    Constants.subscribedDate: subscribedDate,
    Constants.agreedSubAmount: agreedSubAmount,
    Constants.reSubscribed: reSubscribed,
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
    Constants.joinedDate: joinedDate,
    Constants.endDate: endDate,
    Constants.terminationID: terminationID,
    Constants.subscriptionDate: subscriptionDate,
    Constants.reSubscriptionDate: reSubscriptionDate,
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
    Constants.membershipJoiningDate: membershipJoiningDate,
    Constants.termination: termination,
    Constants.terminationDate: terminationDate,
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
    Constants.dateTime: dateTime,
    Constants.deviceID: deviceID,
    Constants.uploadDate: uploadDate,
    Constants.uploadBY: uploadBy,
    Constants.syncDate: syncDate,
    Constants.syncBY: syncBy,
    Constants.synID: synID,
  };
}
