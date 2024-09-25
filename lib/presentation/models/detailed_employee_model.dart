


class DetailedEmployeeModel {
    int? employeeId;
    String? englishName;
    String? arabicName;
    String? empBirthday;
    int? empGender;
    int? empMaritalStatus;
    String? mobileNumber;

    String? empWorkTelephone;
    String? empWorkEmail;
    dynamic next2KinName;
    dynamic next2KinMobNumber;
    bool? isKuEmployee;
    bool? isOnSickLeave;
    bool? isMemberOfFund;
    dynamic subFrozenDate;
    bool? terminationBanned;
    int? nationCode;
    String? nationName;
    String? joinedDate;
    int? locationId;
    dynamic holdQty;
    dynamic holdRemarks;
    dynamic unHoldDate;
    dynamic unHoldBy;
    int? department;
    dynamic departmentName;
    int? salary;
    String? empCidNum;
    String? empPaciNum;
    String? empOtherId;
    int? contractType;
    String? jobTitleName;
    int? jobTitleCode;
    String? membership;
    String? membershipJoiningDate;
    String? termination;
    int? terminationId;
    String? terminationDate;
    int? subscriptionStatus;
    dynamic rejectedBy;
    String? rejectedDate;
    String? hajjAct;
    // String? lblHajjActNameInEnglish;
    // String? lblHajjActNameInArabic;
    String? loanAct;
    // String? lblloanActNameInEnglish;
    // String? lblloanActNameInArabic;
    String? persLoanAct;
    // String? lblPersLoanActNameInEnglish;
    // String? lblPersLoanNameInArabic;
    String? consumerLoanAct;
    // String? lblConsumerLoanActNameInEnglish;
    // String? lblConsumerLoanNameInArabic;
    dynamic otherAct1;
    // String? lblOtherAct1NameInEnglish;
    // String? lblOtherAct1NameInArabic;
    dynamic otherAct2;
    // String? lblOtherAct2NameInEnglish;
    // String? lblOtherAct2NameInArabic;
    dynamic otherAct3;
    // String? lblOtherAct3NameInEnglish;
    // String? lblOtherAct3NameInArabic;
    dynamic otherAct4;
    // String? lblOtherAct4NameInEnglish;
    // String? lblOtherAct4NameInArabic;
    String? otherAct5;
    // String? lblOtherAct5NameInEnglish;
    // String? lblOtherAct5NameInArabic;
    dynamic loanOpNotPaidAmount;
    dynamic loanOpAmount;
    dynamic subOpNotPaidAmount;
    dynamic subOpAmount;
    int? tenentId;
    String? username;
    int? userId;

    DetailedEmployeeModel({this.employeeId, this.englishName, this.arabicName, 
    this.empBirthday, this.empGender, this.empMaritalStatus, 
    this.mobileNumber, this.empWorkTelephone, this.empWorkEmail,
     this.next2KinName, this.next2KinMobNumber, this.isKuEmployee,
      this.isOnSickLeave, this.isMemberOfFund, this.subFrozenDate,
       this.terminationBanned, this.nationCode, this.nationName, 
       this.joinedDate, this.locationId, this.holdQty, this.holdRemarks,
        this.unHoldDate, this.unHoldBy, this.department, this.departmentName,
         this.salary, this.empCidNum, this.empPaciNum, this.empOtherId,
          this.contractType, this.jobTitleName, this.jobTitleCode, 
          this.membership, this.membershipJoiningDate, this.termination, 
          this.terminationId, this.terminationDate, this.subscriptionStatus,
           this.rejectedBy, this.rejectedDate, this.hajjAct,
           
             
             
              this.otherAct1, 
               this.otherAct2,
              
                  this.otherAct3, 
                
                  this.otherAct4, 
                   
                  this.otherAct5, 
                
                    this.loanOpNotPaidAmount,
                     this.loanOpAmount, this.subOpNotPaidAmount, this.subOpAmount, this.tenentId, this.username, this.userId});

