// To parse this JSON data, do
//
//     final actGetDataModel = actGetDataModelFromJson(jsonString);

import 'dart:convert';

List<ActGetDataModel> actGetDataModelFromJson(String str) => List<ActGetDataModel>.from(json.decode(str).map((x) => ActGetDataModel.fromJson(x)));

String actGetDataModelToJson(List<ActGetDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActGetDataModel {
    final String id;
    final int srNo;
    final String branchDiv;
    final String uid;
    final int rollNo;
    final String studentName;
    final int trainBatch;
    final int actAttendance;
    final int actTestMarks;
    final int v;

    ActGetDataModel({
        required this.id,
        required this.srNo,
        required this.branchDiv,
        required this.uid,
        required this.rollNo,
        required this.studentName,
        required this.trainBatch,
        required this.actAttendance,
        required this.actTestMarks,
        required this.v,
    });

    factory ActGetDataModel.fromJson(Map<String, dynamic> json) => ActGetDataModel(
        id: json["_id"],
        srNo: json["sr_no"],
        branchDiv: json["branch_div"],
        uid: json["uid"],
        rollNo: json["roll_no"],
        studentName: json["student_name"],
        trainBatch: json["train_batch"],
        actAttendance: json["act_attendance"],
        actTestMarks: json["act_test_marks"],
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
        "act_attendance": actAttendance,
        "act_test_marks": actTestMarks,
        "__v": v,
    };
}
