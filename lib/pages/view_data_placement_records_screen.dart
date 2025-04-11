import 'package:flutter/material.dart';
import 'package:project_ui/widgets/placement_records_list_card.dart';

class ViewDataPlacementRecordsScreen extends StatefulWidget {
  final List<dynamic> data;
  const ViewDataPlacementRecordsScreen({
    super.key,
    required this.data,
  });

  @override
  State<ViewDataPlacementRecordsScreen> createState() =>
      _ViewDataPlacementRecordsScreenState();
}

class _ViewDataPlacementRecordsScreenState
    extends State<ViewDataPlacementRecordsScreen> {
  @override
  Widget build(BuildContext context) {
    double cellWidth = (MediaQuery.of(context).size.width * 10 / 100) - 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Data Placement Records'),
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
                    'Company Name',
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
                    'Package',
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
                    'Role Offered',
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
                return PlacementRecordsListCard(
                  path: "ACT",
                  id: widget.data[index].id,
                  srNo: widget.data[index].srNo,
                  branchDiv: widget.data[index].branchDiv,
                  uid: widget.data[index].uid,
                  rollNo: widget.data[index].rollNo,
                  studentName: widget.data[index].studentName,
                  category: widget.data[index].category,
                  placedComp: widget.data[index].placedComp,
                  package: widget.data[index].package,
                  role: widget.data[index].role,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
