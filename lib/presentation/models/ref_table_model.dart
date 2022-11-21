import '../../app/server/database/db_constant.dart';

class RefTableModel {
  final int tenentID;
  final int refID;
  final String refType;
  final String refSubType;
  final String? shortName;
  final String? refName1;
  final String refName2;
  final String refName3;
  final String? switch1;
  final String? switch2;
  final String? switch3;
  final int? switch4;
  final String? remarks;
  final String active;
  final int? crupID;
  final String? infrastructure;
  final String? refImage;
  final String? uploadDate;
  final String? uploadBy;
  final String? syncDate;
  final String? syncBy;
  final int synID;

  RefTableModel({
    required this.tenentID,
    required this.refID,
    required this.refType,
    required this.refSubType,
    required this.shortName,
    required this.refName1,
    required this.refName2,
    required this.refName3,
    required this.switch1,
    required this.switch2,
    required this.switch3,
    required this.switch4,
    required this.remarks,
    required this.active,
    required this.crupID,
    required this.infrastructure,
    required this.refImage,
    required this.uploadDate,
    required this.uploadBy,
    required this.syncDate,
    required this.syncBy,
    required this.synID,
  });

  factory RefTableModel.fromMap(Map<String, dynamic> map) => RefTableModel(
        tenentID: map[Constants.tenentID],
        refID: map[Constants.refID],
        refType: map[Constants.refType],
        refSubType: map[Constants.refSubType],
        shortName: map[Constants.shortName],
        refName1: map[Constants.refName1],
        refName2: map[Constants.refName2],
        refName3: map[Constants.refName3],
        switch1: map[Constants.switchName1],
        switch2: map[Constants.switchName2],
        switch3: map[Constants.switchName3],
        switch4: map[Constants.switchName4],
        remarks: map[Constants.remarks],
        active: map[Constants.active],
        crupID: map[Constants.crupID],
        infrastructure: map[Constants.infrastructure],
        refImage: map[Constants.refImage],
        uploadDate: map[Constants.uploadDate],
        uploadBy: map[Constants.uploadBY],
        syncDate: map[Constants.syncDate],
        syncBy: map[Constants.syncBY],
        synID: map[Constants.synID],
      );

  Map<String, dynamic> toMap() => {
    Constants.tenentID: tenentID,
    Constants.refID: refID,
    Constants.refType: refType,
    Constants.refSubType: refSubType,
    Constants.shortName: shortName,
    Constants.refName1: refName1,
    Constants.refName2: refName2,
    Constants.refName3: refName3,
    Constants.switchName1: switch1,
    Constants.switchName2: switch2,
    Constants.switchName3: switch3,
    Constants.switchName4: switch4,
    Constants.remarks: remarks,
    Constants.active: active,
    Constants.crupID: crupID,
    Constants.infrastructure: infrastructure,
    Constants.refImage: refImage,
    Constants.uploadDate: uploadDate,
    Constants.uploadBY: uploadBy,
    Constants.syncDate: syncDate,
    Constants.syncBY: syncBy,
    Constants.synID: synID,
  };
}
