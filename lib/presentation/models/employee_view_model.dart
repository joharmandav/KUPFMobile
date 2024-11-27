class EmployeeViewModel {
  dynamic employeeLoginId;
  dynamic empWorkEmail;
  dynamic employeeId;
  dynamic pfId;
  dynamic maritalStatus;
  dynamic dateofBirth;
  dynamic landlineNumber;
  dynamic arabicName;
  dynamic englishName;
  dynamic salary;
  dynamic jobTitleCode;
  dynamic engJobTitle;
  dynamic arabicJobTitle;
  dynamic department;
  dynamic engDepartment;
  dynamic arabicDepartment;
  dynamic empGender;
  dynamic engGender;
  dynamic arabicGender;
  dynamic mobileNumber;
  dynamic next2KinName;
  dynamic next2KinMobNumber;
  dynamic empCidNum;
  dynamic empPaciNum;
  dynamic empOtherId;

  EmployeeViewModel({
    this.employeeLoginId,
    this.empWorkEmail,
   this.employeeId,
     this.pfId,
     this.maritalStatus,
     this.dateofBirth,
     this.landlineNumber,
     this.arabicName,
     this.englishName,
     this.salary,
     this.jobTitleCode,
     this.engJobTitle,
     this.arabicJobTitle,
     this.department,
     this.engDepartment,
     this.arabicDepartment,
     this.empGender,
     this.engGender,
     this.arabicGender,
     this.mobileNumber,
     this.next2KinName,
     this.next2KinMobNumber,
     this.empCidNum,
     this.empPaciNum,
     this.empOtherId,
  });

  factory EmployeeViewModel.fromMap(Map<String, dynamic> json) => EmployeeViewModel(
    employeeLoginId: json["EmployeeLoginID"] ?? '',
    empWorkEmail: json["empWorkEmail"] ?? '',
    employeeId: json["employeeID"] ?? '',
    pfId: json["PFID"] ?? '',
    dateofBirth: json["emp_birthday"]??"",
    maritalStatus: json["emp_marital_status"].toString(),
    landlineNumber: json["emp_work_telephone"]??0,
    arabicName: json["ArabicName"] ?? '',
    englishName: json["EnglishName"] ?? '',
    salary: json["salary"]?.toDouble() ?? 0.0,
    jobTitleCode: json["job_title_code"] ?? 0,
    engJobTitle: json["EngJobTitle"] ?? '',
    arabicJobTitle: json["ArabicJobTitle"] ?? '',
    department: json["Department"] ?? 0,
    engDepartment: json["EngDepartment"] ?? '',
    arabicDepartment: json["ArabicDepartment"] ?? '',
    empGender: json["emp_gender"].toString(),
    engGender: json["EngGender"] ?? 0,
    arabicGender: json["ArabicGender"] ?? '',
    mobileNumber: json["MobileNumber"] ?? 0,
    next2KinName: json["Next2KinName"] ?? '',
    next2KinMobNumber: json["Next2KinMobNumber"] ?? 0,
    empCidNum: json["emp_cid_num"] ?? 0,
    empPaciNum: json["emp_paci_num"] ?? 0,
    empOtherId: json["emp_other_id"] ?? 0,
  );

  Map<String, dynamic> toMap() {
    return {
      "EmployeeLoginID": employeeLoginId,
      "empWorkEmail": empWorkEmail,
      "employeeID": employeeId,
      "PFID": pfId,
      "emp_birthday":dateofBirth,
      "emp_marital_status":maritalStatus,
      "emp_work_telephone":landlineNumber,
      "ArabicName": arabicName,
      "EnglishName": englishName,
      "salary": salary,
      "job_title_code": jobTitleCode,
      "EngJobTitle": engJobTitle,
      "ArabicJobTitle": arabicJobTitle,
      "Department": department,
      "EngDepartment": engDepartment,
      "ArabicDepartment": arabicDepartment,
      "emp_gender": empGender,
      "EngGender": engGender,
      "ArabicGender": arabicGender,
      "MobileNumber": mobileNumber,
      "Next2KinName": next2KinName,
      "Next2KinMobNumber": next2KinMobNumber,
      "emp_cid_num": empCidNum,
      "emp_paci_num": empPaciNum,
      "emp_other_id": empOtherId,
    };
  }
}
