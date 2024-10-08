// class DetailedEmployeeModel {
//   int tenentId;
//   int locationId;
//   int employeeId;
//   String contractType;
//   String pfid;
//   DateTime subscribedDate;
//   String? agreedSubAmount;
//   String? reSubscribed;
//   String? employeeType;
//   String arabicName;
//   String englishName;
//   int jobTitleCode;
//   String jobTitleName;
//   int department;
//   String departmentName;
//   int empGender;
//   DateTime empBirthday;
//   String empMaritalStatus;
//   String? salary;
//   String empWorkTelephone;
//   String empWorkEmail;
//   String mobileNumber;
//   String next2KinName;
//   String next2KinMobNumber;
//   int nationCode;
//   String nationName;
//   String empCidNum;
//   String empPaciNum;
//   String empOtherId;
//   int empStatus;
//   DateTime joinedDate;
//   String? endDate;
//   int terminationId;
//   String? subscriptionDate;
//   String? reSubscripedDate;
//   String consumerLoanAct;
//   String loanAct;
//   String hajjAct;
//   String persLoanAct;
//   String? otherAct1;
//   String? otherAct2;
//   String? otherAct3;
//   String? otherAct4;
//   String? otherAct5;
//   String? empStreet1;
//   String? empStreet2;
//   int? cityCode;
//   int? counCode;
//   String? remarks;
//   String userId;
//   String? imageUrl;
//   String? activeDirectoryId;
//   String? mainHrroleId;
//   String employeeLoginId;
//   String employeePassword;
//   String? active;
//   String? deleted;
//   DateTime dateTime;
//   String? deviceId;
//   DateTime uploadDate;
//   String? uploadby;
//   DateTime? syncDate;
//   String? syncby;
//   String? synId;
//   String membership;
//   DateTime membershipJoiningDate;
//   String termination;
//   DateTime? terminationDate;
//   bool isKUEmployee;
//   bool isOnSickLeave;
//   bool isMemberOfFund;
//   int cruP_ID;
//   String? settlementSerMonths;
//   String? settlementAmount;
//   DateTime? nextSetlementPayDate;
//   String? nextSetlementPayAmount;
//   int subscriptionStatus;
//   String? loanOPNotPaidAmount;
//   String? loanOPAmount;
//   String? subOPNotPaidAmount;
//   String? subOPAmount;
//   String? holdQty;
//   String? holdRemarks;
//   DateTime? unHoldDate;
//   String? unHoldBy;
//   bool terminationBanned;
//   bool subFrozen;
//   DateTime? subFrozenDate;
//   String? rejectedBy;
//   DateTime? rejecteddate;
//   DateTime? lastSubRecDate;

//   DetailedEmployeeModel({
//     required this.tenentId,
//     required this.locationId,
//     required this.employeeId,
//     required this.contractType,
//     required this.pfid,
//     required this.subscribedDate,
//     this.agreedSubAmount,
//     this.reSubscribed,
//     this.employeeType,
//     required this.arabicName,
//     required this.englishName,
//     required this.jobTitleCode,
//     required this.jobTitleName,
//     required this.department,
//     required this.departmentName,
//     required this.empGender,
//     required this.empBirthday,
//     required this.empMaritalStatus,
//     this.salary,
//     required this.empWorkTelephone,
//     required this.empWorkEmail,
//     required this.mobileNumber,
//     required this.next2KinName,
//     required this.next2KinMobNumber,
//     required this.nationCode,
//     required this.nationName,
//     required this.empCidNum,
//     required this.empPaciNum,
//     required this.empOtherId,
//     required this.empStatus,
//     required this.joinedDate,
//     this.endDate,
//     required this.terminationId,
//     this.subscriptionDate,
//     this.reSubscripedDate,
//     required this.consumerLoanAct,
//     required this.loanAct,
//     required this.hajjAct,
//     required this.persLoanAct,
//     this.otherAct1,
//     this.otherAct2,
//     this.otherAct3,
//     this.otherAct4,
//     this.otherAct5,
//     this.empStreet1,
//     this.empStreet2,
//     this.cityCode,
//     this.counCode,
//     this.remarks,
//     required this.userId,
//     this.imageUrl,
//     this.activeDirectoryId,
//     this.mainHrroleId,
//     required this.employeeLoginId,
//     required this.employeePassword,
//     this.active,
//     this.deleted,
//     required this.dateTime,
//     this.deviceId,
//     required this.uploadDate,
//     this.uploadby,
//     this.syncDate,
//     this.syncby,
//     this.synId,
//     required this.membership,
//     required this.membershipJoiningDate,
//     required this.termination,
//     this.terminationDate,
//     required this.isKUEmployee,
//     required this.isOnSickLeave,
//     required this.isMemberOfFund,
//     required this.cruP_ID,
//     this.settlementSerMonths,
//     this.settlementAmount,
//     this.nextSetlementPayDate,
//     this.nextSetlementPayAmount,
//     required this.subscriptionStatus,
//     this.loanOPNotPaidAmount,
//     this.loanOPAmount,
//     this.subOPNotPaidAmount,
//     this.subOPAmount,
//     this.holdQty,
//     this.holdRemarks,
//     this.unHoldDate,
//     this.unHoldBy,
//     required this.terminationBanned,
//     required this.subFrozen,
//     this.subFrozenDate,
//     this.rejectedBy,
//     required this.rejecteddate,
//     this.lastSubRecDate,
//   });

