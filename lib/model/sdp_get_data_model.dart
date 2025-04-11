// To parse this JSON data, do
//
//     final sdpGetDataModel = sdpGetDataModelFromJson(jsonString);

import 'dart:convert';

List<SdpGetDataModel> sdpGetDataModelFromJson(String str) => List<SdpGetDataModel>.from(json.decode(str).map((x) => SdpGetDataModel.fromJson(x)));

String sdpGetDataModelToJson(List<SdpGetDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SdpGetDataModel {
    final String id;
    final int srNo;
    final String branchDiv;
    final String uid;
    final int rollNo;
    final String studentName;
    final int trainBatch;
    final int sdpAttendance;
    final int v;

    SdpGetDataModel({
        required this.id,
        required this.srNo,
        required this.branchDiv,
        required this.uid,
        required this.rollNo,
        required this.studentName,
        required this.trainBatch,
        required this.sdpAttendance,
        required this.v,
    });

    factory SdpGetDataModel.fromJson(Map<String, dynamic> json) => SdpGetDataModel(
        id: json["_id"],
        srNo: json["sr_no"],
        branchDiv: json["branch-div"],
        uid: json["uid"],
        rollNo: json["roll_no"],
        studentName: json["student_name "],
        trainBatch: json["train_batch"],
        sdpAttendance: json["sdp_attendance"],
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
        "sdp_attendance": sdpAttendance,
        "__v": v,
    };
}
