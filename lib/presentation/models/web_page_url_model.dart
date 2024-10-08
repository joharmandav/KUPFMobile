import '../../app/server/database/db_constant.dart';

class WebPageUrlModel {
  final int webPageUrlID;
  final int webPageID;
  final String url;

  WebPageUrlModel({
    required this.webPageUrlID,
    required this.webPageID,
    required this.url,
  });

  factory WebPageUrlModel.fromMap(Map<String, dynamic> map) => WebPageUrlModel(
        webPageUrlID: map[Constants.webPageUrlID],
        webPageID: map[Constants.webPageUID],
        url: map[Constants.url],
      );

  Map<String, dynamic> toMap() => {
    Constants.webPageUrlID: webPageUrlID,
    Constants.webPageUID: webPageID,
    Constants.url: url,
  };
}