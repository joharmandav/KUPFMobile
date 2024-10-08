import '../../app/server/database/db_constant.dart';

class RefTableModel {
  final int tenentId;
  final int refid;
  final String reftype;
  final String refsubtype;
  final String shortname;
  final String refname1;
  final String refname2;
  final String refname3;
  final dynamic switch1; // Can be a String or another type
  final dynamic switch2; // Can be DateTime, String, or null
  final dynamic switch3; // Can be DateTime, String, or null
  final dynamic switch4; // Can be an integer or something else
  final String? remarks;
  final String? active;
  final int? crupId;
  final String? infrastructure;
  final String? refImage;
  final DateTime? uploadDate;
  final String? uploadby;
  final DateTime? syncDate;
  final String? syncby;
  final int? synId;

  RefTableModel({
    required this.tenentId,
    required this.refid,
    required this.reftype,
    required this.refsubtype,
    required this.shortname,
    required this.refname1,
    required this.refname2,
    required this.refname3,
    this.switch1,
    this.switch2,
    this.switch3,
    this.switch4,
    this.remarks,
    this.active,
    this.crupId,
    this.infrastructure,
    this.refImage,
    this.uploadDate,
    this.uploadby,
    this.syncDate,
    this.syncby,
    this.synId,
  });

  factory RefTableModel.fromMap(Map<String, dynamic> map) {
    return RefTableModel(
      tenentId: map['tenentId'] ?? 0,
      refid: map['refid'] ?? 0,
      reftype: map['reftype'] ?? '',
      refsubtype: map['refsubtype'] ?? '',
      shortname: map['shortname'] ?? '',
      refname1: map['refname1'] ?? '',
      refname2: map['refname2'] ?? '',
      refname3: map['refname3'] ?? '',
      switch1: map['switch1'], 
      switch2: _parseSwitch(map['switch2']), 
      switch3: _parseSwitch(map['switch3']),
      switch4: map['switch4'], 
      remarks: map['remarks'],
      active: map['active'],
      crupId: map['crupId'],
      infrastructure: map['infrastructure'],
      refImage: map['refImage'],
      uploadDate: _parseDateTime(map['uploadDate']), 
      uploadby: map['uploadby'],
      syncDate: _parseDateTime(map['syncDate']),
      syncby: map['syncby'],
      synId: map['synId'],
    );
  }

  // Method to map the model back to a map for database insertion
  
   Map<String, dynamic> toMap() => {
    Constants.tenentID: tenentId,
    Constants.refID: refid,
    Constants.refType: reftype,
    Constants.refSubType: refsubtype,
    Constants.shortName: shortname,
    Constants.refName1: refname1,
    Constants.refName2: refname2,
    Constants.refName3: refname3,
    Constants.switchName1: switch1,
    Constants.switchName2: switch2 is DateTime ?(switch2 as DateTime).toIso8601String():switch2,
    Constants.switchName3: switch3 is DateTime ?(switch3 as DateTime).toIso8601String():switch3,
    Constants.switchName4: switch4,
    Constants.remarks: remarks,
    Constants.active: active,
    Constants.crupID: crupId,
    Constants.infrastructure: infrastructure,
    Constants.refImage: refImage,
    Constants.uploadDate: uploadDate is DateTime ?(uploadDate as DateTime).toIso8601String():uploadDate,
    Constants.uploadBY: uploadby,
    Constants.syncDate: syncDate is DateTime ?(syncDate as DateTime).toIso8601String():syncDate,
    Constants.syncBY: syncby,
    Constants.synID: synId,
  };
  // Map<String, dynamic> toMap() {
  //   return {
  //     'tenentId': tenentId,
  //     'refid': refid,
  //     'reftype': reftype,
  //     'refsubtype': refsubtype,
  //     'shortname': shortname,
  //     'refname1': refname1,
  //     'refname2': refname2,
  //     'refname3': refname3,
  //     'switch1': switch1,
  //     'switch2': switch2 is DateTime ? (switch2 as DateTime).toIso8601String() : switch2,
  //     'switch3': switch3 is DateTime ? (switch3 as DateTime).toIso8601String() : switch3,
  //     'switch4': switch4,
  //     'remarks': remarks,
  //     'active': active,
  //     'crupId': crupId,
  //     'infrastructure': infrastructure,
  //     'refImage': refImage,
  //     'uploadDate': uploadDate?.toIso8601String(),
  //     'uploadby': uploadby,
  //     'syncDate': syncDate?.toIso8601String(),
  //     'syncby': syncby,
  //     'synId': synId,
  //   };
  // }

  // Helper method to handle dynamic date parsing
  static dynamic _parseSwitch(dynamic switchValue) {
    if (switchValue is String) {
      try {
        return DateTime.parse(switchValue); // Try parsing as DateTime
      } catch (e) {
        return switchValue; // Return as String if not a valid DateTime
      }
    }
    return switchValue; // Return as is for non-String values
  }

  // Helper method to parse nullable DateTime fields
  static DateTime? _parseDateTime(dynamic dateValue) {
    if (dateValue == null) return null; // Return null if no value
    if (dateValue is String) {
      try {
        return DateTime.parse(dateValue); // Try to parse String to DateTime
      } catch (e) {
        return null; // Return null if invalid date format
      }
    }
    return dateValue is DateTime ? dateValue : null; // Return DateTime if valid
  }
}





  
