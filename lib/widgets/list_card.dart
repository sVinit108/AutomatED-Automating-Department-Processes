import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String path;
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
  const ListCard({
    super.key,
    required this.path,
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
  });

  @override
  Widget build(BuildContext context) {
    double cellWidth = (MediaQuery.of(context).size.width * 10 / 100) - 2;
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                email,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.red,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                '$attendance',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // color: Colors.green,
              // padding: const EdgeInsets.all(8.0),
              width: cellWidth,
              child: Text(
                '$testMarks',
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
                    '$category',
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   // MaterialPageRoute(
                      //   //   builder: (context) =>
                      //   //   // DataUpdateFormScreen(
                      //   //   //   path: path,
                      //   //   //   id: id,
                      //   //   //   srNo: srNo,
                      //   //   //   branchDiv: branchDiv,
                      //   //   // ),
                      //   // ),
                      // );
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            // const Expanded(
            //   // color: Colors.red,
            //   // padding: const EdgeInsets.all(8.0),
            //   //width: cellWidth,
            //   child: Icon(Icons.edit, size: 10,),
            // )
          ],
        ),
      ),
    );
  }
}
