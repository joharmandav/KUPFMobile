import 'dart:convert';

class WebContentModel {
    final int contentId;
    final int tenentId;
    final int navbarMenuId;
    final int contentType;
    final String active;
    final String tab1;
    final String tab2;
    final String tab3;
    final String tab4;
    final String tab5;
    final dynamic tab6;
    final dynamic mainBannerImage1;
    final dynamic mainBannerImage2;
    final dynamic mainBannerImage3;
    final dynamic mainBannerImage4;
    final dynamic textOverlay1;
    final dynamic textOverlay2;
    final dynamic textOverlay3;
    final dynamic textOverlay4;
    final dynamic textOverlay5;
    final String heading1;
    final dynamic heading2;
    final dynamic subHeading1;
    final dynamic subHeading2;
    final String paragraph1;
    final String paragraph2;
    final String paragraph3;
    final String paragraph4;
    final String sideImages1;
    final dynamic sideImages2;
    final dynamic sideImages3;
    final dynamic sideImages4;
    final dynamic sideImages5;
    final dynamic icons1;
    final dynamic icons2;
    final dynamic icons3;
    final dynamic icons4;
    final DateTime? contentDate1;
    final DateTime? contentDate2;
    final DateTime? contentDate3;
    final DateTime? contentDate4;
    final dynamic menuName;
    final dynamic subMenuName;
    final dynamic subMenuName1;
    final dynamic websiteIcon;
    final dynamic favicon;
    final dynamic tableTitle;
    final dynamic tableDescription;
    final dynamic tableLink;
    final dynamic tableImageUrl;
    final DateTime? createdDate;
    final DateTime? updatedDate;
    final dynamic arabicTextOverlay1;
    final dynamic arabicTextOverlay2;
    final dynamic arabicTextOverlay3;
    final dynamic arabicTextOverlay4;
    final dynamic arabicTextOverlay5;
    final dynamic arabicHeading1;
    final dynamic arabicHeading2;
    final dynamic arabicSubHeading1;
    final dynamic arabicSubHeading2;
    final String arabicParagraph1;
    final String arabicParagraph2;
    final String arabicParagraph3;
    final dynamic arabicParagraph4;
    final dynamic arabicMenuName;
    final dynamic arabicSubMenuName;
    final dynamic arabicSubMenuName1;
    final dynamic arabicTableTitle;
    final dynamic arabicTableDescription;
    final String pageName;
    final String pagePath;
    final int pageId;

    WebContentModel({
        required this.contentId,
        required this.tenentId,
        required this.navbarMenuId,
        required this.contentType,
        required this.active,
        required this.tab1,
        required this.tab2,
        required this.tab3,
        required this.tab4,
        required this.tab5,
        required this.tab6,
        required this.mainBannerImage1,
        required this.mainBannerImage2,
        required this.mainBannerImage3,
        required this.mainBannerImage4,
        required this.textOverlay1,
        required this.textOverlay2,
        required this.textOverlay3,
        required this.textOverlay4,
        required this.textOverlay5,
        required this.heading1,
        required this.heading2,
        required this.subHeading1,
        required this.subHeading2,
        required this.paragraph1,
        required this.paragraph2,
        required this.paragraph3,
        required this.paragraph4,
        required this.sideImages1,
        required this.sideImages2,
        required this.sideImages3,
        required this.sideImages4,
        required this.sideImages5,
        required this.icons1,
        required this.icons2,
        required this.icons3,
        required this.icons4,
        required this.contentDate1,
        required this.contentDate2,
        required this.contentDate3,
        required this.contentDate4,
        required this.menuName,
        required this.subMenuName,
        required this.subMenuName1,
        required this.websiteIcon,
        required this.favicon,
        required this.tableTitle,
        required this.tableDescription,
        required this.tableLink,
        required this.tableImageUrl,
        required this.createdDate,
        required this.updatedDate,
        required this.arabicTextOverlay1,
        required this.arabicTextOverlay2,
        required this.arabicTextOverlay3,
        required this.arabicTextOverlay4,
        required this.arabicTextOverlay5,
        required this.arabicHeading1,
        required this.arabicHeading2,
        required this.arabicSubHeading1,
        required this.arabicSubHeading2,
        required this.arabicParagraph1,
        required this.arabicParagraph2,
        required this.arabicParagraph3,
        required this.arabicParagraph4,
        required this.arabicMenuName,
        required this.arabicSubMenuName,
        required this.arabicSubMenuName1,
        required this.arabicTableTitle,
        required this.arabicTableDescription,
        required this.pageName,
        required this.pagePath,
        required this.pageId,
    });