//   // Convert JSON to DetailedEmployee object
//   factory DetailedEmployeeModel.fromJson(Map<String, dynamic> json) {
//     return DetailedEmployeeModel(
//       tenentId: json['tenentId'],
//       locationId: json['locationId'],
//       employeeId: json['employeeId'],
//       contractType: json['contractType'],
//       pfid: json['pfid'],
//       subscribedDate: DateTime.parse(json['subscribedDate']),
//       agreedSubAmount: json['agreedSubAmount'],
//       reSubscribed: json['reSubscribed'],
//       employeeType: json['employeeType'],
//       arabicName: json['arabicName'],
//       englishName: json['englishName'],
//       jobTitleCode: json['jobTitleCode'],
//       jobTitleName: json['jobTitleName'],
//       department: json['department'],
//       departmentName: json['departmentName'],
//       empGender: json['empGender'],
//       empBirthday: DateTime.parse(json['empBirthday']),
//       empMaritalStatus: json['empMaritalStatus'],
//       salary: json['salary'],
//       empWorkTelephone: json['empWorkTelephone'],
//       empWorkEmail: json['empWorkEmail'],
//       mobileNumber: json['mobileNumber'],
//       next2KinName: json['next2KinName'],
//       next2KinMobNumber: json['next2KinMobNumber'],
//       nationCode: json['nationCode'],
//       nationName: json['nationName'],
//       empCidNum: json['empCidNum'],
//       empPaciNum: json['empPaciNum'],
//       empOtherId: json['empOtherId'],
//       empStatus: json['empStatus'],
//       joinedDate: DateTime.parse(json['joinedDate']),
//       endDate: json['endDate'],
//       terminationId: json['terminationId'],
//       subscriptionDate: json['subscriptionDate'],
//       reSubscripedDate: json['reSubscripedDate'],
//       consumerLoanAct: json['consumerLoanAct'],
//       loanAct: json['loanAct'],
//       hajjAct: json['hajjAct'],
//       persLoanAct: json['persLoanAct'],
//       otherAct1: json['otherAct1'],
//       otherAct2: json['otherAct2'],
//       otherAct3: json['otherAct3'],
//       otherAct4: json['otherAct4'],
//       otherAct5: json['otherAct5'],
//       empStreet1: json['empStreet1'],
//       empStreet2: json['empStreet2'],
//       cityCode: json['cityCode'],
//       counCode: json['counCode'],
//       remarks: json['remarks'],
//       userId: json['userId'],
//       imageUrl: json['imageUrl'],
//       activeDirectoryId: json['activeDirectoryId'],
//       mainHrroleId: json['mainHrroleId'],
//       employeeLoginId: json['employeeLoginId'],
//       employeePassword: json['employeePassword'],
//       active: json['active'],
//       deleted: json['deleted'],
//       dateTime: DateTime.parse(json['dateTime']),
//       deviceId: json['deviceId'],
//       uploadDate: DateTime.parse(json['uploadDate']),
//       uploadby: json['uploadby'],
//       syncDate: json['syncDate'] != null ? DateTime.parse(json['syncDate']) : null,
//       syncby: json['syncby'],
//       synId: json['synId'],
//       membership: json['membership'],
//       membershipJoiningDate: DateTime.parse(json['membershipJoiningDate']),
//       termination: json['termination'],
//       terminationDate: json['terminationDate'],
//       isKUEmployee: json['isKUEmployee'],
//       isOnSickLeave: json['isOnSickLeave'],
//       isMemberOfFund: json['isMemberOfFund'],
//       cruP_ID: json['cruP_ID'],
//       settlementSerMonths: json['settlementSerMonths'],
//       settlementAmount: json['settlementAmount'],
//       nextSetlementPayDate: json['nextSetlementPayDate'] != null ? DateTime.parse(json['nextSetlementPayDate']) : null,
//       nextSetlementPayAmount: json['nextSetlementPayAmount'],
//       subscriptionStatus: json['subscriptionStatus'],
//       loanOPNotPaidAmount: json['loanOPNotPaidAmount'],
//       loanOPAmount: json['loanOPAmount'],
//       subOPNotPaidAmount: json['subOPNotPaidAmount'],
//       subOPAmount: json['subOPAmount'],
//       holdQty: json['holdQty'],
//       holdRemarks: json['holdRemarks'],
//       unHoldDate: json['unHoldDate'] != null ? DateTime.parse(json['unHoldDate']) : null,
//       unHoldBy: json['unHoldBy'],
//       terminationBanned: json['terminationBanned'],
//       subFrozen: json['subFrozen'],
//       subFrozenDate: json['subFrozenDate'] != null ? DateTime.parse(json['subFrozenDate']) : null,
//       rejectedBy: json['rejectedBy'],
//       rejecteddate: DateTime.parse(json['rejecteddate']),
//       lastSubRecDate: json['lastSubRecDate'] != null ? DateTime.parse(json['lastSubRecDate']) : null,
//     );
//   }
// }


