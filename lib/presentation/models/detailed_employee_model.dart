import 'dart:convert';

class DetailedEmployeeModel {
     dynamic tenentId;
  dynamic locationId;
   dynamic employeeId;
    dynamic contractType;
  dynamic pfid;
    dynamic subscribedDate;
    dynamic agreedSubAmount;
    dynamic reSubscribed;
    dynamic employeeType;
    dynamic arabicName;
     dynamic englishName;
   dynamic jobTitleCode;
    dynamic jobTitleName;
   dynamic department;
    dynamic departmentName;
    dynamic empGender;
    dynamic empBirthday;
    dynamic empMaritalStatus;
     dynamic salary;
    dynamic empWorkTelephone;
    dynamic empWorkEmail;
    dynamic mobileNumber;
    dynamic next2KinName;
    dynamic next2KinMobNumber;
    dynamic nationCode;
    dynamic nationName;
    dynamic empCidNum;
    dynamic empPaciNum;
    dynamic empOtherId;
    dynamic empStatus;
    dynamic joinedDate;
     dynamic endDate;
    dynamic terminationId;
    final dynamic subscriptionDate;
    final dynamic reSubscripedDate;
    dynamic consumerLoanAct;
    dynamic loanAct;
    dynamic hajjAct;
    dynamic persLoanAct;
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
    dynamic userId;
    final dynamic imageUrl;
    final dynamic activeDirectoryId;
    final dynamic mainHrroleId;
    dynamic employeeLoginId;
    dynamic employeePassword;
    final dynamic active;
    final dynamic deleted;
    dynamic dateTime;
    final dynamic deviceId;
    dynamic uploadDate;
    final dynamic uploadby;
    final dynamic syncDate;
    final dynamic syncby;
    final dynamic synId;
    dynamic membership;
    dynamic membershipJoiningDate;
    dynamic termination;
    final dynamic terminationDate;
    dynamic isKuEmployee;
    dynamic isOnSickLeave;
    dynamic isMemberOfFund;
    dynamic cruPId;
    final dynamic settlementSerMonths;
    final dynamic settlementAmount;
    final dynamic nextSetlementPayDate;
    final dynamic nextSetlementPayAmount;
    dynamic subscriptionStatus;
    final dynamic loanOpNotPaidAmount;
    final dynamic loanOpAmount;
    final dynamic subOpNotPaidAmount;
    final dynamic subOpAmount;
    final dynamic holdQty;
    final dynamic holdRemarks;
    final dynamic unHoldDate;
    final dynamic unHoldBy;
    dynamic terminationBanned;
    dynamic subFrozen;
    final dynamic subFrozenDate;
    final dynamic rejectedBy;
    dynamic rejecteddate;
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
        tenentId: json["tenentId"]??0,
        locationId: json["locationId"]??0,
        employeeId: json["employeeId"]??0,
        contractType: json["contractType"]??0,
        pfid: json["pfid"]??0,
        subscribedDate: json["subscribedDate"] != null 
    ? DateTime.parse(json["subscribedDate"]) 
    : null,
        agreedSubAmount: json["agreedSubAmount"]??"",
        reSubscribed: json["reSubscribed"]??"",
        employeeType: json["employeeType"]??"",
        arabicName: json["arabicName"]??"",
        englishName: json["englishName"]??"",
        jobTitleCode: json["jobTitleCode"]??"",
        jobTitleName: json["jobTitleName"]??"",
        department: json["department"]??"",
        departmentName: json["departmentName"]??"",
        empGender: json["empGender"]??"",
        empBirthday:json["empBirthday"] != null 
    ? DateTime.parse(json["empBirthday"]) 
    : null,
        empMaritalStatus: json["empMaritalStatus"]??"",
        salary: json["salary"],
        empWorkTelephone: json["empWorkTelephone"]??"",
        empWorkEmail: json["empWorkEmail"]??"",
        mobileNumber: json["mobileNumber"]??"",
        next2KinName: json["next2KinName"]??"",
        next2KinMobNumber: json["next2KinMobNumber"]??"",
        nationCode: json["nationCode"]??"",
        nationName: json["nationName"]??"",
        empCidNum: json["empCidNum"]??"",
        empPaciNum: json["empPaciNum"]??"",
        empOtherId: json["empOtherId"]??"",
        empStatus: json["empStatus"]??"",
        joinedDate:json["joinedDate"] != null 
    ? DateTime.parse(json["joinedDate"]) 
    : null,
        endDate: json["endDate"]??"",
        terminationId: json["terminationId"]??"",
        subscriptionDate: json["subscriptionDate"]??"",
        reSubscripedDate: json["reSubscripedDate"]??"",
        consumerLoanAct: json["consumerLoanAct"]??"",
        loanAct: json["loanAct"]??"",
        hajjAct: json["hajjAct"]??"",
        persLoanAct: json["persLoanAct"]??"",
        otherAct1: json["otherAct1"]??"",
        otherAct2: json["otherAct2"]??"",
        otherAct3: json["otherAct3"]??"",
        otherAct4: json["otherAct4"]??"",
        otherAct5: json["otherAct5"]??"",
        empStreet1: json["empStreet1"]??"",
        empStreet2: json["empStreet2"]??"",
        cityCode: json["cityCode"]??"",
        counCode: json["counCode"]??"",
        remarks: json["remarks"]??"",
        userId: json["userId"]??"",
        imageUrl: json["imageUrl"]??"",
        activeDirectoryId: json["activeDirectoryId"]??"",
        mainHrroleId: json["mainHrroleId"],
        employeeLoginId: json["employeeLoginId"],
        employeePassword: json["employeePassword"],
        active: json["active"],
        deleted: json["deleted"],
        dateTime:json["dateTime"] != null 
    ? DateTime.parse(json["dateTime"]) 
    : null,
        deviceId: json["deviceId"],
        uploadDate:json["uploadDate"] != null 
    ? DateTime.parse(json["uploadDate"]) 
    : null,
        uploadby: json["uploadby"],
        syncDate: json["syncDate"],
        syncby: json["syncby"],
        synId: json["synId"],
        membership: json["membership"],
        membershipJoiningDate: json["membershipJoiningDate"] != null 
    ? DateTime.parse(json["membershipJoiningDate"]) 
    : null,
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
        rejecteddate: json["rejecteddate"] != null 
    ? DateTime.parse(json["rejecteddate"]) 
    : null,
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
        "empWorkEmail": empWorkEmail,
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