    DetailedEmployeeModel.fromJson(Map<String, dynamic> json) {
        if(json["employeeId"] is int) {
            employeeId = json["employeeId"];
        }
        if(json["englishName"] is String) {
            englishName = json["englishName"];
        }
        if(json["arabicName"] is String) {
            arabicName = json["arabicName"];
        }
        if(json["empBirthday"] is String) {
            empBirthday = json["empBirthday"];
        }
        if(json["empGender"] is int) {
            empGender = json["empGender"];
        }
        if(json["empMaritalStatus"] is int) {
            empMaritalStatus = json["empMaritalStatus"];
        }
        if(json["mobileNumber"] is String) {
            mobileNumber = json["mobileNumber"];
        }
        if(json["empWorkTelephone"] is String) {
            empWorkTelephone = json["empWorkTelephone"];
        }
        if(json["empWorkEmail"] is String) {
            empWorkEmail = json["empWorkEmail"];
        }
        next2KinName = json["next2KinName"];
        next2KinMobNumber = json["next2KinMobNumber"];
        if(json["isKUEmployee"] is bool) {
            isKuEmployee = json["isKUEmployee"];
        }
        if(json["isOnSickLeave"] is bool) {
            isOnSickLeave = json["isOnSickLeave"];
        }
        if(json["isMemberOfFund"] is bool) {
            isMemberOfFund = json["isMemberOfFund"];
        }
        subFrozenDate = json["subFrozenDate"];
        if(json["terminationBanned"] is bool) {
            terminationBanned = json["terminationBanned"];
        }
        if(json["nationCode"] is int) {
            nationCode = json["nationCode"];
        }
        if(json["nationName"] is String) {
            nationName = json["nationName"];
        }
        if(json["joinedDate"] is String) {
            joinedDate = json["joinedDate"];
        }
        if(json["locationId"] is int) {
            locationId = json["locationId"];
        }
        holdQty = json["holdQty"];
        holdRemarks = json["holdRemarks"];
        unHoldDate = json["unHoldDate"];
        unHoldBy = json["unHoldBy"];
        if(json["department"] is int) {
            department = json["department"];
        }
        departmentName = json["departmentName"];
        if(json["salary"] is int) {
            salary = json["salary"];
        }
        if(json["empCidNum"] is String) {
            empCidNum = json["empCidNum"];
        }
        if(json["empPaciNum"] is String) {
            empPaciNum = json["empPaciNum"];
        }
        if(json["empOtherId"] is String) {
            empOtherId = json["empOtherId"];
        }
        if(json["contractType"] is int) {
            contractType = json["contractType"];
        }
        if(json["jobTitleName"] is String) {
            jobTitleName = json["jobTitleName"];
        }
        if(json["jobTitleCode"] is int) {
            jobTitleCode = json["jobTitleCode"];
        }
        if(json["membership"] is String) {
            membership = json["membership"];
        }
        if(json["membershipJoiningDate"] is String) {
            membershipJoiningDate = json["membershipJoiningDate"];
        }
        if(json["termination"] is String) {
            termination = json["termination"];
        }
        if(json["terminationId"] is int) {
            terminationId = json["terminationId"];
        }
        if(json["terminationDate"] is String) {
            terminationDate = json["terminationDate"];
        }
        if(json["subscription_status"] is int) {
            subscriptionStatus = json["subscription_status"];
        }
        rejectedBy = json["RejectedBy"];
        if(json["RejectedDate"] is String) {
            rejectedDate = json["RejectedDate"];
        }
        if(json["hajjAct"] is String) {
            hajjAct = json["hajjAct"];
        }
        // if(json["lblHajjActNameInEnglish"] is String) {
        //     lblHajjActNameInEnglish = json["lblHajjActNameInEnglish"];
        // }
        // if(json["lblHajjActNameInArabic"] is String) {
        //     lblHajjActNameInArabic = json["lblHajjActNameInArabic"];
        // }
        if(json["loanAct"] is String) {
            loanAct = json["loanAct"];
        }
        // if(json["lblloanActNameInEnglish"] is String) {
        //     lblloanActNameInEnglish = json["lblloanActNameInEnglish"];
        // }
        // if(json["lblloanActNameInArabic"] is String) {
        //     lblloanActNameInArabic = json["lblloanActNameInArabic"];
        // }
        if(json["persLoanAct"] is String) {
            persLoanAct = json["persLoanAct"];
        }
        // if(json["lblPersLoanActNameInEnglish"] is String) {
        //     lblPersLoanActNameInEnglish = json["lblPersLoanActNameInEnglish"];
        // }
        // if(json["lblPersLoanNameInArabic"] is String) {
        //     lblPersLoanNameInArabic = json["lblPersLoanNameInArabic"];
        // }
        if(json["consumerLoanAct"] is String) {
            consumerLoanAct = json["consumerLoanAct"];
        }
        // if(json["lblConsumerLoanActNameInEnglish"] is String) {
        //     lblConsumerLoanActNameInEnglish = json["lblConsumerLoanActNameInEnglish"];
        // }
        // if(json["lblConsumerLoanNameInArabic"] is String) {
        //     lblConsumerLoanNameInArabic = json["lblConsumerLoanNameInArabic"];
        // }
        otherAct1 = json["otherAct1"];
        // if(json["lblOtherAct1NameInEnglish"] is String) {
        //     lblOtherAct1NameInEnglish = json["lblOtherAct1NameInEnglish"];
        // }
        // if(json["lblOtherAct1NameInArabic"] is String) {
        //     lblOtherAct1NameInArabic = json["lblOtherAct1NameInArabic"];
        // }
        otherAct2 = json["otherAct2"];
        // if(json["lblOtherAct2NameInEnglish"] is String) {
        //     lblOtherAct2NameInEnglish = json["lblOtherAct2NameInEnglish"];
        // }
        // if(json["lblOtherAct2NameInArabic"] is String) {
        //     lblOtherAct2NameInArabic = json["lblOtherAct2NameInArabic"];
        // }
        otherAct3 = json["otherAct3"];
        // if(json["lblOtherAct3NameInEnglish"] is String) {
        //     lblOtherAct3NameInEnglish = json["lblOtherAct3NameInEnglish"];
        // }
        // if(json["lblOtherAct3NameInArabic"] is String) {
        //     lblOtherAct3NameInArabic = json["lblOtherAct3NameInArabic"];
        // }
        otherAct4 = json["otherAct4"];
        // if(json["lblOtherAct4NameInEnglish"] is String) {
        //     lblOtherAct4NameInEnglish = json["lblOtherAct4NameInEnglish"];
        // }
        // if(json["lblOtherAct4NameInArabic"] is String) {
        //     lblOtherAct4NameInArabic = json["lblOtherAct4NameInArabic"];
        // }
        if(json["otherAct5"] is String) {
            otherAct5 = json["otherAct5"];
        }
        // if(json["lblOtherAct5NameInEnglish"] is String) {
        //     lblOtherAct5NameInEnglish = json["lblOtherAct5NameInEnglish"];
        // }
        // if(json["lblOtherAct5NameInArabic"] is String) {
        //     lblOtherAct5NameInArabic = json["lblOtherAct5NameInArabic"];
        // }
        loanOpNotPaidAmount = json["loanOPNotPaidAmount"];
        loanOpAmount = json["loanOPAmount"];
        subOpNotPaidAmount = json["subOPNotPaidAmount"];
        subOpAmount = json["subOPAmount"];
        if(json["tenentId"] is int) {
            tenentId = json["tenentId"];
        }
        if(json["username"] is String) {
            username = json["username"];
        }
        if(json["userId"] is int) {
            userId = json["userId"];
        }
    }