// // parse this response like this
// // var employee = DetailedEmployee.fromJson(jsonResponse['detailedEmployee']);
// mew model
import 'dart:convert';

class DetailedEmployeeModel {
    final int tenentId;
    final int locationId;
    final int employeeId;
    final String contractType;
    final String pfid;
    final DateTime subscribedDate;
    final dynamic agreedSubAmount;
    final dynamic reSubscribed;
    final dynamic employeeType;
    final String arabicName;
    final String englishName;
    final int jobTitleCode;
    final String jobTitleName;
    final int department;
    final String departmentName;
    final int empGender;
    final DateTime empBirthday;
    final String empMaritalStatus;
    final dynamic salary;
    final String empWorkTelephone;
    final String empWorkEmail;
    final String mobileNumber;
    final String next2KinName;
    final String next2KinMobNumber;
    final int nationCode;
    final String nationName;
    final String empCidNum;
    final String empPaciNum;
    final String empOtherId;
    final int empStatus;
    final DateTime joinedDate;
    final dynamic endDate;
    final int terminationId;
    final dynamic subscriptionDate;
    final dynamic reSubscripedDate;
    final String consumerLoanAct;
    final String loanAct;
    final String hajjAct;
    final String persLoanAct;
    final dynamic otherAct1;
    final dynamic otherAct2;
    final dynamic otherAct3;
    final dynamic otherAct4;
    final dynamic otherAct5;
    final dynamic empStreet1;
    final dynamic empStreet2;
    final dynamic cityCode;
    final dynamic counCode;
    final dynamic remarks;
    final String userId;
    final dynamic imageUrl;
    final dynamic activeDirectoryId;
    final dynamic mainHrroleId;
    final String employeeLoginId;
    final String employeePassword;
    final dynamic active;
    final dynamic deleted;
    final DateTime dateTime;
    final dynamic deviceId;
    final DateTime uploadDate;
    final dynamic uploadby;
    final dynamic syncDate;
    final dynamic syncby;
    final dynamic synId;
    final String membership;
    final DateTime membershipJoiningDate;
    final String termination;
    final dynamic terminationDate;
    final bool isKuEmployee;
    final bool isOnSickLeave;
    final bool isMemberOfFund;
    final int cruPId;
    final dynamic settlementSerMonths;
    final dynamic settlementAmount;
    final dynamic nextSetlementPayDate;
    final dynamic nextSetlementPayAmount;
    final int subscriptionStatus;
    final dynamic loanOpNotPaidAmount;
    final dynamic loanOpAmount;
    final dynamic subOpNotPaidAmount;
    final dynamic subOpAmount;
    final dynamic holdQty;
    final dynamic holdRemarks;
    final dynamic unHoldDate;
    final dynamic unHoldBy;
    final bool terminationBanned;
    final bool subFrozen;
    final dynamic subFrozenDate;
    final dynamic rejectedBy;
    final DateTime rejecteddate;
    final dynamic lastSubRecDate;

