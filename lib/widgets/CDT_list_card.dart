import 'package:flutter/material.dart';

class CDTListCard extends StatelessWidget {
  final String path;
  final String id;
  final int srNo;
  final String branchDiv;
  final String uid;
  final int rollNo;
  final String studentName;
  final int trainBatch;
  final int actAttendance;
  final int actTestMarks;
  const CDTListCard({
    super.key,
    required this.path,
    required this.id,
    required this.srNo,
    required this.branchDiv,
    required this.uid,
    required this.rollNo,
    required this.studentName,
    required this.trainBatch,
    required this.actAttendance,
    required this.actTestMarks,
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
              width: cellWidth,
              child: Text(
                '$srNo',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: cellWidth,
              child: Text(
                branchDiv,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: cellWidth,
              child: Text(
                uid,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: cellWidth,
              child: Text(
                '$rollNo',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: cellWidth,
              child: Text(
                studentName,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: cellWidth,
              child: Text(
                '$trainBatch',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: cellWidth,
              child: Text(
                '$actAttendance',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: cellWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    '$actTestMarks',
                    textAlign: TextAlign.center,
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
