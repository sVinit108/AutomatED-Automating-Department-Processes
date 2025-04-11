import 'package:flutter/material.dart';
import 'package:project_ui/pages/view_data_CDT_screen.dart';
import 'package:project_ui/provider/cdt_get_data_provider.dart';
import 'package:project_ui/provider/filter_provider.dart';
import 'package:project_ui/widgets/bar_graph.dart';
import 'package:project_ui/widgets/histogram_graph.dart';
import 'package:project_ui/widgets/line_chart.dart';
import 'package:provider/provider.dart';

class CareerDevelopmentTraining extends StatefulWidget {
  const CareerDevelopmentTraining({super.key});

  @override
  State<CareerDevelopmentTraining> createState() =>
      _CareerDevelopmentTrainingState();
}

class _CareerDevelopmentTrainingState extends State<CareerDevelopmentTraining> {
  bool viewTable = false;
  bool getData = true;

  Color myColor = Colors.yellow.shade400;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> barGraphDataForCDTAttendance = {};
    List<double> histogramGraphDataForCDTTestMarks = [];
    Map<dynamic, dynamic> lineChartDataForCDTTrainingBatch = {};

    return Consumer2<CdtGetDataProvider, FilterProvider>(
        builder: (context, cdtGetDataProvider, filterProvider, child) {
      if (getData) {
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

        cdtGetDataProvider.getCDTData();
        getData = false;
      }

      if (cdtGetDataProvider.cdtGetDataModelList.isEmpty) {
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
        cdtGetDataProvider.getCDTData();

        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      for (var element in cdtGetDataProvider.cdtGetDataModelList) {
        if (barGraphDataForCDTAttendance
            .containsKey('${element.cdtAttendance}%')) {
          barGraphDataForCDTAttendance['${element.cdtAttendance}%'] =
              barGraphDataForCDTAttendance['${element.cdtAttendance}%'] + 1;
        } else {
          barGraphDataForCDTAttendance['${element.cdtAttendance}%'] = 1;
        }
      }

      // sort the barGraphDataForCDTAttendance by value
      barGraphDataForCDTAttendance = Map.fromEntries(
        barGraphDataForCDTAttendance.entries.toList()
          ..sort((e1, e2) => e2.key.compareTo(e1.key)),
      );

      for (var element in cdtGetDataProvider.cdtGetDataModelList) {
        histogramGraphDataForCDTTestMarks.add(element.cdtTestMarks!.toDouble());
      }

      for (var element in cdtGetDataProvider.cdtGetDataModelList) {
        if (lineChartDataForCDTTrainingBatch.containsKey(element.trainBatch)) {
          lineChartDataForCDTTrainingBatch[element.trainBatch] =
              lineChartDataForCDTTrainingBatch[element.trainBatch] + 1;
        } else {
          lineChartDataForCDTTrainingBatch[element.trainBatch] = 1;
        }
      }

      // sort the lineChartDataForCDTTrainingBatch by value
      lineChartDataForCDTTrainingBatch = Map.fromEntries(
        lineChartDataForCDTTrainingBatch.entries.toList()
          ..sort((e1, e2) => e1.key.compareTo(e2.key)),
      );

      // print(cdtGetDataProvider.actGetDataModelList[0].studentName);

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
                            builder: (context) => ViewDataCDTScreen(
                              data: cdtGetDataProvider.cdtGetDataModelList,
                            ),
                          ),
                        );
                      },
                      child: const Text('View Data'),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: BarGraph(
                              dataList: barGraphDataForCDTAttendance,
                              title: 'CDT Attendance',
                              color: myColor,
                            ),
                          ),
                          const SizedBox(
                            height: 420,
                            child: VerticalDivider(),
                          ),
                          Expanded(
                            child: LineChart(
                              dataList: lineChartDataForCDTTrainingBatch,
                              title: "Training Batch",
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
                            child: HistogramGraph(
                              dataList: histogramGraphDataForCDTTestMarks,
                              title: 'CDT Test Marks',
                              interval: 10,
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
