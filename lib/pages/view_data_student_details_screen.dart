import 'package:flutter/material.dart';
import 'package:project_ui/widgets/student_details_list_card.dart';

class ViewDataStudentDetailsScreen extends StatefulWidget {
  final List<dynamic> data;
  final String userRole;
  const ViewDataStudentDetailsScreen({
    super.key,
    required this.data,
    required this.userRole,
  });

  @override
  State<ViewDataStudentDetailsScreen> createState() =>
      _ViewDataStudentDetailsScreenState();
}

class _ViewDataStudentDetailsScreenState
    extends State<ViewDataStudentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double cellWidth = (MediaQuery.of(context).size.width * 10 / 100) - 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Data Student Details'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'Sr.No.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'Branch Div',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'UID',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'Roll No',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'Student Name',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'Mobile No',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'Email',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'ACT Attendance',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'ACT Test Marks',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'CDT Attendance',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'CDT Test Marks',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'SDP Attendance',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'Training Batch',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'Domain',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'Category',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'Placed Company',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'Package (LPA)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        width: cellWidth,
                        child: const Text(
                          'Role',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    // cacheExtent: 50,
                    itemCount: widget.data.length,
                    itemBuilder: (context, index) {
                      return StudentDetailsListCard(
                        path: "ACT",
                        id: widget.data[index].id,
                        srNo: widget.data[index].srNo,
                        branchDiv: widget.data[index].branchDiv,
                        uid: widget.data[index].uid,
                        rollNo: widget.data[index].rollNo,
                        studentName: widget.data[index].studentName,
                        mobileNo: widget.data[index].mobileNo,
                        emailId: widget.data[index].emailId,
                        actAttendance: widget.data[index].actAttendance,
                        actTestMarks: widget.data[index].actTestMarks,
                        cdtAttendance: widget.data[index].cdtAttendance,
                        cdtTestMarks: widget.data[index].cdtTestMarks,
                        sdpAttendance: widget.data[index].sdpAttendance,
                        trainBatch: widget.data[index].trainBatch,
                        domain: widget.data[index].domain,
                        category: widget.data[index].category,
                        placedComp: widget.data[index].placedComp,
                        package: widget.data[index].package,
                        role: widget.data[index].role,
                        userRole: widget.userRole,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
