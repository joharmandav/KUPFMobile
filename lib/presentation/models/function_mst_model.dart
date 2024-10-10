import '../../app/server/database/db_constant.dart';

class FunctionMSTModel {
  final int tenentID;
  final int menuID;
  final int masterID;
  final int moduleID;
  final String menuType;
  final int menuLevel;
  final String menuNameEnglish;
  final String menuNameArabic;
  final String fullName;
  final String? link;
  final String? urlOption;
  final String? urlRewrite;
  final String menuLocation;
  final int? menuOrder;
  final String? docParent;
  final int crupID;
  final int? addFlage;
  final int? editFlage;
  final int? delFlage;
  final int? printFlage;
  final int? amiGlobale;
  final int? myPersonal;
  final String? smallText;
  final String? activetillDate;
  final String? iconPath;
  final String? commanLine;
  final int? activeFlage;
  final String? metaTitle;
  final String? metaKeyword;
  final String? metaDescription;
  final String? headerVisibleData;
  final String? headerInvisibleData;
  final String? footerVisibleData;
  final String? footerInvisibleData;
  final int? refID;
  final int? myBusID;
  final int? lableFlag;
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
  final bool activeMenu;
  final int? menuDate;

  FunctionMSTModel({
    required this.tenentID,
    required this.menuID,
    required this.masterID,
    required this.moduleID,
    required this.menuType,
    required this.menuLevel,
    required this.menuNameEnglish,
    required this.menuNameArabic,
    required this.fullName,
    this.link,
    this.urlOption,
    this.urlRewrite,
    required this.menuLocation,
    this.menuOrder,
    this.docParent,
    required this.crupID,
    this.addFlage,
    this.editFlage,
    this.delFlage,
    this.printFlage,
    this.amiGlobale,
    this.myPersonal,
    this.smallText,
    this.activetillDate,
    this.iconPath,
    this.commanLine,
    this.activeFlage,
    this.metaTitle,
    this.metaKeyword,
    this.metaDescription,
    this.headerVisibleData,
    this.headerInvisibleData,
    this.footerVisibleData,
    this.footerInvisibleData,
    this.refID,
    this.myBusID,
    this.lableFlag,
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
    required this.activeMenu,
    this.menuDate,
  });

  factory FunctionMSTModel.fromJson(Map<String, dynamic> json) => FunctionMSTModel(
    tenentID: json["tenentID"],
    menuID: json["menU_ID"],
    masterID: json["masteR_ID"],
    moduleID: json["modulE_ID"],
    menuType: json["menU_TYPE"],
    menuNameEnglish: json["menU_NAMEEnglish"],
    menuNameArabic: json["menU_NAMEArabic"],
    fullName: json["fulL_NAME"]??"",
    link: json["link"]??"",
    urlOption: json["urloption"]??"",
    urlRewrite: json["urlrewrite"]??"",
    menuLocation: json["menU_LOCATION"]??"",
    menuOrder: json["menU_ORDER"]!= null
          ? (json["menU_ORDER"] is double 
              ? (json["menU_ORDER"] as double).toInt() // Convert double to int
              : json["menU_ORDER"] as int?)
          : null,
    docParent: json["doC_PARENT"]??"",
    crupID: json["cruP_ID"],
    addFlage: json["addflage"]??null,
    editFlage: json["editflage"]??null,
    delFlage: json["delflage"]??null,
    printFlage: json["printflage"]??null, 
    amiGlobale: json["amiglobale"]??null,
    myPersonal: json["mypersonal"]??null,
    smallText: json["smalltext"]??"",
    activetillDate: json["activetilldate"]??"",
    iconPath: json["iconpath"]??"",
    commanLine: json["commanline"]??"",
    activeFlage: json["activE_FLAG"]??0,
    metaTitle: json["metatitle"],
    metaKeyword: json["metakeyword"],
    metaDescription: json["metadescription"],
    headerVisibleData: json["headervisibledata"],
    headerInvisibleData: json["headerinvisibledata"],
    footerVisibleData: json["footervisibledata"],
    footerInvisibleData: json["footerinvisibledata"],
    refID: json["refid"]??0,
    myBusID: json["mybusid"]??0,
    lableFlag: json["lableflag"]??0,
    sp1: json["sP1"]??0,
    sp2: json["sP2"]??0,
    sp3: json["sP3"]??0,
    sp4: json["sP4"]??0,
    sp5: json["sP5"]??0,
    sp1Name: json["sP1Name"]??"",
    sp2Name: json["sP2Name"]??"",
    sp3Name: json["sP3Name"]??"",
    sp4Name: json["sP4Name"]??"",
    sp5Name: json["sP5Name"]??"",
    activeMenu:json["activeMenu"] != null 
          ? json["activeMenu"] as bool 
          : false,
    menuDate: json["menudate"]!= null
    ? (json["menudate"] is int
        ? json["menudate"] as int
        : int.tryParse(json["menudate"].toString()))
    : null,
    menuLevel: json["menu_Level"]??0,
  );

