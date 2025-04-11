import 'package:flutter/material.dart';

import 'package:project_ui/pages/data_entry_form_screen.dart';
import 'package:project_ui/pages/view_data_student_details_screen.dart';
import 'package:project_ui/provider/filter_provider.dart';
import 'package:project_ui/provider/student_details_get_data_provider.dart';
import 'package:project_ui/widgets/bar_graph.dart';
import 'package:project_ui/widgets/histogram_graph.dart';
import 'package:provider/provider.dart';

class StudentDetails extends StatefulWidget {
  final String userRole;
  const StudentDetails({
    super.key,
    required this.userRole,
  });

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  bool viewTable = false;
  bool getData = true;
  Color myColor = const Color.fromARGB(255, 59, 201, 64);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> barGraphDataForDomain = {};
    List<double> histogramGraphDataTraingBatch = [];
    Map<String, dynamic> barGraphDataForBranchDiv = {};

    return Consumer2<StudentDetailsDataProvider, FilterProvider>(
        builder: (context, studentDetailsDataProvider, filterProvider, child) {
      if (getData) {
        String filter = '';
        List<String> branch_div = filterProvider.filter['branch_div'] != null
            ? filterProvider.filter['branch_div'] as List<String>
            : [];

        for (var i = 0; i < branch_div.length; i++) {
          filter = filter + '&branch_div=${branch_div[i].replaceAll('&', '%26')}';
        }

        print('/////////////////////////////////////');

        List<String> train_batch =
            filterProvider.filter['train_batch'] != null
                ? filterProvider.filter['train_batch'] as List<String>
                : [];

        print(filterProvider.filter['train_batch']);

        for (var i = 0; i < train_batch.length; i++) {
          filter = filter + '&train_batch=${train_batch[i]}';
          print(train_batch[i]);
        }

        print(filter +
            "Filter in placement records/////////////////////////////////////////////");

        List<String> domain = filterProvider.filter['domain'] != null
            ? filterProvider.filter['domain'] as List<String>
            : [];

        for (var i = 0; i < domain.length; i++) {
          filter = filter + '&domain=${domain[i]}';
        }

        List<String> category = filterProvider.filter['category'] != null
            ? filterProvider.filter['category'] as List<String>
            : [];

        for (var i = 0; i < category.length; i++) {
          filter = filter + '&category=${category[i]}';
        }

        List<String> role = filterProvider.filter['role'] != null
            ? filterProvider.filter['role'] as List<String>
            : [];

        for (var i = 0; i < role.length; i++) {
          filter = filter + '&role=${role[i]}';
        }

        print(filter + "Filter in placement records");

        studentDetailsDataProvider.getStudentDetailsData(filter);
        getData = false;
      }

      if (studentDetailsDataProvider.studentDetailsGetDataModelList.isEmpty) {
        String filter = '';
        List<String> branch_div = filterProvider.filter['branch_div'] != null
            ? filterProvider.filter['branch_div'] as List<String>
            : [];

        for (var i = 0; i < branch_div.length; i++) {
          filter = filter + '&branch_div=${branch_div[i].replaceAll('&', '%26')}';
        }

        List<String> train_batch =
            filterProvider.filter['train_batch'] != null
                ? filterProvider.filter['train_batch'] as List<String>
                : [];

        for (var i = 0; i < train_batch.length; i++) {
          filter = filter + '&train_batch=${train_batch[i]}';
        }

        List<String> domain = filterProvider.filter['domain'] != null
            ? filterProvider.filter['domain'] as List<String>
            : [];

        for (var i = 0; i < domain.length; i++) {
          filter = filter + '&domain=${domain[i]}';
        }

        List<String> category = filterProvider.filter['category'] != null
            ? filterProvider.filter['category'] as List<String>
            : [];

        for (var i = 0; i < category.length; i++) {
          filter = filter + '&category=${category[i]}';
        }

        List<String> role = filterProvider.filter['role'] != null
            ? filterProvider.filter['role'] as List<String>
            : [];

        for (var i = 0; i < role.length; i++) {
          filter = filter + '&role=${role[i]}';
        }

        print(filter + "Filter in placement records");

        studentDetailsDataProvider.getStudentDetailsData(filter);

        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      for (var element
          in studentDetailsDataProvider.studentDetailsGetDataModelList) {
        if (barGraphDataForDomain.containsKey(element.domain)) {
          barGraphDataForDomain[element.domain] =
              barGraphDataForDomain[element.domain] + 1;
        } else {
          barGraphDataForDomain[element.domain] = 1;
        }
      }
      barGraphDataForDomain = Map.fromEntries(
        barGraphDataForDomain.entries.toList()
          ..sort((e1, e2) => e1.key.compareTo(e2.key)),
      );

      for (var element
          in studentDetailsDataProvider.studentDetailsGetDataModelList) {
        histogramGraphDataTraingBatch.add(element.trainBatch.toDouble());
      }

      for (var element
          in studentDetailsDataProvider.studentDetailsGetDataModelList) {
        if (barGraphDataForBranchDiv.containsKey(element.branchDiv)) {
          barGraphDataForBranchDiv[element.branchDiv] =
              barGraphDataForBranchDiv[element.branchDiv] + 1;
        } else {
          barGraphDataForBranchDiv[element.branchDiv] = 1;
        }
      }

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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ViewDataStudentDetailsScreen(
                              data: studentDetailsDataProvider
                                  .studentDetailsGetDataModelList,
                              userRole: widget.userRole,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: BarGraph(
                              dataList: barGraphDataForDomain,
                              title: 'Student Speciality',
                              color: myColor,
                            ),
                          ),
                          const SizedBox(
                            height: 420,
                            child: VerticalDivider(),
                          ),
                          Expanded(
                            child: HistogramGraph(
                              dataList: histogramGraphDataTraingBatch,
                              title: 'Training Batch',
                              interval: 0.5,
                              color: myColor,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: BarGraph(
                              dataList: barGraphDataForBranchDiv,
                              title: 'Branch Division',
                              color: myColor,
                            ),
                          ),
                          const SizedBox(
                            height: 420,
                            child: VerticalDivider(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