    factory WebContentModel.fromJson(String str) => WebContentModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory WebContentModel.fromMap(Map<String, dynamic> json) => WebContentModel(
        contentId: json["contentId"]??0,
        tenentId: json["tenentID"]??0,
        navbarMenuId: json["navbarMenuId"]??0,
        contentType: json["contentType"]??0,
        active: json["active"]??"",
        tab1: json["tab1"]??"",
        tab2: json["tab2"]??"",
        tab3: json["tab3"]??"",
        tab4: json["tab4"]??"",
        tab5: json["tab5"]??"",
        tab6: json["tab6"]??"",
        mainBannerImage1: json["mainBannerImage1"] !=null ? json['mainBannerImage1'] as String:null,
        mainBannerImage2: json["mainBannerImage2"] !=null ? json['mainBannerImage2'] as String:null,
        mainBannerImage3: json["mainBannerImage3"] !=null ? json['mainBannerImage3'] as String:null,
        mainBannerImage4: json["mainBannerImage4"] !=null ? json['mainBannerImage4'] as String:null,
        textOverlay1: json["textOverlay1"] !=null ? json['textOverlay1'] as String:null,
        textOverlay2: json["textOverlay2"] !=null ? json['textOverlay2'] as String:null,
        textOverlay3: json["textOverlay3"] !=null ? json['textOverlay3'] as String:null,
        textOverlay4: json["textOverlay4"] !=null ? json['textOverlay4'] as String:null,
        textOverlay5: json["textOverlay5"] !=null ? json['textOverlay5'] as String:null,
        heading1: json["heading1"]??"",
        heading2: json["heading2"]!=null ? json['heading2'] as String:null,
        subHeading1: json["subHeading1"]!=null ? json['subHeading1'] as String:null,
        subHeading2: json["subHeading2"]!=null ? json['subHeading2'] as String:null,
        paragraph1: json["paragraph1"]??"",
        paragraph2: json["paragraph2"]??"",
        paragraph3: json["paragraph3"]??"",
        paragraph4: json["paragraph4"]??"",
        sideImages1: json["sideImages1"]??"",
        sideImages2:  json["sideImages2"]!=null ? json['sideImages2'] as String:null,
        sideImages3: json["sideImages3"]!=null?json['sideImages3']as String :null,
        sideImages4: json["sideImages4"]!=null?json['sideImages4']as String :null,
        sideImages5: json["sideImages5"]!=null?json['sideImages5']as String :null,
        icons1: json["icons1"]!=null ? json['icons1'] as String:null,
        icons2: json["icons2"]!=null ? json['icons2'] as String:null,
        icons3: json["icons3"]!=null ? json['icons3'] as String:null,
        icons4: json["icons4"]!=null ? json['icons4'] as String:null,
        contentDate1: json['contentDate1']!=null ?DateTime.tryParse(json['contentDate1']):null,
        contentDate2: json['contentDate2']!=null ?DateTime.tryParse(json['contentDate2']):null,
        contentDate3: json['contentDate3']!=null ?DateTime.tryParse(json['contentDate3']):null,
       
      
        // somen times has date sometime
         contentDate4: json['contentDate4'] != null
          ? DateTime.parse(json['contentDate4'])
          : null,  
        menuName: json["menuName"]!=null ? json['menuName'] as String:null,
        subMenuName: json["subMenuName"]!=null ? json['subMenuName'] as String:null,
        subMenuName1: json["subMenuName1"]!=null ? json['subMenuName1'] as String:null,
        websiteIcon: json["websiteIcon"]!=null ? json['websiteIcon'] as String:null,
        favicon: json["favicon"]!=null ? json['favicon'] as String:null,
        tableTitle: json["tableTitle"]!=null ? json['tableTitle'] as String:null,
        tableDescription: json["tableDescription"]!=null ? json['tableDescription'] as String:null,
        tableLink: json["tableLink"]!=null ? json['tableLink'] as String:null,
        tableImageUrl: json["tableImageUrl"]!=null ? json['tableImageUrl'] as String:null,
        createdDate:json['createdDate']!=null ?DateTime.tryParse(json['createdDate']):null,
        updatedDate: json['updatedDate']!=null ?DateTime.tryParse(json['updatedDate']):null,
        arabicTextOverlay1: json["arabic_TextOverlay1"] !=null ? json['arabic_TextOverlay1'] as String:null,
        arabicTextOverlay2: json["arabic_TextOverlay2"]!=null ? json['arabic_TextOverlay2'] as String:null,
        arabicTextOverlay3: json["arabic_TextOverlay3"]!=null ? json['arabic_TextOverlay3'] as String:null,
        arabicTextOverlay4: json["arabic_TextOverlay4"]!=null ? json['arabic_TextOverlay4'] as String:null,
        arabicTextOverlay5: json["arabic_TextOverlay5"]!=null ? json['arabic_TextOverlay5'] as String:null,
        arabicHeading1: json["arabic_Heading1"]!=null ? json['arabic_Heading1'] as String:null,
        arabicHeading2: json["arabic_Heading2"]!=null ? json['arabic_Heading2'] as String:null,
        arabicSubHeading1: json["arabic_SubHeading1"]!=null ? json['arabic_SubHeading1'] as String:null,
        arabicSubHeading2: json["arabic_SubHeading2"]!=null ? json['arabic_SubHeading2'] as String:null,
        arabicParagraph1: json["arabic_Paragraph1"]??"",
        arabicParagraph2: json["arabic_Paragraph2"]??"",
        arabicParagraph3: json["arabic_Paragraph3"]??"",
        arabicParagraph4: json["arabic_Paragraph4"]!=null ? json['arabic_Paragraph4'] as String:null,
        arabicMenuName: json["arabic_MenuName"]!=null ? json['arabic_MenuName'] as String:null,
        arabicSubMenuName: json["arabic_SubMenuName"]!=null ? json['arabic_SubMenuName'] as String:null,
        arabicSubMenuName1: json["arabic_SubMenuName1"]!=null ? json['arabic_SubMenuName1'] as String:null,
        arabicTableTitle: json["arabic_TableTitle"]!=null ? json['arabic_TableTitle'] as String:null,
        arabicTableDescription: json["arabic_TableDescription"]!=null ? json['arabic_TableDescription'] as String:null,
        pageName: json["pageName"]??"",
        pagePath: json["pagePath"]??"",
        pageId: json["pageId"]??0,
    );