    DetailedEmployeeModel({
        required this.tenentId,
        required this.locationId,
        required this.employeeId,
        required this.contractType,
        required this.pfid,
        required this.subscribedDate,
        required this.agreedSubAmount,
        required this.reSubscribed,
        required this.employeeType,
        required this.arabicName,
        required this.englishName,
        required this.jobTitleCode,
        required this.jobTitleName,
        required this.department,
        required this.departmentName,
        required this.empGender,
        required this.empBirthday,
        required this.empMaritalStatus,
        required this.salary,
        required this.empWorkTelephone,
        required this.empWorkEmail,
        required this.mobileNumber,
        required this.next2KinName,
        required this.next2KinMobNumber,
        required this.nationCode,
        required this.nationName,
        required this.empCidNum,
        required this.empPaciNum,
        required this.empOtherId,
        required this.empStatus,
        required this.joinedDate,
        required this.endDate,
        required this.terminationId,
        required this.subscriptionDate,
        required this.reSubscripedDate,
        required this.consumerLoanAct,
        required this.loanAct,
        required this.hajjAct,
        required this.persLoanAct,
        required this.otherAct1,
        required this.otherAct2,
        required this.otherAct3,
        required this.otherAct4,
        required this.otherAct5,
        required this.empStreet1,
        required this.empStreet2,
        required this.cityCode,
        required this.counCode,
        required this.remarks,
        required this.userId,
        required this.imageUrl,
        required this.activeDirectoryId,
        required this.mainHrroleId,
        required this.employeeLoginId,
        required this.employeePassword,
        required this.active,
        required this.deleted,
        required this.dateTime,
        required this.deviceId,
        required this.uploadDate,
        required this.uploadby,
        required this.syncDate,
        required this.syncby,
        required this.synId,
        required this.membership,
        required this.membershipJoiningDate,
        required this.termination,
        required this.terminationDate,
        required this.isKuEmployee,
        required this.isOnSickLeave,
        required this.isMemberOfFund,
        required this.cruPId,
        required this.settlementSerMonths,
        required this.settlementAmount,
        required this.nextSetlementPayDate,
        required this.nextSetlementPayAmount,
        required this.subscriptionStatus,
        required this.loanOpNotPaidAmount,
        required this.loanOpAmount,
        required this.subOpNotPaidAmount,
        required this.subOpAmount,
        required this.holdQty,
        required this.holdRemarks,
        required this.unHoldDate,
        required this.unHoldBy,
        required this.terminationBanned,
        required this.subFrozen,
        required this.subFrozenDate,
        required this.rejectedBy,
        required this.rejecteddate,
        required this.lastSubRecDate,
    });