  Map<String, dynamic> toJson() => {
    "tenentID": tenentID,
    "menU_ID": menuID,
    "masteR_ID": masterID,
    "modulE_ID": moduleID,
    "menU_TYPE": menuType,
    "menU_NAMEEnglish": menuNameEnglish,
    "menU_NAMEArabic": menuNameArabic,
    "fulL_NAME": fullName,
    "link": link,
    "urloption": urlOption,
    "urlrewrite": urlRewrite,
    "menU_LOCATION": menuLocation,
    "menU_ORDER": menuOrder,
    "doC_PARENT": docParent,
    "cruP_ID": crupID,
    "addflage": addFlage,
    "editflage": editFlage,
    "delflage": delFlage,
    "printflage": printFlage,
    "amiglobale": amiGlobale,
    "mypersonal": myPersonal,
    "smalltext": smallText,
    "activetilldate": activetillDate,
    "iconpath": iconPath,
    "commanline": commanLine,
    "activE_FLAG": activeFlage,
    "metatitle": metaTitle,
    "metakeyword": metaKeyword,
    "metadescription": metaDescription,
    "headervisibledata": headerVisibleData,
    "headerinvisibledata": headerInvisibleData,
    "footervisibledata": footerVisibleData,
    "footerinvisibledata": footerInvisibleData,
    "refid": refID,
    "mybusid": myBusID,
    "lableflag": lableFlag,
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
    "activemenu": activeMenu,
    "menudate": menuDate,
    "menu_Level": menuLevel,
  };
  Map<String, dynamic> toMap() => {
    Constants.tenentID: tenentID,
    Constants.menuID: menuID,
    Constants.masterID: masterID,
    Constants.moduleID: moduleID,
    Constants.menuType: menuType,
    Constants.menuLevel: menuLevel,
    Constants.menuNameEnglish: menuNameEnglish,
    Constants.menuNameArabic: menuNameArabic,
    Constants.fullName: fullName,
    Constants.link: link,
    Constants.urlOption: urlOption,
    Constants.urlRewrite: urlRewrite,
    Constants.menuLocation: menuLocation,
    Constants.menuOrder: menuOrder,
    Constants.docParent: docParent,
    Constants.crupID: crupID,
    Constants.addFlage: addFlage,
    Constants.editFlage: editFlage,
    Constants.delFlage: delFlage,
    Constants.printFlage: printFlage,
    Constants.amiGlobale: amiGlobale,
    Constants.myPERSONAL: myPersonal,
    Constants.smallTEXT: smallText,
    Constants.activeTILLDATE: activetillDate,
    Constants.iconPath: iconPath,
    Constants.commanLine: commanLine,
    Constants.activeFLAG: activeFlage,
    Constants.metaTitle: metaTitle,
    Constants.metaKeyWord: metaKeyword,
    Constants.metaDescription: metaDescription,
    Constants.headerVisibleData: headerVisibleData,
    Constants.headerInVisibleData: headerInvisibleData,
    Constants.footerVisibleData: footerVisibleData,
    Constants.footerInVisibleData: footerInvisibleData,
    Constants.refID: refID,
    Constants.myBusID: myBusID,
    Constants.lableFlag: lableFlag,
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
    Constants.activeMenu: activeMenu,
    Constants.menuDate: menuDate,
  };
}
