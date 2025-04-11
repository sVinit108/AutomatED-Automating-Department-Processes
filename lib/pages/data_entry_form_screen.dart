import 'package:flutter/material.dart';
import 'package:project_ui/APIs/act_apis.dart';
import 'package:project_ui/global.dart';

class DataEntryFormScreen extends StatefulWidget {
  final String path;

  const DataEntryFormScreen({
    super.key,
    required this.path,
  });

  @override
  _DataEntryFormScreenState createState() => _DataEntryFormScreenState();
}

class _DataEntryFormScreenState extends State<DataEntryFormScreen> {
  Map<String, String> formData = {};

  int? _srNo;
  String? _branchDiv;
  String? _uid;
  int? _rollNo;
  String? _studentName;
  int? _mobileNo;
  String? _email;
  int? _actAttendance;
  int? _actTestMarks;
  int? _cdtAttendance;
  int? _cdtTestMarks;
  int? _sdpAttendance;
  int? _trainingBatch;
  String? _domain;
  int? _category;
  String? _placementCompany;
  int? _package;
  String? _role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details Form'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height * 0.9,
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
                    onChanged: (value) {
                      _srNo = int.tryParse(value);
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
                    items: branchDivOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      _branchDiv = value;
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
                    onChanged: (value) {
                      _uid = value;
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
                    onChanged: (value) {
                      _rollNo = int.tryParse(value);
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
                    onChanged: (value) {
                      _studentName = value;
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
                    onChanged: (value) {
                      _mobileNo = int.tryParse(value);
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
                    onChanged: (value) {
                      _email = value;
                    },
                  ),
                  const Spacer(),
                  // DropdownButtonFormField(
                  //   decoration: const InputDecoration(
                  //     labelText: 'ACT Attendance %',
                  //     border: OutlineInputBorder(),
                  //     contentPadding:
                  //         EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  //   ),
                  //   items: ['Present', 'Absent']
                  //       .map<DropdownMenuItem<String>>((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  //   onChanged: (value) {
                  //     if (value == 'Present') {
                  //       _attendance = 1;
                  //     } else {
                  //       _attendance = 0;
                  //     }
                  //   },
                  // ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'ACT Attendance %',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                    ),
                    onChanged: (value) {
                      _actAttendance = int.tryParse(value);
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
                    onChanged: (value) {
                      _actTestMarks = int.tryParse(value);
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
                    onChanged: (value) {
                      _cdtAttendance = int.tryParse(value);
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
                    onChanged: (value) {
                      _cdtTestMarks = int.tryParse(value);
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
                    onChanged: (value) {
                      _sdpAttendance = int.tryParse(value);
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
                    items: trainingBarOptions
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      _trainingBatch = value;
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
                    items: domainOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      _domain = value;
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
                    items: [1, 2, 3].map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      _category = value;
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
                    onChanged: (value) {
                      _placementCompany = value;
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
                    onChanged: (value) {
                      _package = int.tryParse(value);
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
                    onChanged: (value) {
                      _role = value;
                    },
                  ),

                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      String path = "${widget.path}/postData";
                      Map<String, String> data = {
                        "sr_no": _srNo.toString(),
                        "branch_div": _branchDiv.toString(),
                        "uid": _uid.toString(),
                        "roll_no": _rollNo.toString(),
                        "student_name": _studentName.toString(),
                        "mobile_no": _mobileNo.toString(),
                        "email_id": _email.toString(),
                        "act_attendance": _actAttendance.toString(),
                        "act_test_marks": _actTestMarks.toString(),
                        "cdt_attendance": _cdtAttendance.toString(),
                        "cdt_test_marks": _cdtTestMarks.toString(),
                        "sdp_attendance": _sdpAttendance.toString(),
                        "train_batch": _trainingBatch.toString(),
                        "domain": _domain.toString(),
                        "category": _category.toString(),
                        "placed_comp": _placementCompany.toString(),
                        "package_lpa": _package.toString(),
                        "role": _role.toString(),
                      };
                      ACT_APIs.postRequest(path, data);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Form submitted successfully'),
                        ),
                      );
                      Navigator.of(context).pop();
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