    factory DetailedEmployeeModel.fromJson(String str) => DetailedEmployeeModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DetailedEmployeeModel.fromMap(Map<String, dynamic> json) => DetailedEmployeeModel(
        tenentId: json["tenentId"],
        locationId: json["locationId"],
        employeeId: json["employeeId"],
        contractType: json["contractType"],
        pfid: json["pfid"],
        subscribedDate: DateTime.parse(json["subscribedDate"]),
        agreedSubAmount: json["agreedSubAmount"],
        reSubscribed: json["reSubscribed"],
        employeeType: json["employeeType"],
        arabicName: json["arabicName"],
        englishName: json["englishName"],
        jobTitleCode: json["jobTitleCode"],
        jobTitleName: json["jobTitleName"],
        department: json["department"],
        departmentName: json["departmentName"],
        empGender: json["empGender"],
        empBirthday: DateTime.parse(json["empBirthday"]),
        empMaritalStatus: json["empMaritalStatus"],
        salary: json["salary"],
        empWorkTelephone: json["empWorkTelephone"],
        empWorkEmail: json["empWorkEmail"],
        mobileNumber: json["mobileNumber"],
        next2KinName: json["next2KinName"],
        next2KinMobNumber: json["next2KinMobNumber"],
        nationCode: json["nationCode"],
        nationName: json["nationName"],
        empCidNum: json["empCidNum"],
        empPaciNum: json["empPaciNum"],
        empOtherId: json["empOtherId"],
        empStatus: json["empStatus"],
        joinedDate: DateTime.parse(json["joinedDate"]),
        endDate: json["endDate"],
        terminationId: json["terminationId"],
        subscriptionDate: json["subscriptionDate"],
        reSubscripedDate: json["reSubscripedDate"],
        consumerLoanAct: json["consumerLoanAct"],
        loanAct: json["loanAct"],
        hajjAct: json["hajjAct"],
        persLoanAct: json["persLoanAct"],
        otherAct1: json["otherAct1"],
        otherAct2: json["otherAct2"],
        otherAct3: json["otherAct3"],
        otherAct4: json["otherAct4"],
        otherAct5: json["otherAct5"],
        empStreet1: json["empStreet1"],
        empStreet2: json["empStreet2"],
        cityCode: json["cityCode"],
        counCode: json["counCode"],
        remarks: json["remarks"],
        userId: json["userId"],
        imageUrl: json["imageUrl"],
        activeDirectoryId: json["activeDirectoryId"],
        mainHrroleId: json["mainHrroleId"],
        employeeLoginId: json["employeeLoginId"],
        employeePassword: json["employeePassword"],
        active: json["active"],
        deleted: json["deleted"],
        dateTime: DateTime.parse(json["dateTime"]),
        deviceId: json["deviceId"],
        uploadDate: DateTime.parse(json["uploadDate"]),
        uploadby: json["uploadby"],
        syncDate: json["syncDate"],
        syncby: json["syncby"],
        synId: json["synId"],
        membership: json["membership"],
        membershipJoiningDate: DateTime.parse(json["membershipJoiningDate"]),
        termination: json["termination"],
        terminationDate: json["terminationDate"],
        isKuEmployee: json["isKUEmployee"],
        isOnSickLeave: json["isOnSickLeave"],
        isMemberOfFund: json["isMemberOfFund"],
        cruPId: json["cruP_ID"],
        settlementSerMonths: json["settlementSerMonths"],
        settlementAmount: json["settlementAmount"],
        nextSetlementPayDate: json["nextSetlementPayDate"],
        nextSetlementPayAmount: json["nextSetlementPayAmount"],
        subscriptionStatus: json["subscription_status"],
        loanOpNotPaidAmount: json["loanOPNotPaidAmount"],
        loanOpAmount: json["loanOPAmount"],
        subOpNotPaidAmount: json["subOPNotPaidAmount"],
        subOpAmount: json["subOPAmount"],
        holdQty: json["holdQty"],
        holdRemarks: json["holdRemarks"],
        unHoldDate: json["unHoldDate"],
        unHoldBy: json["unHoldBy"],
        terminationBanned: json["terminationBanned"],
        subFrozen: json["subFrozen"],
        subFrozenDate: json["subFrozenDate"],
        rejectedBy: json["rejectedBy"],
        rejecteddate: DateTime.parse(json["rejecteddate"]),
        lastSubRecDate: json["lastSubRecDate"],
    );

