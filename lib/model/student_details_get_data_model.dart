// To parse this JSON data, do
//
//     final studentDetailsGetDataModel = studentDetailsGetDataModelFromJson(jsonString);

import 'dart:convert';

List<StudentDetailsGetDataModel> studentDetailsGetDataModelFromJson(String str) => List<StudentDetailsGetDataModel>.from(json.decode(str).map((x) => StudentDetailsGetDataModel.fromJson(x)));

String studentDetailsGetDataModelToJson(List<StudentDetailsGetDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentDetailsGetDataModel {
    final String id;
    final int srNo;
    final String branchDiv;
    final String uid;
    final int rollNo;
    final String studentName;
    final int mobileNo;
    final String emailId;
    final int actAttendance;
    final int actTestMarks;
    final int cdtAttendance;
    final int cdtTestMarks;
    final int sdpAttendance;
    final int trainBatch;
    final String domain;
    final int category;
    final String placedComp;
    final int package;
    final String role;
    final int v;

    StudentDetailsGetDataModel({
        required this.id,
        required this.srNo,
        required this.branchDiv,
        required this.uid,
        required this.rollNo,
        required this.studentName,
        required this.mobileNo,
        required this.emailId,
        required this.actAttendance,
        required this.actTestMarks,
        required this.cdtAttendance,
        required this.cdtTestMarks,
        required this.sdpAttendance,
        required this.trainBatch,
        required this.domain,
        required this.category,
        required this.placedComp,
        required this.package,
        required this.role,
        required this.v,
    });

    factory StudentDetailsGetDataModel.fromJson(Map<String, dynamic> json) => StudentDetailsGetDataModel(
        id: json["_id"],
        srNo: json["sr_no"],
        branchDiv: json["branch_div"],
        uid: json["uid"],
        rollNo: json["roll_no"],
        studentName: json["student_name"],
        mobileNo: json["mobile_no"],
        emailId: json["email_id"],
        actAttendance: json["act_attendance"],
        actTestMarks: json["act_test_marks"],
        cdtAttendance: json["cdt_attendance"],
        cdtTestMarks: json["cdt_test_marks"],
        sdpAttendance: json["sdp_attendance"],
        trainBatch: json["train_batch"],
        domain: json["domain"],
        category: json["category"],
        placedComp: json["placed_comp"],
        package: json["package_lpa"],
        role: json["role"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "sr_no": srNo,
        "branch-div": branchDiv,
        "uid": uid,
        "roll_no": rollNo,
        "student_name ": studentName,
        "mobile_no": mobileNo,
        "email_id": emailId,
        "act_attendance": actAttendance,
        "act_test_marks": actTestMarks,
        "cdt_attendance": cdtAttendance,
        "cdt_test_marks": cdtTestMarks,
        "sdp_attendance": sdpAttendance,
        "train_batch": trainBatch,
        "domain": domain,
        "category": category,
        "placed_comp": placedComp,
        "package": package,
        "role": role,
        "__v": v,
    };
}