    Map<String, dynamic> toMap() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["employeeId"] = employeeId;
        _data["englishName"] = englishName;
        _data["arabicName"] = arabicName;
        _data["emp_birthday"] = empBirthday;
        _data["emp_gender"] = empGender;
        _data["emp_marital_status"] = empMaritalStatus;
        _data["MobileNumber"] = mobileNumber;
        _data["emp_work_telephone"] = empWorkTelephone;
        _data["emp_work_email"] = empWorkEmail;
        _data["next2KinName"] = next2KinName;
        _data["next2KinMobNumber"] = next2KinMobNumber;
        _data["isKUEmployee"] = isKuEmployee;
        _data["isOnSickLeave"] = isOnSickLeave;
        _data["isMemberOfFund"] = isMemberOfFund;
        _data["subFrozenDate"] = subFrozenDate;
        _data["terminationBanned"] = terminationBanned;
        _data["nation_code"] = nationCode;
        _data["nation_Name"] = nationName;
        _data["joined_date"] = joinedDate;
        _data["LocationID"] = locationId;
        _data["holdQty"] = holdQty;
        _data["holdRemarks"] = holdRemarks;
        _data["unHoldDate"] = unHoldDate;
        _data["unHoldBy"] = unHoldBy;
        _data["Department"] = department;
        _data["Department_Name"] = departmentName;
        _data["salary"] = salary;
        _data["emp_cid_num"] = empCidNum;
        _data["emp_paci_num"] = empPaciNum;
        _data["emp_other_id"] = empOtherId;
        _data["contractType"] = contractType;
        _data["job_title_Name"] = jobTitleName;
        _data["job_title_code"] = jobTitleCode;
        _data["Membership"] = membership;
        _data["MembershipJoiningDate"] = membershipJoiningDate;
        _data["Termination"] = termination;
        _data["termination_id"] = terminationId;
        _data["TerminationDate"] = terminationDate;
        _data["Subscription_status"] = subscriptionStatus;
        _data["RejectedBy"] = rejectedBy;
        _data["Rejecteddate"] = rejectedDate;
        _data["HajjAct"] = hajjAct;
        // _data["lblHajjActNameInEnglish"] = lblHajjActNameInEnglish;
        // _data["lblHajjActNameInArabic"] = lblHajjActNameInArabic;
        _data["LoanAct"] = loanAct;
        // _data["lblloanActNameInEnglish"] = lblloanActNameInEnglish;
        // _data["lblloanActNameInArabic"] = lblloanActNameInArabic;
        _data["persLoanAct"] = persLoanAct;
        // _data["lblPersLoanActNameInEnglish"] = lblPersLoanActNameInEnglish;
        // _data["lblPersLoanNameInArabic"] = lblPersLoanNameInArabic;
        _data["ConsumerLoanAct"] = consumerLoanAct;
        // _data["lblConsumerLoanActNameInEnglish"] = lblConsumerLoanActNameInEnglish;
        // _data["lblConsumerLoanNameInArabic"] = lblConsumerLoanNameInArabic;
        _data["OtherAct1"] = otherAct1;
        // _data["lblOtherAct1NameInEnglish"] = lblOtherAct1NameInEnglish;
        // _data["lblOtherAct1NameInArabic"] = lblOtherAct1NameInArabic;
        _data["OtherAct2"] = otherAct2;
        // _data["lblOtherAct2NameInEnglish"] = lblOtherAct2NameInEnglish;
        // _data["lblOtherAct2NameInArabic"] = lblOtherAct2NameInArabic;
        _data["OtherAct3"] = otherAct3;
        // _data["lblOtherAct3NameInEnglish"] = lblOtherAct3NameInEnglish;
        // _data["lblOtherAct3NameInArabic"] = lblOtherAct3NameInArabic;
        _data["OtherAct4"] = otherAct4;
        // _data["lblOtherAct4NameInEnglish"] = lblOtherAct4NameInEnglish;
        // _data["lblOtherAct4NameInArabic"] = lblOtherAct4NameInArabic;
        _data["OtherAct5"] = otherAct5;
        // _data["lblOtherAct5NameInEnglish"] = lblOtherAct5NameInEnglish;
        // _data["lblOtherAct5NameInArabic"] = lblOtherAct5NameInArabic;
        _data["LoanOPNotPaidAmount"] = loanOpNotPaidAmount;
        _data["LoanOPAmount"] = loanOpAmount;
        _data["SubOPNotPaidAmount"] = subOpNotPaidAmount;
        _data["SubOPAmount"] = subOpAmount;
        _data["TenentID"] = tenentId;
        // _data["username"] = username;
        _data["userID"] = userId;
        return _data;
    }
}

