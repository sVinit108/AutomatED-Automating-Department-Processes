import 'package:flutter/material.dart';
import 'package:project_ui/APIs/act_apis.dart';
import 'package:project_ui/global.dart';
import 'package:project_ui/pages/home_page.dart';
// import 'package:project_ui/provider/act_get_data_provider.dart';

class DataUpdateFormScreen extends StatefulWidget {
  final String path;

  final String id;
  final int sr_no;
  final String branch_div;
  final String uid;
  final int roll_no;
  final String student_name;
  final double mobile_no;
  final String email_id;
  final int act_attendance;
  final int act_test_marks;
  final int cdt_attendance;
  final int cdt_test_marks;
  final int sdp_attendance;
  final int train_batch;
  final String domain;
  final int category;
  final String placement_company;
  final int package;
  final String role;
  final String userRole;

  const DataUpdateFormScreen({
    super.key,
    required this.path,
    required this.id,
    required this.sr_no,
    required this.branch_div,
    required this.uid,
    required this.roll_no,
    required this.student_name,
    required this.mobile_no,
    required this.email_id,
    required this.act_attendance,
    required this.act_test_marks,
    required this.cdt_attendance,
    required this.cdt_test_marks,
    required this.sdp_attendance,
    required this.train_batch,
    required this.domain,
    required this.category,
    required this.placement_company,
    required this.package,
    required this.role,
    required this.userRole,
  });

  @override
  _DataUpdateFormScreenState createState() => _DataUpdateFormScreenState();
}

class _DataUpdateFormScreenState extends State<DataUpdateFormScreen> {
  Map<String, String> formData = {};

  @override
  Widget build(BuildContext context) {
    int? srNo = widget.sr_no;
    String? branchDiv = widget.branch_div;
    String? uid = widget.uid;
    int? rollNo = widget.roll_no;
    String? studentName = widget.student_name;
    double? mobileNo = widget.mobile_no;
    String? email = widget.email_id;
    int? actAttendance = widget.act_attendance;
    int? actTestMarks = widget.act_test_marks;
    int? cdtAttendance = widget.cdt_attendance;
    int? cdtTestMarks = widget.cdt_test_marks;
    int? sdpAttendance = widget.sdp_attendance;
    int? trainingBatch = widget.train_batch;
    String? domain = widget.domain;
    int? category = widget.category;
    String? placementCompany = widget.placement_company;
    int? package = widget.package;
    String? role = widget.role;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details Form'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width / 2,
          child: SingleChildScrollView(
            child: Container(
              height: 1000,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Sr No',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    controller: TextEditingController(text: srNo.toString()),
                    onChanged: (value) {
                      srNo = int.tryParse(value);
                    },
                  ),
                  const Spacer(),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: 'Branch Division',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    hint: branchDiv.isEmpty
                        ? const Text('Select Branch Division')
                        : Text(branchDiv),
                    items: branchDivOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      branchDiv = value;
                    },
                  ),
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'UID',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    controller: TextEditingController(text: uid),
                    onChanged: (value) {
                      uid = value;
                    },
                  ),
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Roll No',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    controller: TextEditingController(text: rollNo.toString()),
                    onChanged: (value) {
                      rollNo = int.tryParse(value);
                    },
                  ),
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Student Name',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    controller: TextEditingController(text: studentName),
                    onChanged: (value) {
                      studentName = value;
                    },
                  ),
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Mobile No',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    controller:
                        TextEditingController(text: mobileNo.toString()),
                    onChanged: (value) {
                      mobileNo = int.tryParse(value) as double?;
                    },
                  ),
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    controller: TextEditingController(text: email),
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'ACT Attendance %',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    controller:
                        TextEditingController(text: actAttendance.toString()),
                    onChanged: (value) {
                      actAttendance = int.tryParse(value);
                    },
                  ),
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'ACT Test Marks',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    controller:
                        TextEditingController(text: actTestMarks.toString()),
                    onChanged: (value) {
                      actTestMarks = int.tryParse(value);
                    },
                  ),
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'CDT Attendance %',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    controller:
                        TextEditingController(text: cdtAttendance.toString()),
                    onChanged: (value) {
                      cdtAttendance = int.tryParse(value);
                    },
                  ),
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'CDT Test Marks',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    controller:
                        TextEditingController(text: cdtTestMarks.toString()),
                    onChanged: (value) {
                      cdtTestMarks = int.tryParse(value);
                    },
                  ),
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'SDP Attendance %',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    controller:
                        TextEditingController(text: sdpAttendance.toString()),
                    onChanged: (value) {
                      sdpAttendance = int.tryParse(value);
                    },
                  ),
                  const Spacer(),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: 'Training Batch',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    hint: trainingBatch == 0
                        ? const Text('Select Training Batch')
                        : Text(trainingBatch.toString()),
                    items: trainingBarOptions
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      trainingBatch = value;
                    },
                  ),
                  const Spacer(),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: 'Domain',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    hint: domain.isEmpty
                        ? const Text('Select Domain')
                        : Text(domain),
                    items: domainOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      domain = value;
                    },
                  ),
                  const Spacer(),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    hint: category == 1
                        ? const Text('1')
                        : category == 2
                            ? const Text('2')
                            : category == 3
                                ? const Text('3')
                                : const Text('Select Category'),
                    items: [1, 2, 3].map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      category = value;
                    },
                  ),
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Placement Company',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    controller: TextEditingController(text: placementCompany),
                    onChanged: (value) {
                      placementCompany = value;
                    },
                  ),
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Package',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    controller: TextEditingController(text: package.toString()),
                    onChanged: (value) {
                      package = int.tryParse(value);
                    },
                  ),
                  const Spacer(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Role',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    controller: TextEditingController(text: role),
                    onChanged: (value) {
                      role = value;
                    },
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      String path = widget.path;
                      Map<String, String> data = {
                        'id': widget.id,
                        "sr_no": srNo.toString(),
                        "branch_div": branchDiv!,
                        "uid": uid!,
                        "roll_no": rollNo.toString(),
                        "student_name": studentName!,
                        "mobile_no": mobileNo.toString(),
                        "email_id": email!,
                        "act_attendance": actAttendance.toString(),
                        "act_test_marks": actTestMarks.toString(),
                        "cdt_attendance": cdtAttendance.toString(),
                        "cdt_test_marks": cdtTestMarks.toString(),
                        "sdp_attendance": sdpAttendance.toString(),
                        "train_batch": trainingBatch.toString(),
                        "domain": domain.toString(),
                        "category": category.toString(),
                        "placed_comp": placementCompany!,
                        "package_lpa": package.toString(),
                        "role": role!,
                      };
                      // print(data);
                      ACT_APIs.putRequest(path, data);
                      // print(path);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Form submitted successfully'),
                        ),
                      );
                      // Navigator.of(context).pop();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            userRole: widget.userRole,
                          ),
                        ),
                      );
                    },
                    child: const Text('Submit'),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