    Map<String, dynamic> toMap() => {
        "contentId": contentId,
        "tenentID": tenentId,
        "navbarMenuId": navbarMenuId,
        "contentType": contentType,
        "active": active,
        "tab1": tab1,
        "tab2": tab2,
        "tab3": tab3,
        "tab4": tab4,
        "tab5": tab5,
        "tab6": tab6,
        "mainBannerImage1": mainBannerImage1,
        "mainBannerImage2": mainBannerImage2,
        "mainBannerImage3": mainBannerImage3,
        "mainBannerImage4": mainBannerImage4,
        "textOverlay1": textOverlay1,
        "textOverlay2": textOverlay2,
        "textOverlay3": textOverlay3,
        "textOverlay4": textOverlay4,
        "textOverlay5": textOverlay5,
        "heading1": heading1,
        "heading2": heading2,
        "subHeading1": subHeading1,
        "subHeading2": subHeading2,
        "paragraph1": paragraph1,
        "paragraph2": paragraph2,
        "paragraph3": paragraph3,
        "paragraph4": paragraph4,
        "sideImages1": sideImages1,
        "sideImages2": sideImages2,
        "sideImages3": sideImages3,
        "sideImages4": sideImages4,
        "sideImages5": sideImages5,
        "icons1": icons1,
        "icons2": icons2,
        "icons3": icons3,
        "icons4": icons4,
        "contentDate1": contentDate1?.toIso8601String(),
        "contentDate2": contentDate2?.toIso8601String(),
        "contentDate3": contentDate3?.toIso8601String(),
        "contentDate4": contentDate4?.toIso8601String(),
        "menuName": menuName,
        "subMenuName": subMenuName,
        "subMenuName1": subMenuName1,
        "websiteIcon": websiteIcon,
        "favicon": favicon,
        "tableTitle": tableTitle,
        "tableDescription": tableDescription,
        "tableLink": tableLink,
        "tableImageUrl": tableImageUrl,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
        "arabic_TextOverlay1": arabicTextOverlay1,
        "arabic_TextOverlay2": arabicTextOverlay2,
        "arabic_TextOverlay3": arabicTextOverlay3,
        "arabic_TextOverlay4": arabicTextOverlay4,
        "arabic_TextOverlay5": arabicTextOverlay5,
        "arabic_Heading1": arabicHeading1,
        "arabic_Heading2": arabicHeading2,
        "arabic_SubHeading1": arabicSubHeading1,
        "arabic_SubHeading2": arabicSubHeading2,
        "arabic_Paragraph1": arabicParagraph1,
        "arabic_Paragraph2": arabicParagraph2,
        "arabic_Paragraph3": arabicParagraph3,
        "arabic_Paragraph4": arabicParagraph4,
        "arabic_MenuName": arabicMenuName,
        "arabic_SubMenuName": arabicSubMenuName,
        "arabic_SubMenuName1": arabicSubMenuName1,
        "arabic_TableTitle": arabicTableTitle,
        "arabic_TableDescription": arabicTableDescription,
        "pageName": pageName,
        "pagePath": pagePath,
        "pageId": pageId,
    };
}