// class DetailedEmployeeModel {
//   final int tenentID;
//   final int locationID;
//   final int employeeId;
//   final String? contractType;
//   final String? pfID;
//   final String? subscribedDate;
//   final String? agreedSubAmount;
//   final String? reSubscribed;
//   final String employeeType;
//   String? arabicName;
//   String? englishName;
//   final int? jobTitleCode;
//   final String? jobTitleName;
//   final String token;
//   int? department;
//   String? departmentName;
//   int? empGender;
//   dynamic empBirthday;
//   int? empMaritalStatus;
//   int? salary;
//   String empWorkTelephone;
//   String empWorkEmail;
//   String? mobileNumber;
//   String? next2KinName;
//   String? next2KinMobNumber;
//   final int? nationCode;
//   final String? nationName;
//   final String cidNumber;
//   String empPaciNum;
//   String empOtherId;
//   final int subscriptionStatus;
//   final int? employeeStatus;
//   final String? joinedDate;
//   final String? endDate;
//   final int? terminationID;
//   final String? subscriptionDate;
//   final String? reSubscriptionDate;
//   final String? loanAct;
//   final String? hajjAct;
//   final String? persLoanAct;
//   final String? consumerLoanAct;
//   final String? otherAct1;
//   final String? otherAct2;
//   final String? otherAct3;
//   final String? otherAct4;
//   final String? otherAct5;
//   final String? membership;
//   final String? membershipJoiningDate;
//   final String? termination;
//   final String? terminationDate;
//   final String? employeeStreet1;
//   final String? employeeStreet2;
//   final String? cityCode;
//   final int? countryCode;
//   final String? remarks;
//   final String? userID;
//   final String? activeDirectoryID;
//   final int? mainHRRoleID;
//   final String? employeeLoginID;
//   final String? employeePassword;
//   final bool? active;
//   final bool? deleted;
//   final String? dateTime;
//   String? deviceID;
//   String? refName1;
//   String? refName2;
//   final String? uploadDate;
//   String? uploadBy;
//   final String? syncDate;
//   final String? syncBy;
//   final int? synID;

