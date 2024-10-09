import 'dart:convert';

class TransactionHddmsModel {
    final int tenentId;
    final int mytransid;
    final int attachId;
    final int serialno;
    final int documentType;
    final String attachmentPath;
    final String attachmentByName;
    final dynamic attachmentsDetail;
    final bool actived;
    final dynamic deleted;
    final DateTime createdDate;
    final String createdBy;
    final int crupId;
    final dynamic shareId;
    final dynamic catid;
    final String subject;
    final dynamic keywords;
    final String metaTags;
    final String remarks;
    final dynamic action;
    final dynamic routId;

    TransactionHddmsModel({
        required this.tenentId,
        required this.mytransid,
        required this.attachId,
        required this.serialno,
        required this.documentType,
        required this.attachmentPath,
        required this.attachmentByName,
        required this.attachmentsDetail,
        required this.actived,
        required this.deleted,
        required this.createdDate,
        required this.createdBy,
        required this.crupId,
        required this.shareId,
        required this.catid,
        required this.subject,
        required this.keywords,
        required this.metaTags,
        required this.remarks,
        required this.action,
        required this.routId,
    });

    factory TransactionHddmsModel.fromJson(String str) => TransactionHddmsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TransactionHddmsModel.fromMap(Map<String, dynamic> json) => TransactionHddmsModel(
        tenentId: json["tenentId"],
        mytransid: json["mytransid"],
        attachId: json["attachId"],
        serialno: json["serialno"],
        documentType: json["documentType"],
        attachmentPath: json["attachmentPath"],
        attachmentByName: json["attachmentByName"],
        attachmentsDetail: json["attachmentsDetail"],
        actived: json["actived"],
        deleted: json["deleted"],
        createdDate: DateTime.parse(json["createdDate"]),
        createdBy: json["createdBy"],
        crupId: json["crupId"],
        shareId: json["shareId"],
        catid: json["catid"],
        subject: json["subject"],
        keywords: json["keywords"],
        metaTags: json["metaTags"],
        remarks: json["remarks"],
        action: json["action"],
        routId: json["routId"],
    );

    Map<String, dynamic> toMap() => {
        "TenentID": tenentId,
        "MYTRANSID": mytransid,
        "AttachID": attachId,
        "Serialno": serialno,
        "DocumentType": documentType,
        "AttachmentPath": attachmentPath,
        "AttachmentByName": attachmentByName,
        "AttachmentsDetail": attachmentsDetail,
        "Actived": actived,
        "Deleted": deleted,
        "CreatedDate": createdDate.toIso8601String(),
        "CreatedBy": createdBy,
        "CRUP_ID": crupId,
        "ShareID": shareId,
        "CATID": catid,
        "Subject": subject,
        "Keywords": keywords,
        "MetaTags": metaTags,
        "Remarks": remarks,
        "Action": action,
        "RoutID": routId,
    };
}