     Map<String, dynamic> toMap() => {
        "TenentID": tenentId,
        "LocationID": locationId,
        "employeeID": employeeId,
        "ContractType": contractType,
        "PFID": pfid,
        "SubscribedDate": subscribedDate.toIso8601String(),
        "AgreedSubAmount": agreedSubAmount,
        "ReSubscribed": reSubscribed,
        "EmployeeType": employeeType,
        "ArabicName": arabicName,
        "EnglishName": englishName,
        "job_title_code": jobTitleCode,
        "job_title_Name": jobTitleName,
        "Department": department,
        "Department_Name": departmentName,
        "emp_gender": empGender,
        "emp_birthday": empBirthday.toIso8601String(),
        "emp_marital_status": empMaritalStatus,
        "salary": salary,
        "emp_work_telephone": empWorkTelephone,
        "emp_work_email": empWorkEmail,
        "MobileNumber": mobileNumber,
        "Next2KinName": next2KinName,
        "Next2KinMobNumber": next2KinMobNumber,
        "nation_code": nationCode,
        "nation_name": nationName,
        "emp_cid_num": empCidNum,
        "emp_paci_num": empPaciNum,
        "emp_other_id": empOtherId,
        "EmpStatus": empStatus,
        "joined_date": joinedDate.toIso8601String(),
        "End_date": endDate,
        "termination_id": terminationId,
        "subscription_date": subscriptionDate,
        "ReSubscriped_date": reSubscripedDate,
        "ConsumerLoanAct": consumerLoanAct,
        "LoanAct": loanAct,
        "HajjAct": hajjAct,
        "PersLoanAct": persLoanAct,
        "OtherAct1": otherAct1,
        "OtherAct2": otherAct2,
        "OtherAct3": otherAct3,
        "OtherAct4": otherAct4,
        "OtherAct5": otherAct5,
        "emp_street1": empStreet1,
        "emp_street2": empStreet2,
        "city_code": cityCode,
        "coun_code": counCode,
        "Remarks": remarks,
        "userID": userId,
        "ImageUrl": imageUrl,
        "ActiveDirectoryID": activeDirectoryId,
        "MainHRRoleID": mainHrroleId,
        "EmployeeLoginID": employeeLoginId,
        "EmployeePassword": employeePassword,
        "Active": active,
        "Deleted": deleted,
        "DateTime": dateTime.toIso8601String(),
        "DeviceID": deviceId,
        "UploadDate": uploadDate.toIso8601String(),
        "Uploadby": uploadby,
        "SyncDate": syncDate,
        "Syncby": syncby,
        "SynID": synId,
        "Membership": membership,
        "MembershipJoiningDate": membershipJoiningDate.toIso8601String(),
        "Termination": termination,
        "TerminationDate": terminationDate,
        "KUEmployee": isKuEmployee,
        "OnSickLeave": isOnSickLeave,
        "MemberOfFund": isMemberOfFund,
        "CRUP_ID": cruPId,
        "SettlementSerMonths": settlementSerMonths,
        "SettlementAmount": settlementAmount,
        "NextSetlementPayDate": nextSetlementPayDate,
        "NextSetlementPayAmount": nextSetlementPayAmount,
        "Subscription_status": subscriptionStatus,
        "LoanOPNotPaidAmount": loanOpNotPaidAmount,
        "LoanOPAmount": loanOpAmount,
        "SubOPNotPaidAmount": subOpNotPaidAmount,
        "SubOPAmount": subOpAmount,
        "HoldQty": holdQty,
        "HoldRemarks": holdRemarks,
        "UnHoldDate": unHoldDate,
        "UnHoldBy": unHoldBy,
        "TerminationBanned": terminationBanned,
        "SubFrozen": subFrozen,
        "SubFrozenDate": subFrozenDate,
        "RejectedBy": rejectedBy,
        "Rejecteddate": rejecteddate.toIso8601String(),
        "LastSubRecDate": lastSubRecDate,
    };
}