//   DetailedEmployeeModel({
//     required this.tenentID,
//     required this.locationID,
//     required this.employeeId,
//     this.contractType,
//     this.pfID,
//     this.subscribedDate,
//     this.agreedSubAmount,
//     this.reSubscribed,
//     required this.token,
//     required this.employeeType,
//     this.arabicName,
//     this.englishName,
//     this.jobTitleCode,
//     this.jobTitleName,
//     this.department,
//     this.departmentName,
//     this.empGender,
//     this.empBirthday,
//     this.empMaritalStatus,
//     this.salary,
//     required this.empWorkTelephone,
//     required this.empWorkEmail,
//     this.mobileNumber,
//     this.next2KinName,
//     this.next2KinMobNumber,
//     this.nationCode,
//     this.nationName,
//     required this.cidNumber,
//     required this.empPaciNum,
//     required this.empOtherId,
//     required this.subscriptionStatus,
//     this.employeeStatus,
//     this.joinedDate,
//     this.endDate,
//     this.terminationID,
//     this.subscriptionDate,
//     this.reSubscriptionDate,
//     this.loanAct,
//     this.hajjAct,
//     this.persLoanAct,
//     this.consumerLoanAct,
//     this.otherAct1,
//     this.otherAct2,
//     this.otherAct3,
//     this.otherAct4,
//     this.otherAct5,
//     this.membership,
//     this.membershipJoiningDate,
//     this.termination,
//     this.terminationDate,
//     required this.employeeStreet1,
//     required this.employeeStreet2,
//     required this.cityCode,
//     required this.countryCode,
//     this.remarks,
//     this.userID,
//     this.activeDirectoryID,
//     this.mainHRRoleID,
//     this.employeeLoginID,
//     this.employeePassword,
//     this.active,
//     this.deleted,
//     this.dateTime,
//     required this.deviceID,
//     this.uploadDate,
//     this.uploadBy,
//     this.syncDate,
//     this.syncBy,
//     this.synID,
//     this.refName1,
//     this.refName2,
//   });

