
class LoginResModel {
    int? tenentId;
    int? locationId;
    int? employeeId;
    String? contractType;
    String? pfid;
    String? token;
    String? subscribedDate;
    dynamic agreedSubAmount;
    dynamic reSubscribed;
    dynamic employeeType;
    String? arabicName;
    String? englishName;
    int? jobTitleCode;  
    String? jobTitleName;
    int? department;
    dynamic departmentName;
    int? empGender;
    String? empBirthday;
    String? empMaritalStatus;
    int? salary;
    String? empWorkTelephone;
    String? empWorkEmail;
    String? mobileNumber;
    String? next2KinName;
    String? next2KinMobNumber;
    int? nationCode;
    String? nationName;
    String? empCidNum;
    String? empPaciNum;
    String? empOtherId;
    int? empStatus;
    String? joinedDate;
    dynamic endDate;
    int? terminationId;
    dynamic subscriptionDate;
    dynamic reSubscripedDate;
    String? loanAct;
    String? hajjAct;
    String? consumerLoanAct;
    String? persLoanAct;
    dynamic otherAct1;
    dynamic otherAct2;
    dynamic otherAct3;
    dynamic otherAct4;
    String? otherAct5;
    dynamic empStreet1;
    dynamic empStreet2;
    dynamic cityCode;
    dynamic counCode;
    dynamic remarks;
    String? userId;
    dynamic activeDirectoryId;
    dynamic mainHrroleId;
    String? employeeLoginId;
    String? employeePassword;
    dynamic active;
    dynamic deleted;
    String? dateTime;
    dynamic deviceId;
    String? uploadDate;
    String? uploadby;
    dynamic syncDate;
    dynamic syncby;
    dynamic synId;
    dynamic refName1;
    dynamic refName2;
    String? membership;
    String? membershipJoiningDate;
    String? termination;
    dynamic terminationDate;
    bool? isKuEmployee;
    bool? isOnSickLeave;
    bool? isMemberOfFund;
    bool? subFrozen;
    dynamic subFrozenDate;
    int? cruPId;
    dynamic settlementSerMonths;
    dynamic settlementAmount;
    dynamic nextSetlementPayDate;
    dynamic nextSetlementPayAmount;
    dynamic username;
    dynamic createdDate;
    dynamic loanOpNotPaidAmount;
    dynamic loanOpAmount;
    dynamic subOpNotPaidAmount;
    dynamic subOpAmount;
    dynamic holdQty;
    dynamic holdRemarks;
    dynamic unHoldDate;
    dynamic unHoldBy;
    bool? terminationBanned;
    bool? isChecked;
    dynamic imageUrl;
    dynamic employeeStatus;
    dynamic subscriptionStatus;
    dynamic rejectedBy;
    String? rejecteddate;
    bool? isWarning;
    dynamic transactionHddmsDtos;
    dynamic subsOpBal;
    dynamic subsCurBal;
    dynamic loanOpBal;
    dynamic loanCurBal;
    dynamic amaOpBal;
    dynamic amaCurBal;
    dynamic contractName;

    LoginResModel({this.tenentId, this.locationId, this.employeeId, this.contractType, this.pfid, this.token, this.subscribedDate, this.agreedSubAmount, this.reSubscribed, this.employeeType, this.arabicName, this.englishName, this.jobTitleCode, this.jobTitleName, this.department, this.departmentName, this.empGender, this.empBirthday, this.empMaritalStatus, this.salary, this.empWorkTelephone, this.empWorkEmail, this.mobileNumber, this.next2KinName, this.next2KinMobNumber, this.nationCode, this.nationName, this.empCidNum, this.empPaciNum, this.empOtherId, this.empStatus, this.joinedDate, this.endDate, this.terminationId, this.subscriptionDate, this.reSubscripedDate, this.loanAct, this.hajjAct, this.consumerLoanAct, this.persLoanAct, this.otherAct1, this.otherAct2, this.otherAct3, this.otherAct4, this.otherAct5, this.empStreet1, this.empStreet2, this.cityCode, this.counCode, this.remarks, this.userId, this.activeDirectoryId, this.mainHrroleId, this.employeeLoginId, this.employeePassword, this.active, this.deleted, this.dateTime, this.deviceId, this.uploadDate, this.uploadby, this.syncDate, this.syncby, this.synId, this.refName1, this.refName2, this.membership, this.membershipJoiningDate, this.termination, this.terminationDate, this.isKuEmployee, this.isOnSickLeave, this.isMemberOfFund, this.subFrozen, this.subFrozenDate, this.cruPId, this.settlementSerMonths, this.settlementAmount, this.nextSetlementPayDate, this.nextSetlementPayAmount, this.subscriptionStatus, this.username, this.createdDate, this.loanOpNotPaidAmount, this.loanOpAmount, this.subOpNotPaidAmount, this.subOpAmount, this.holdQty, this.holdRemarks, this.unHoldDate, this.unHoldBy, this.terminationBanned, this.isChecked, this.imageUrl, this.employeeStatus, this.rejectedBy, this.rejecteddate, this.isWarning, this.transactionHddmsDtos, this.subsOpBal, this.subsCurBal, this.loanOpBal, this.loanCurBal, this.amaOpBal, this.amaCurBal, this.contractName});

