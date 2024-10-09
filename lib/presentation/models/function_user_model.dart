import '../../app/server/database/db_constant.dart';

class FunctionUserModel {
  final int tenentID;
  final int locationID;
  final int userID;
  final int roleID;
  final int menuID;
  final int masterID;
  final int moduleID;
  final String menuType;
  final String? menuLevel;
  final String menuNameEnglish;
  final String menuNameArabic;
  final String? smallText;
  final String fullName;
  final String loginID;
  final String password;
  final int userType;
  final int? activeFlag;
  final String? activeTillDate;
  final String? link;
  final String? urlOption;
  final String? urlRewrite;
  final String? menuLocation;
  final int? menuOrder;
  final String? docParent;
  final int? addFlage;
  final int? editFlage;
  final int? delFlage;
  final int? printFlage;
  final int? amiGlobale;
  final int? myPersonal;
  final String? iconPath;
  final int sp1;
  final int sp2;
  final int sp3;
  final int sp4;
  final int sp5;
  final String? sp1Name;
  final String? sp2Name;
  final String? sp3Name;
  final String? sp4Name;
  final String? sp5Name;
  final String? uploadDate;
  final String? uploadBy;
  final String? syncDate;
  final String? syncBy;
  final String? synID;
  final int crupID;

  FunctionUserModel({
    required this.tenentID,
    required this.locationID,
    required this.userID,
    required this.roleID,
    required this.menuID,
    required this.masterID,
    required this.moduleID,
    required this.menuType,
    this.menuLevel,
    required this.menuNameEnglish,
    required this.menuNameArabic,
    this.smallText,
    required this.fullName,
    required this.loginID,
    required this.password,
    required this.userType,
    this.activeFlag,
    this.activeTillDate,
    this.link,
    this.urlOption,
    this.urlRewrite,
    this.menuLocation,
    this.menuOrder,
    this.docParent,
    this.addFlage,
    this.editFlage,
    this.delFlage,
    this.printFlage,
    this.amiGlobale,
    this.myPersonal,
    this.iconPath,
    required this.sp1,
    required this.sp2,
    required this.sp3,
    required this.sp4,
    required this.sp5,
    this.sp1Name,
    this.sp2Name,
    this.sp3Name,
    this.sp4Name,
    this.sp5Name,
    this.uploadDate,
    this.uploadBy,
    this.syncDate,
    this.syncBy,
    this.synID,
    required this.crupID,
  });

  // factory FunctionUserModel.fromMap(Map<String, dynamic> map) =>
  //     FunctionUserModel(
  //       tenentID: map[Constants.tenentID],
  //       locationID: map[Constants.locationID],
  //       userID: map[Constants.userID],
  //       roleID: map[Constants.roleID],
  //       menuID: map[Constants.menuID],
  //       masterID: map[Constants.masterID],
  //       moduleID: map[Constants.moduleID],
  //       menuType: map[Constants.menuType],
  //       menuLevel: map[Constants.menuLevel],
  //       menuNameEnglish: map[Constants.menuNameEnglish],
  //       menuNameArabic: map[Constants.menuNameArabic],
  //       smallText: map[Constants.smallTEXT],
  //       fullName: map[Constants.fullName],
  //       loginID: map[Constants.loginID],
  //       password: map[Constants.password],
  //       userType: map[Constants.userType],
  //       activeFlag: map[Constants.activeFLAG],
  //       activeTillDate: map[Constants.activeTILLDATE],
  //       link: map[Constants.link],
  //       urlOption: map[Constants.urlOption],
  //       urlRewrite: map[Constants.urlRewrite],
  //       menuLocation: map[Constants.menuLocation],
  //       menuOrder: map[Constants.menuOrder],
  //       docParent: map[Constants.docParent],
  //       addFlage: map[Constants.addFlage],
  //       editFlage: map[Constants.editFlage],
  //       delFlage: map[Constants.delFlage],
  //       printFlage: map[Constants.printFlage],
  //       amiGlobale: map[Constants.amiGlobale],
  //       myPersonal: map[Constants.myPERSONAL],
  //       iconPath: map[Constants.iconPath],
  //       sp1: map[Constants.sp1],
  //       sp2: map[Constants.sp2],
  //       sp3: map[Constants.sp3],
  //       sp4: map[Constants.sp4],
  //       sp5: map[Constants.sp5],
  //       sp1Name: map[Constants.sp1Name],
  //       sp2Name: map[Constants.sp2Name],
  //       sp3Name: map[Constants.sp3Name],
  //       sp4Name: map[Constants.sp4Name],
  //       sp5Name: map[Constants.sp5Name],
  //       uploadDate: map[Constants.uploadDate],
  //       uploadBy: map[Constants.uploadBY],
  //       syncDate: map[Constants.syncDate],
  //       syncBy: map[Constants.syncBY],
  //       synID: map[Constants.synID],
  //       crupID: map[Constants.crupID],
  //     );