//   factory DetailedEmployeeModel.fromMap(Map<String, dynamic> map) =>
//       DetailedEmployeeModel(
//         tenentID: map[Constants.tenentID],
//         locationID: map[Constants.deLocationID],
//         employeeId: map[Constants.employeeID],
//         contractType: map[Constants.contractType],
//         pfID: map[Constants.pfID],
//         token: map[Constants.token] ?? "",
//         subscribedDate: DateFormat().format(map[Constants.subscribedDate]),
//         agreedSubAmount: map[Constants.agreedSubAmount],
//         reSubscribed: DateFormat().format(map[Constants.reSubscribed]),
//         employeeType: map[Constants.employeeType],
//         arabicName: map[Constants.arabicName],
//         englishName: map[Constants.englishName],
//         jobTitleCode: map[Constants.jobTitleCode],
//         jobTitleName: map[Constants.jobTitleName],
//         department: map[Constants.department],
//         departmentName: map[Constants.departmentName],
//         empGender: map[Constants.employeeGender],
//         empBirthday: map[Constants.employeeBirthday],
//         empMaritalStatus: map[Constants.empMaritalStatus],
//         salary: map[Constants.salary],
//         empWorkTelephone: map[Constants.empWorkTelephone],
//         empWorkEmail: map[Constants.empWorkEmail],
//         mobileNumber: map[Constants.mobileNumber],
//         next2KinName: map[Constants.next2KinName],
//         next2KinMobNumber: map[Constants.next2KinMobNumber],
//         nationCode: map[Constants.nationCode],
//         nationName: map[Constants.nationName],
//         cidNumber: map[Constants.empCIDNum],
//         empPaciNum: map[Constants.empPaciNum],
//         empOtherId: map[Constants.empOtherID],
//         subscriptionStatus: map[Constants.subscriptionStatus],
//         employeeStatus: map[Constants.empStatus],
//         joinedDate: DateFormat().format(map[Constants.joinedDate]),
//         endDate: DateFormat().format(map[Constants.endDate]),
//         terminationID: map[Constants.terminationID],
//         subscriptionDate: DateFormat().format(map[Constants.subscriptionDate]),
//         reSubscriptionDate: DateFormat().format(map[Constants.reSubscriptionDate]),
//         loanAct: map[Constants.loanAct],
//         hajjAct: map[Constants.hajjAct],
//         persLoanAct: map[Constants.persLoanAct],
//         consumerLoanAct: map[Constants.consumerLoanAct],
//         otherAct1: map[Constants.otherAct1],
//         otherAct2: map[Constants.otherAct2],
//         otherAct3: map[Constants.otherAct3],
//         otherAct4: map[Constants.otherAct4],
//         otherAct5: map[Constants.otherAct5],
//         membership: map[Constants.membership],
//         membershipJoiningDate: DateFormat().format(map[Constants.membershipJoiningDate]),
//         termination: map[Constants.termination],
//         terminationDate: DateFormat().format(map[Constants.terminationDate]),
//         employeeStreet1: map[Constants.empStreet1],
//         employeeStreet2: map[Constants.empStreet2],
//         cityCode: map[Constants.cityCode],
//         countryCode: map[Constants.countryCode],
//         remarks: map[Constants.remarks],
//         userID: map[Constants.empUserID],
//         activeDirectoryID: map[Constants.activeDirectoryID],
//         mainHRRoleID: map[Constants.mainHRRoleID],
//         employeeLoginID: map[Constants.employeeLoginID],
//         employeePassword: map[Constants.employeePassword],
//         active: map[Constants.active],
//         deleted: map[Constants.deleted],
//         dateTime: DateFormat().format(map[Constants.dateTime]),
//         deviceID: map[Constants.deviceID],
//         uploadDate: DateFormat().format(map[Constants.uploadDate]),
//         uploadBy: map[Constants.uploadBY],
//         syncDate: DateFormat().format(map[Constants.syncDate]),
//         syncBy: map[Constants.syncBY],
//         synID: map[Constants.synID],
//       );

//   Map<String, dynamic> toMap() => {
//     Constants.tenentID: tenentID,
//     Constants.deLocationID: locationID,
//     Constants.employeeID: employeeId,
//     Constants.contractType: contractType,
//     Constants.pfID: pfID,
//     Constants.token : token,
//     Constants.subscribedDate: DateTime.parse(subscribedDate!),
//     Constants.agreedSubAmount: agreedSubAmount,
//     Constants.reSubscribed: DateTime.parse(reSubscribed!),
//     Constants.employeeType: employeeType,
//     Constants.arabicName: arabicName,
//     Constants.englishName: englishName,
//     Constants.jobTitleCode: jobTitleCode,
//     Constants.jobTitleName: jobTitleName,
//     Constants.department: department,
//     Constants.departmentName: departmentName,
//     Constants.employeeGender: empGender,
//     Constants.employeeBirthday: empBirthday,
//     Constants.empMaritalStatus: empMaritalStatus,
//     Constants.salary: salary,
//     Constants.empWorkTelephone: empWorkTelephone,
//     Constants.empWorkEmail: empWorkEmail,
//     Constants.mobileNumber: mobileNumber,
//     Constants.next2KinName: next2KinName,
//     Constants.next2KinMobNumber: next2KinMobNumber,
//     Constants.nationCode: nationCode,
//     Constants.nationName: nationName,
//     Constants.empCIDNum: cidNumber,
//     Constants.empPaciNum: empPaciNum,
//     Constants.empOtherID: empOtherId,
//     Constants.subscriptionStatus: subscriptionStatus,
//     Constants.empStatus: employeeStatus,
//     Constants.joinedDate: DateTime.parse(joinedDate!),
//     Constants.endDate: DateTime.parse(endDate!),
//     Constants.terminationID: terminationID,
//     Constants.subscriptionDate: DateTime.parse(subscriptionDate!),
//     Constants.reSubscriptionDate: DateTime.parse(reSubscriptionDate!),
//     Constants.loanAct: loanAct,
//     Constants.hajjAct: hajjAct,
//     Constants.persLoanAct: persLoanAct,
//     Constants.consumerLoanAct: consumerLoanAct,
//     Constants.otherAct1: otherAct1,
//     Constants.otherAct2: otherAct2,
//     Constants.otherAct3: otherAct3,
//     Constants.otherAct4: otherAct4,
//     Constants.otherAct5: otherAct5,
//     Constants.membership: membership,
//     Constants.membershipJoiningDate: DateTime.parse(membershipJoiningDate!),
//     Constants.termination: termination,
//     Constants.terminationDate: DateTime.parse(terminationDate!),
//     Constants.empStreet1: employeeStreet1,
//     Constants.empStreet2: employeeStreet2,
//     Constants.cityCode: cityCode,
//     Constants.countryCode: countryCode,
//     Constants.remarks: remarks,
//     Constants.empUserID: userID,
//     Constants.activeDirectoryID: activeDirectoryID,
//     Constants.mainHRRoleID: mainHRRoleID,
//     Constants.employeeLoginID: employeeLoginID,
//     Constants.employeePassword: employeePassword,
//     Constants.active: active,
//     Constants.deleted: deleted,
//     Constants.dateTime: DateTime.parse(dateTime!),
//     Constants.deviceID: deviceID,
//     Constants.uploadDate: DateTime.parse(uploadDate!),
//     Constants.uploadBY: uploadBy,
//     Constants.syncDate: DateTime.parse(syncDate!),
//     Constants.syncBY: syncBy,
//     Constants.synID: synID,
//   };

