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
    final int mobileNo;
    final String email;
    final int attendance;
    final int testMarks;
    final int category;
    final int v;

    ActGetDataModel({
        required this.id,
        required this.srNo,
        required this.branchDiv,
        required this.uid,
        required this.rollNo,
        required this.studentName,
        required this.mobileNo,
        required this.email,
        required this.attendance,
        required this.testMarks,
        required this.category,
        required this.v,
    });

    factory ActGetDataModel.fromJson(Map<String, dynamic> json) => ActGetDataModel(
        id: json["_id"],
        srNo: json["srNo"],
        // branchDiv: branchDivValues.map[json["branchDiv"]]!,
        branchDiv: json["branchDiv"],
        uid: json["UID"],
        rollNo: json["rollNo"],
        studentName: json["studentName"],
        mobileNo: json["mobileNo"],
        email: json["email"],
        attendance: json["attendance"],
        testMarks: json["testMark"],
        category: json["category"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "srNo": srNo,
        "branchDiv": branchDiv,
        "UID": uid,
        "rollNo": rollNo,
        " studentName": studentName,
        "mobileNo": mobileNo,
        "email": email,
        "attendance": attendance,
        "test-marks": testMarks,
        "category": category,
        "__v": v,
    };
}
