// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:project_ui/pages/data_entry_form_screen.dart';
import 'package:project_ui/pages/view_data_SDP_screen.dart';
import 'package:provider/provider.dart';

import '../provider/sdp_get_data_provider.dart';

class StudentDevelopmentProgram extends StatefulWidget {
  const StudentDevelopmentProgram({Key? key}) : super(key: key);

  @override
  State<StudentDevelopmentProgram> createState() =>
      _StudentDevelopmentProgramState();
}

class _StudentDevelopmentProgramState extends State<StudentDevelopmentProgram> {
  bool viewTable = false;
  bool getData = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<SdpGetDataProvider>(builder: (context, snapShot, child) {
      if (getData) {
        snapShot.getSDPData();
        getData = false;
      }

      if (snapShot.sdpGetDataModelList.isEmpty) {
        snapShot.getSDPData();

        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      // print(snapShot.actGetDataModelList[0].studentName);

      return Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 100,
                    margin: const EdgeInsets.all(5),
                    child: TextButton(
                      onPressed: () {
                        // debugPrint('go to the view data screen');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ViewDataSDPScreen(
                              data: snapShot.sdpGetDataModelList,
                            ),
                          ),
                        );
                      },
                      child: const Text('View Data'),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 100,
                    margin: const EdgeInsets.all(5),
                    child: TextButton(
                      onPressed: () {
                        debugPrint('go to the data insertion screen');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const DataEntryFormScreen(
                              path: "ACT",
                            ),
                          ),
                        );
                      },
                      child: const Text('Insert Data'),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 0,
              thickness: 1,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.grey[200]!,
                  width: double.infinity,
                  // height: 2000,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Expanded(
                          //   child: ActGraph(
                          //     actGetDataModelList: snapShot.actGetDataModelList,
                          //   ),
                          // ),
                          const SizedBox(
                            height: 420,
                            child: VerticalDivider(),
                          ),
                          // Expanded(
                          //   child: PieChart(
                          //     actGetDataModelList: snapShot.actGetDataModelList,
                          //   ),
                          // ),
                        ],
                      ),

                      const Divider(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Expanded(
                          //   child: Histogram(
                          //     actGetDataModelList: snapShot.actGetDataModelList,
                          //   ),
                          // ),
                          const SizedBox(
                            height: 420,
                            child: VerticalDivider(),
                          ),
                          // Expanded(
                          //   child: ActGraph(
                          //     actGetDataModelList: snapShot.actGetDataModelList,
                          //   ),
                          // ),
                        ],
                      ),

                      // viewTable ? const ViewTable() : Container(),
                      // _current == (CurrentTab.attendance.index)
                      //     ? const ActGraph()
                      //     // Image(
                      //     //     image: act_attendance,
                      //     //     errorBuilder: (context, error, stackTrace) {
                      //     //       return const Text('Failed to load image');
                      //     //     },
                      //     //   )
                      //     : Container(),
                      // _current == (CurrentTab.category.index)
                      //     ? Image(
                      //         image: act_category,
                      //         errorBuilder: (context, error, stackTrace) {
                      //           return const Text('Failed to load image');
                      //         },
                      //       )
                      //     : Container(),
                      // _current == (CurrentTab.test.index)
                      //     ? const Text('This is Test tab')
                      //     : Container(),
                    ],
                  ),
                ),
              ),
            ),
            // Container(
            //   color: Colors.white,
            //   padding: const EdgeInsets.all(20.0),
            //   child: Table(
            //     border: TableBorder.all(color: Colors.black),
            //     children:const [
            //       TableRow(children: [
            //         Text('Cell 1'),
            //         Text('Cell 2'),
            //         Text('Cell 3'),
            //       ]),
            //       TableRow(children: [
            //         Text('Cell 4'),
            //         Text('Cell 5'),
            //         Text('Cell 6'),
            //       ])
            //     ],
            //   ),
            // ),
          ],
        ),
      );
    });
  }
}