//   factory DetailedEmployeeModel.fromJson(Map<String, dynamic> json) => DetailedEmployeeModel(
//     tenentID: json["tenentId"],
//     locationID: json["locationId"],
//     employeeId: json["employeeId"],
//     contractType: json["contractType"],
//     pfID: json["pfid"],
//     token: json['token'] ?? "",
//     subscribedDate: json["subscribedDate"],
//     agreedSubAmount: json["agreedSubAmount"].toString(),
//     reSubscribed: json["reSubscribed"],
//     employeeType: json["employeeType"] ??"",
//     arabicName: json["arabicName"],
//     englishName: json["englishName"],
//     jobTitleCode: json["jobTitleCode"],
//     jobTitleName: json["jobTitleName"],
//     department: json["department"],
//     departmentName: json["departmentName"],
//     empGender: json["empGender"],
//     empBirthday: json["empBirthday"],
//     empMaritalStatus: json["empMaritalStatus"] == "Single" || json["empMaritalStatus"] == "1" ? 1 : 0,
//     salary: json["salary"] == null ? 0 : int.tryParse(double.parse(json["salary"].toString()).toStringAsFixed(0)),
//     empWorkTelephone: json["empWorkTelephone"],
//     empWorkEmail: json["empWorkEmail"],
//     mobileNumber: json["mobileNumber"],
//     next2KinName: json["next2KinName"],
//     next2KinMobNumber: json["next2KinMobNumber"],
//     nationCode: json["nationCode"],
//     nationName: json["nationName"],
//     cidNumber: json["empCidNum"],
//     empPaciNum: json["empPaciNum"],
//     empOtherId: json["empOtherId"],
//     employeeStatus: json["empStatus"],
//     joinedDate: json["joinedDate"],
//     endDate: json["endDate"],
//     terminationID: json["terminationId"],
//     subscriptionDate: json["subscriptionDate"],
//     reSubscriptionDate: json["reSubscripedDate"],
//     loanAct: json["loanAct"],
//     hajjAct: json["hajjAct"],
//     consumerLoanAct: json["consumerLoanAct"],
//     persLoanAct: json["persLoanAct"],
//     otherAct1: json["otherAct1"],
//     otherAct2: json["otherAct2"],
//     otherAct3: json["otherAct3"],
//     otherAct4: json["otherAct4"],
//     otherAct5: json["otherAct5"],
//     employeeStreet1: json["empStreet1"],
//     employeeStreet2: json["empStreet2"],
//     cityCode: json["cityCode"],
//     countryCode: json["counCode"],
//     remarks: json["remarks"],
//     userID: json["userId"],
//     activeDirectoryID: json["activeDirectoryId"],
//     mainHRRoleID: json["mainHrroleId"],
//     employeeLoginID: json["employeeLoginId"],
//     employeePassword: json["employeePassword"],
//     active: json["active"],
//     deleted: json["deleted"],
//     dateTime: json["dateTime"],
//     deviceID: json["deviceId"],
//     uploadDate: json["uploadDate"],
//     uploadBy: json["uploadby"],
//     syncDate: json["syncDate"],
//     syncBy: json["syncby"],
//     synID: json["synId"],
//     refName1: json["refName1"],
//     refName2: json["refName2"],
//     membership: json["membership"],
//     membershipJoiningDate: json["membershipJoiningDate"],
//     termination: json["termination"],
//     terminationDate: json["terminationDate"],
//     subscriptionStatus: int.tryParse(json['subscriptionStatus'].toString()) ?? 0,


