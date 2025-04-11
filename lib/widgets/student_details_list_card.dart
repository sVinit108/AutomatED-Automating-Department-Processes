import 'package:flutter/material.dart';
import 'package:project_ui/APIs/act_apis.dart';
import 'package:project_ui/pages/data_update_form_screen.dart';
import 'package:project_ui/pages/home_page.dart';

class StudentDetailsListCard extends StatelessWidget {
  final String path;
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
  final String userRole;
  const StudentDetailsListCard({
    super.key,
    required this.path,
    required this.id,
    required this.srNo,
    required this.branchDiv,
    required this.uid,
    required this.rollNo,
    required this.studentName,
    required this.mobileNo,
    required this.category,
    required this.emailId,
    required this.actAttendance,
    required this.actTestMarks,
    required this.cdtAttendance,
    required this.cdtTestMarks,
    required this.sdpAttendance,
    required this.trainBatch,
    required this.domain,
    required this.placedComp,
    required this.package,
    required this.role,
    required this.userRole,
  });

  @override
  Widget build(BuildContext context) {
    double cellWidth = (MediaQuery.of(context).size.width * 10 / 100) - 2;
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              // color: Colors.green,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                '$srNo',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.red,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                branchDiv,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.green,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                uid,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.red,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                '$rollNo',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.green,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                studentName,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.red,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                '$mobileNo',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.green,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                emailId,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.red,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                '$actAttendance',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.green,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                '$actTestMarks',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.red,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                '$cdtAttendance',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.green,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                '$cdtTestMarks',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.red,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                '$sdpAttendance',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.green,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                '$trainBatch',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.red,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                domain,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.green,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                '$category',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.red,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                placedComp,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.green,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                '$package',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.red,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    '$role',
                    textAlign: TextAlign.center,
                  ),
                  userRole != 'superadmin'
                      ? const SizedBox(
                          width: 15,
                        )
                      : PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'edit') {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DataUpdateFormScreen(
                                    id: id,
                                    path: path,
                                    sr_no: srNo,
                                    branch_div: branchDiv,
                                    uid: uid,
                                    roll_no: rollNo,
                                    student_name: studentName,
                                    mobile_no: mobileNo.toDouble(),
                                    email_id: emailId,
                                    act_attendance: actAttendance,
                                    act_test_marks: actTestMarks,
                                    cdt_attendance: cdtAttendance,
                                    cdt_test_marks: cdtTestMarks,
                                    sdp_attendance: sdpAttendance,
                                    train_batch: trainBatch,
                                    domain: domain,
                                    category: category,
                                    placement_company: placedComp,
                                    package: package,
                                    role: role,
                                    userRole: userRole,
                                  ),
                                ),
                              );
                            } else if (value == 'delete') {
                              ACT_APIs.deleteRequest(path, {"uid": uid});
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => HomePage(
                                    userRole: userRole,
                                  ),
                                ),
                              );
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'edit',
                              child: ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                            ),
                            const PopupMenuItem<String>(
                              value: 'delete',
                              child: ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Delete'),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
