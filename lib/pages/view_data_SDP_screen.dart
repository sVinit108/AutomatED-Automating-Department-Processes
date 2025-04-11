import 'package:flutter/material.dart';
import 'package:project_ui/widgets/SDP_list_card.dart';

class ViewDataSDPScreen extends StatefulWidget {
  final List<dynamic> data;
  const ViewDataSDPScreen({
    super.key,
    required this.data,
  });

  @override
  State<ViewDataSDPScreen> createState() => _ViewDataSDPScreenState();
}

class _ViewDataSDPScreenState extends State<ViewDataSDPScreen> {
  @override
  Widget build(BuildContext context) {
    double cellWidth = (MediaQuery.of(context).size.width * 10 / 100) - 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Data SDP'),
      ),
      body: Column(
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
                    'Attendance',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.all(2.0),
                //   width: cellWidth,
                //   child: const Text(
                //     'Test Marks',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontSize: 17,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              // cacheExtent: 50,
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                return SDPListCard(
                  path: "ACT",
                  id: widget.data[index].id,
                  srNo: widget.data[index].srNo,
                  branchDiv: widget.data[index].branchDiv,
                  uid: widget.data[index].uid,
                  rollNo: widget.data[index].rollNo,
                  studentName: widget.data[index].studentName,
                  trainBatch: widget.data[index].trainBatch,
                  sdpAttendance: widget.data[index].sdpAttendance,
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}