//   );

//   Map<String, dynamic> toJson() => {
//     "tenentId": tenentID ,
//     "locationId": locationID,
//     "employeeId": employeeId,
//     "contractType": contractType,
//     "pfid": pfID ?? 0,
//     "token" : token,
//     "subscribedDate": subscribedDate,
//     "agreedSubAmount": agreedSubAmount ?? "",
//     "reSubscribed": reSubscribed ?? "",
//     "employeeType": employeeType ?? "",
//     "arabicName": arabicName ?? "",
//     "englishName": englishName ?? "",
//     "jobTitleCode": jobTitleCode ?? 0,
//     "jobTitleName": jobTitleName ?? "",
//     "department": department ?? 0,
//     "departmentName": departmentName ?? "",
//     "empGender": empGender ?? 0,
//     "empBirthday": empBirthday ?? "",
//     "empMaritalStatus": empMaritalStatus ?? 0,
//     "salary": salary ?? 0,
//     "empWorkTelephone": empWorkTelephone ?? "",
//     "empWorkEmail": empWorkEmail ?? "",
//     "mobileNumber": mobileNumber ?? "",
//     "next2KinName": next2KinName ?? "",
//     "next2KinMobNumber": next2KinMobNumber ?? "",
//     "nationCode": nationCode ?? 0,
//     "nationName": nationName ?? "",
//     "empCidNum": cidNumber ?? "",
//     "empPaciNum": empPaciNum ?? "",
//     "empOtherId": empOtherId ?? "",
//     "empStatus": employeeStatus,
//     "joinedDate": joinedDate ?? "",
//     "endDate": endDate ?? "",
//     "terminationId": terminationID ?? 1,
//     "subscriptionDate": subscriptionDate ?? "",
//     "reSubscripedDate": reSubscriptionDate ?? "",
//     "loanAct": loanAct ?? "",
//     "hajjAct": hajjAct ?? "",
//     "consumerLoanAct": consumerLoanAct ?? "",
//     "persLoanAct": persLoanAct ?? "",
//     "otherAct1": otherAct1 ?? "",
//     "otherAct2": otherAct2 ?? "",
//     "otherAct3": otherAct3 ?? "",
//     "otherAct4": otherAct4 ?? "",
//     "otherAct5": otherAct5 ?? "",
//     "empStreet1": employeeStreet1 ?? "",
//     "empStreet2": employeeStreet2 ?? "",
//     "cityCode": cityCode ?? "",
//     "counCode": countryCode,
//     "remarks": remarks ?? "",
//     "userId": userID ?? "",
//     "activeDirectoryId": activeDirectoryID ?? "",
//     "mainHrroleId": mainHRRoleID ?? 1,
//     "employeeLoginId": employeeLoginID ?? "",
//     "employeePassword": employeePassword ?? "",
//     "active": active ?? false,
//     "deleted": deleted ?? false,
//     "dateTime": dateTime ?? "",
//     "deviceId": deviceID ?? "",
//     "uploadDate": uploadDate ?? "",
//     "uploadby": uploadBy ?? "",
//     "syncDate": syncDate ?? "",
//     "syncby": syncBy ?? "",
//     "synId": synID ?? 1,
//     "refName1": refName1 ?? "",
//     "refName2": refName2 ?? "",
//     "membership": membership ?? "",
//     "membershipJoiningDate": membershipJoiningDate ?? "",
//     "termination": termination ?? "",
//     "terminationDate": terminationDate ?? "",
//   };
// }