// To parse this JSON data, do
//
//     final placementRecordsGetDataModel = placementRecordsGetDataModelFromJson(jsonString);

import 'dart:convert';

List<PlacementRecordsGetDataModel> placementRecordsGetDataModelFromJson(String str) => List<PlacementRecordsGetDataModel>.from(json.decode(str).map((x) => PlacementRecordsGetDataModel.fromJson(x)));

String placementRecordsGetDataModelToJson(List<PlacementRecordsGetDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlacementRecordsGetDataModel {
    final String id;
    final int srNo;
    final String branchDiv;
    final String uid;
    final int rollNo;
    final String studentName;
    final int category;
    final String placedComp;
    final int package;
    final String role;
    final int v;

    PlacementRecordsGetDataModel({
        required this.id,
        required this.srNo,
        required this.branchDiv,
        required this.uid,
        required this.rollNo,
        required this.studentName,
        required this.category,
        required this.placedComp,
        required this.package,
        required this.role,
        required this.v,
    });

    factory PlacementRecordsGetDataModel.fromJson(Map<String, dynamic> json) => PlacementRecordsGetDataModel(
        id: json["_id"],
        srNo: json["sr_no"],
        branchDiv: json["branch_div"],
        uid: json["uid"],
        rollNo: json["roll_no"],
        studentName: json["student_name"],
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
        "category": category,
        "placed_comp": placedComp,
        "package": package,
        "role": role,
        "__v": v,
    };
}
