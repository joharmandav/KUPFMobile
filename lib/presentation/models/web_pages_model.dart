import '../../app/server/database/db_constant.dart';

class WebPagesModel {
  final int webPageID;
  final int parentID;
  final int isVisible;
  final String pageIcon;
  final int pageOrder;
  final String pageTitle;
  final String? controllerName;
  final String? viewName;
  final String? description;
  final String arabicPageTitle;

  WebPagesModel({
    required this.webPageID,
    required this.parentID,
    required this.isVisible,
    required this.pageIcon,
    required this.pageOrder,
    required this.pageTitle,
    this.controllerName,
    this.viewName,
    this.description,
    required this.arabicPageTitle,
  });

  factory WebPagesModel.fromMap(Map<String, dynamic> map) => WebPagesModel(
        webPageID: map[Constants.webPageID]??0,
        parentID: map[Constants.parentID]??0,
        isVisible: map[Constants.isVisible]??0,
        pageIcon: map[Constants.pageIcon]??"",
        pageOrder: map[Constants.pageOrder]??0,
        pageTitle: map[Constants.pageTitle]??"",
        controllerName: map[Constants.controllerName]??"",
        viewName: map[Constants.viewName]??"",
        description: map[Constants.description]??"",
        arabicPageTitle: map[Constants.arabicPageTitle]??"",
      );

  Map<String, dynamic> toMap() => {
        Constants.webPageID: webPageID,
        Constants.parentID: parentID,
        Constants.isVisible: isVisible,
        Constants.pageIcon: pageIcon,
        Constants.pageOrder: pageOrder,
        Constants.pageTitle: pageTitle,
        Constants.controllerName: controllerName,
        Constants.viewName: viewName,
        Constants.description: description,
        Constants.arabicPageTitle: arabicPageTitle,
      };
}


