import '../../app/server/database/db_constant.dart';

class KUPFImageModel {
  final int tenetID;
  final int serviceID;
  final int imageID;
  final int myUniqueID;
  final int? sortNumber;
  final String? picture;
  final String? subImage1;
  final String? subImage2;
  final String? subImage3;
  final String? subImage4;
  final String? active;
  final int crupID;

  KUPFImageModel({
    required this.tenetID,
    required this.serviceID,
    required this.imageID,
    required this.myUniqueID,
    this.sortNumber,
    this.picture,
    this.subImage1,
    this.subImage2,
    this.subImage3,
    this.subImage4,
    this.active,
    required this.crupID,
  });

  factory KUPFImageModel.fromMap(Map<String, dynamic> map) => KUPFImageModel(
        tenetID: map[Constants.tenentID],
        serviceID: map[Constants.serviceID],
        imageID: map[Constants.imageID],
        myUniqueID: map[Constants.myUniqueID],
        sortNumber: map[Constants.sortNumber],
        picture: map[Constants.picture.toUpperCase()],
        subImage1: map[Constants.subImage1],
        subImage2: map[Constants.subImage2],
        subImage3: map[Constants.subImage3],
        subImage4: map[Constants.subImage4],
        active: map[Constants.imageActive],
        crupID: map[Constants.crupID],
      );

  Map<String, dynamic> toMap() => {
    Constants.tenentID: tenetID,
    Constants.serviceID: serviceID,
    Constants.imageID: imageID,
    Constants.myUniqueID: myUniqueID,
    Constants.sortNumber: sortNumber,
    Constants.picture.toUpperCase(): picture,
    Constants.subImage1: subImage1,
    Constants.subImage2: subImage2,
    Constants.subImage3: subImage3,
    Constants.subImage4: subImage4,
    Constants.imageActive: active,
    Constants.crupID: crupID,
  };
}
