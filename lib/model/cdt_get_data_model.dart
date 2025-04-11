// To parse this JSON data, do
//
//     final cdtGetDataModel = cdtGetDataModelFromJson(jsonString);

import 'dart:convert';

List<CdtGetDataModel> cdtGetDataModelFromJson(String str) => List<CdtGetDataModel>.from(json.decode(str).map((x) => CdtGetDataModel.fromJson(x)));

String cdtGetDataModelToJson(List<CdtGetDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CdtGetDataModel {
    final String id;
    final int srNo;
    final String branchDiv;
    final String uid;
    final int rollNo;
    final String studentName;
    final int trainBatch;
    final int? cdtAttendance;
    final int? cdtTestMarks;
    final int v;

    CdtGetDataModel({
        required this.id,
        required this.srNo,
        required this.branchDiv,
        required this.uid,
        required this.rollNo,
        required this.studentName,
        required this.trainBatch,
        this.cdtAttendance,
        this.cdtTestMarks,
        required this.v,
    });

    factory CdtGetDataModel.fromJson(Map<String, dynamic> json) => CdtGetDataModel(
        id: json["_id"],
        srNo: json["sr_no"],
        branchDiv: json["branch_div"],
        uid: json["uid"],
        rollNo: json["roll_no"],
        studentName: json["student_name"],
        trainBatch: json["train_batch"],
        cdtAttendance: json["cdt_attendance"],
        cdtTestMarks: json["cdt_test_marks"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "sr_no": srNo,
        "branch-div": branchDiv,
        "uid": uid,
        "roll_no": rollNo,
        "student_name ": studentName,
        "train_batch": trainBatch,
        "cdt_attendance": cdtAttendance,
        "cdt_test_marks": cdtTestMarks,
        "__v": v,
    };
}