    LoginResModel.fromJson(Map<String, dynamic> json) {
        if(json["tenentId"] is int) {
            tenentId = json["tenentId"];
        }
        if(json["locationId"] is int) {
            locationId = json["locationId"];
        }
        if(json["employeeId"] is int) {
            employeeId = json["employeeId"];
        }
        if(json["contractType"] is String) {
            contractType = json["contractType"];
        }
        if(json["pfid"] is String) {
            pfid = json["pfid"];
        }
        if(json["token"] is String) {
            token = json["token"];
        }
        if(json["subscribedDate"] is String) {
            subscribedDate = json["subscribedDate"];
        }
        agreedSubAmount = json["agreedSubAmount"];
        reSubscribed = json["reSubscribed"];
        employeeType = json["employeeType"];
        if(json["arabicName"] is String) {
            arabicName = json["arabicName"];
        }
        if(json["englishName"] is String) {
            englishName = json["englishName"];
        }
        if(json["jobTitleCode"] is int) {
            jobTitleCode = json["jobTitleCode"];
        }
        if(json["jobTitleName"] is String) {
            jobTitleName = json["jobTitleName"];
        }
        if(json["department"] is int) {
            department = json["department"];
        }
        departmentName = json["departmentName"];
        if(json["empGender"] is int) {
            empGender = json["empGender"];
        }
        if(json["empBirthday"] is String) {
            empBirthday = json["empBirthday"];
        }
        if(json["empMaritalStatus"] is String) {
            empMaritalStatus = json["empMaritalStatus"];
        }
        if(json["salary"] is int) {
            salary = json["salary"];
        }
        if(json["empWorkTelephone"] is String) {
            empWorkTelephone = json["empWorkTelephone"];
        }
        if(json["empWorkEmail"] is String) {
            empWorkEmail = json["empWorkEmail"];
        }
        if(json["mobileNumber"] is String) {
            mobileNumber = json["mobileNumber"];
        }
        if(json["next2KinName"] is String) {
            next2KinName = json["next2KinName"];
        }
        if(json["next2KinMobNumber"] is String) {
            next2KinMobNumber = json["next2KinMobNumber"];
        }
        if(json["nationCode"] is int) {
            nationCode = json["nationCode"];
        }
        if(json["nationName"] is String) {
            nationName = json["nationName"];
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
        if(json["empStatus"] is int) {
            empStatus = json["empStatus"];
        }
        if(json["joinedDate"] is String) {
            joinedDate = json["joinedDate"];
        }
        endDate = json["endDate"];
        if(json["terminationId"] is int) {
            terminationId = json["terminationId"];
        }
        subscriptionDate = json["subscriptionDate"];
        reSubscripedDate = json["reSubscripedDate"];
        if(json["loanAct"] is String) {
            loanAct = json["loanAct"];
        }
        if(json["hajjAct"] is String) {
            hajjAct = json["hajjAct"];
        }
        if(json["consumerLoanAct"] is String) {
            consumerLoanAct = json["consumerLoanAct"];
        }
        if(json["persLoanAct"] is String) {
            persLoanAct = json["persLoanAct"];
        }
        otherAct1 = json["otherAct1"];
        otherAct2 = json["otherAct2"];
        otherAct3 = json["otherAct3"];
        otherAct4 = json["otherAct4"];
        if(json["otherAct5"] is String) {
            otherAct5 = json["otherAct5"];
        }
        empStreet1 = json["empStreet1"];
        empStreet2 = json["empStreet2"];
        cityCode = json["cityCode"];
        counCode = json["counCode"];
        remarks = json["remarks"];
        if(json["userId"] is String) {
            userId = json["userId"];
        }
        activeDirectoryId = json["activeDirectoryId"];
        mainHrroleId = json["mainHrroleId"];
        if(json["employeeLoginId"] is String) {
            employeeLoginId = json["employeeLoginId"];
        }
        if(json["employeePassword"] is String) {
            employeePassword = json["employeePassword"];
        }
        active = json["active"];
        deleted = json["deleted"];
        if(json["dateTime"] is String) {
            dateTime = json["dateTime"];
        }
        deviceId = json["deviceId"];
        if(json["uploadDate"] is String) {
            uploadDate = json["uploadDate"];
        }
        if(json["uploadby"] is String) {
            uploadby = json["uploadby"];
        }
        syncDate = json["syncDate"];
        syncby = json["syncby"];
        synId = json["synId"];
        refName1 = json["refName1"];
        refName2 = json["refName2"];
        if(json["membership"] is String) {
            membership = json["membership"];
        }
        if(json["membershipJoiningDate"] is String) {
            membershipJoiningDate = json["membershipJoiningDate"];
        }
        if(json["termination"] is String) {
            termination = json["termination"];
        }
        terminationDate = json["terminationDate"];
        if(json["isKUEmployee"] is bool) {
            isKuEmployee = json["isKUEmployee"];
        }
        if(json["isOnSickLeave"] is bool) {
            isOnSickLeave = json["isOnSickLeave"];
        }
        if(json["isMemberOfFund"] is bool) {
            isMemberOfFund = json["isMemberOfFund"];
        }
        if(json["subFrozen"] is bool) {
            subFrozen = json["subFrozen"];
        }
        subFrozenDate = json["subFrozenDate"];
        if(json["cruP_ID"] is int) {
            cruPId = json["cruP_ID"];
        }
        settlementSerMonths = json["settlementSerMonths"];
        settlementAmount = json["settlementAmount"];
        nextSetlementPayDate = json["nextSetlementPayDate"];
        nextSetlementPayAmount = json["nextSetlementPayAmount"];
        if(json["subscription_status"] is int) {
            subscriptionStatus = json["subscription_status"];
        }
        username = json["username"];
        createdDate = json["createdDate"];
        loanOpNotPaidAmount = json["loanOPNotPaidAmount"];
        loanOpAmount = json["loanOPAmount"];
        subOpNotPaidAmount = json["subOPNotPaidAmount"];
        subOpAmount = json["subOPAmount"];
        holdQty = json["holdQty"];
        holdRemarks = json["holdRemarks"];
        unHoldDate = json["unHoldDate"];
        unHoldBy = json["unHoldBy"];
        if(json["terminationBanned"] is bool) {
            terminationBanned = json["terminationBanned"];
        }
        if(json["isChecked"] is bool) {
            isChecked = json["isChecked"];
        }
        imageUrl = json["imageUrl"];
        employeeStatus = json["employeeStatus"];
        subscriptionStatus = json["subscriptionStatus"];
        rejectedBy = json["rejectedBy"];
        if(json["rejecteddate"] is String) {
            rejecteddate = json["rejecteddate"];
        }
        if(json["isWarning"] is bool) {
            isWarning = json["isWarning"];
        }
        transactionHddmsDtos = json["transactionHDDMSDtos"];
        subsOpBal = json["subsOpBal"];
        subsCurBal = json["subsCurBal"];
        loanOpBal = json["loanOpBal"];
        loanCurBal = json["loanCurBal"];
        amaOpBal = json["amaOpBal"];
        amaCurBal = json["amaCurBal"];
        contractName = json["contractName"];
    }

    Map<String, dynamic> toMap() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["tenentId"] = tenentId;
        _data["locationId"] = locationId;
        _data["employeeId"] = employeeId;
        _data["contractType"] = contractType;
        _data["pfid"] = pfid;
        // _data["token"] = token;
        _data["subscribedDate"] = subscribedDate;
        // _data["agreedSubAmount"] = agreedSubAmount;
        // _data["reSubscribed"] = reSubscribed;
        // _data["employeeType"] = employeeType;
        _data["arabicName"] = arabicName;
        _data["englishName"] = englishName;
        _data["jobTitleCode"] = jobTitleCode;
        _data["jobTitleName"] = jobTitleName;
        _data["department"] = department;
        // _data["departmentName"] = departmentName;
        _data["empGender"] = empGender;
        _data["empBirthday"] = empBirthday;
        _data["empMaritalStatus"] = empMaritalStatus;
        _data["salary"] = salary;
        _data["empWorkTelephone"] = empWorkTelephone;
        _data["empWorkEmail"] = empWorkEmail;
        _data["mobileNumber"] = mobileNumber;
        _data["next2KinName"] = next2KinName;
        _data["next2KinMobNumber"] = next2KinMobNumber;
        _data["nationCode"] = nationCode;
        _data["nationName"] = nationName;
        _data["empCidNum"] = empCidNum;
        _data["empPaciNum"] = empPaciNum;
        _data["empOtherId"] = empOtherId;
        _data["empStatus"] = empStatus;
        _data["joinedDate"] = joinedDate;
        // _data["endDate"] = endDate;
        _data["terminationId"] = terminationId;
        // _data["subscriptionDate"] = subscriptionDate;
        // _data["reSubscripedDate"] = reSubscripedDate;
        _data["loanAct"] = loanAct;
        _data["hajjAct"] = hajjAct;
        _data["consumerLoanAct"] = consumerLoanAct;
        _data["persLoanAct"] = persLoanAct;
        // _data["otherAct1"] = otherAct1;
        // _data["otherAct2"] = otherAct2;
        // _data["otherAct3"] = otherAct3;
        // _data["otherAct4"] = otherAct4;
        // _data["otherAct5"] = otherAct5;
        // _data["empStreet1"] = empStreet1;
        // _data["empStreet2"] = empStreet2;
        // _data["cityCode"] = cityCode;
        // _data["counCode"] = counCode;
        // _data["remarks"] = remarks;
        _data["userId"] = userId;
        // _data["activeDirectoryId"] = activeDirectoryId;
        // _data["mainHrroleId"] = mainHrroleId;
        _data["employeeLoginId"] = employeeLoginId;
        _data["employeePassword"] = employeePassword;
        // _data["active"] = active;
        // _data["deleted"] = deleted;
        _data["dateTime"] = dateTime;
        // _data["deviceId"] = deviceId;
        _data["uploadDate"] = uploadDate;
        _data["uploadby"] = uploadby;
        // _data["syncDate"] = syncDate;
        // _data["syncby"] = syncby;
        // _data["synId"] = synId;
        // _data["refName1"] = refName1;
        // _data["refName2"] = refName2;
        _data["membership"] = membership;
        _data["membershipJoiningDate"] = membershipJoiningDate;
        _data["termination"] = termination;
        // _data["terminationDate"] = terminationDate;
        _data["isKUEmployee"] = isKuEmployee;
        _data["isOnSickLeave"] = isOnSickLeave;
        _data["isMemberOfFund"] = isMemberOfFund;
        _data["subFrozen"] = subFrozen;
        // _data["subFrozenDate"] = subFrozenDate;
        _data["cruP_ID"] = cruPId;
        // _data["settlementSerMonths"] = settlementSerMonths;
        // _data["settlementAmount"] = settlementAmount;
        // _data["nextSetlementPayDate"] = nextSetlementPayDate;
        // _data["nextSetlementPayAmount"] = nextSetlementPayAmount;
        _data["subscription_status"] = subscriptionStatus;
        // _data["username"] = username;
        // _data["createdDate"] = createdDate;
        // _data["loanOPNotPaidAmount"] = loanOpNotPaidAmount;
        // _data["loanOPAmount"] = loanOpAmount;
        // _data["subOPNotPaidAmount"] = subOpNotPaidAmount;
        // _data["subOPAmount"] = subOpAmount;
        // _data["holdQty"] = holdQty;
        // _data["holdRemarks"] = holdRemarks;
        // _data["unHoldDate"] = unHoldDate;
        // _data["unHoldBy"] = unHoldBy;
        _data["terminationBanned"] = terminationBanned;
        // _data["isChecked"] = isChecked;
        _data["imageUrl"] = imageUrl;
        // _data["employeeStatus"] = employeeStatus;
        // _data["subscriptionStatus"] = subscriptionStatus;
        // _data["rejectedBy"] = rejectedBy;
        _data["rejecteddate"] = rejecteddate;
        // _data["isWarning"] = isWarning;
        // _data["transactionHDDMSDtos"] = transactionHddmsDtos;
        // _data["subsOpBal"] = subsOpBal;
        // _data["subsCurBal"] = subsCurBal;
        // _data["loanOpBal"] = loanOpBal;
        // _data["loanCurBal"] = loanCurBal;
        // _data["amaOpBal"] = amaOpBal;
        // _data["amaCurBal"] = amaCurBal;
        // _data["contractName"] = contractName;
        return _data;
    }
}