  Map<String, dynamic> toMap() => {
    Constants.tenentID: tenentID,
    Constants.locationID: locationID,
    Constants.userID: userID,
    Constants.roleID: roleID,
    Constants.menuID: menuID,
    Constants.masterID: masterID,
    Constants.moduleID: moduleID,
    Constants.menuType: menuType,
    Constants.menuLevel: menuLevel,
    Constants.menuNameEnglish: menuNameEnglish,
    Constants.menuNameArabic: menuNameArabic,
    Constants.smallTEXT: smallText,
    Constants.fullName: fullName,
    Constants.loginID: loginID,
    Constants.password: password,
    Constants.userType: userType,
    Constants.activeFLAG: activeFlag,
    Constants.activeTILLDATE: activeTillDate,
    Constants.link: link,
    Constants.urlOption: urlOption,
    Constants.urlRewrite: urlRewrite,
    Constants.menuLocation: menuLocation,
    Constants.menuOrder: menuOrder,
    Constants.docParent: docParent,
    Constants.addFlage: addFlage,
    Constants.editFlage: editFlage,
    Constants.printFlage: printFlage,
    Constants.delFlage: delFlage,
    Constants.amiGlobale: amiGlobale,
    Constants.myPERSONAL: myPersonal,
    Constants.iconPath: iconPath,
    Constants.sp1: sp1,
    Constants.sp2: sp2,
    Constants.sp3: sp3,
    Constants.sp4: sp4,
    Constants.sp5: sp5,
    Constants.sp1Name: sp1Name,
    Constants.sp2Name: sp2Name,
    Constants.sp3Name: sp3Name,
    Constants.sp4Name: sp4Name,
    Constants.sp5Name: sp5Name,
    Constants.uploadDate: uploadDate,
    Constants.uploadBY: uploadBy,
    Constants.syncDate: syncDate,
    Constants.syncBY: syncBy,
    Constants.synID: synID,
    Constants.crupID: crupID,
  };

  factory FunctionUserModel.fromJson(Map<String, dynamic> json) => FunctionUserModel(
    tenentID: json["tenentID"],
    locationID: json["locatioN_ID"],
    userID: json["useR_ID"],
    roleID: json["rolE_ID"],
    menuID: json["menU_ID"],
    masterID: json["masteR_ID"],
    moduleID: json["modulE_ID"],
    menuType: json["menU_TYPE"],
    menuNameEnglish: json["menU_NAMEEnglish"],
    menuNameArabic: json["menU_NAMEArabic"],
    smallText: json["smalltext"],
    fullName: json["fulL_NAME"],
    loginID: json["logiN_ID"],
    password: json["password"],
    userType: json["useR_TYPE"],
    activeFlag: json["activE_FLAG"],
    activeTillDate: json["activetilldate"],
    link: json["link"],
    urlOption: json["urloption"],
    urlRewrite: json["urlrewrite"],
    menuLocation: json["menU_LOCATION"],
    menuOrder: json["menU_ORDER"],
    docParent: json["doC_PARENT"],
    addFlage: json["addflage"],
    editFlage: json["editflage"],
    delFlage: json["delflage"],
    printFlage: json["printflage"],
    amiGlobale: json["amiglobale"],
    myPersonal: json["mypersonal"],
    iconPath: json["iconpath"],
    sp1: json["sP1"],
    sp2: json["sP2"],
    sp3: json["sP3"],
    sp4: json["sP4"],
    sp5: json["sP5"],
    sp1Name: json["sP1Name"],
    sp2Name: json["sP2Name"],
    sp3Name: json["sP3Name"],
    sp4Name: json["sP4Name"],
    sp5Name: json["sP5Name"],
    uploadDate: json["uploadDate"],
    uploadBy: json["uploadby"],
    syncDate: json["syncDate"],
    syncBy: json["syncby"],
    synID: json["synID"],
    crupID: json["cruP_ID"],
    menuLevel: json["menu_Level"],
  );

  Map<String, dynamic> toJson() => {
    "tenentID": tenentID,
    "locatioN_ID": locationID,
    "useR_ID": userID,
    "rolE_ID": roleID,
    "menU_ID": menuID,
    "masteR_ID": masterID,
    "modulE_ID": moduleID,
    "menU_TYPE": menuType,
    "menU_NAMEEnglish": menuNameEnglish,
    "menU_NAMEArabic": menuNameArabic,
    "smalltext": smallText,
    "fulL_NAME": fullName,
    "logiN_ID": loginID,
    "password": password,
    "useR_TYPE": userType,
    "activE_FLAG": activeFlag,
    "activetilldate": activeTillDate,
    "link": link,
    "urloption": urlOption,
    "urlrewrite": urlRewrite,
    "menU_LOCATION": menuLocation,
    "menU_ORDER": menuOrder,
    "doC_PARENT": docParent,
    "addflage": addFlage,
    "editflage": editFlage,
    "delflage": delFlage,
    "printflage": printFlage,
    "amiglobale": amiGlobale,
    "mypersonal": myPersonal,
    "iconpath": iconPath,
    "sP1": sp1,
    "sP2": sp2,
    "sP3": sp3,
    "sP4": sp4,
    "sP5": sp5,
    "sP1Name": sp1Name,
    "sP2Name": sp2Name,
    "sP3Name": sp3Name,
    "sP4Name": sp4Name,
    "sP5Name": sp5Name,
    "uploadDate": uploadDate,
    "uploadby": uploadBy,
    "syncDate": syncDate,
    "syncby": syncBy,
    "synID": synID,
    "cruP_ID": crupID,
    "menu_Level": menuLevel,
  };
}
