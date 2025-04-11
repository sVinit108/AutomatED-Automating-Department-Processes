import 'package:flutter/material.dart';

import 'package:project_ui/pages/view_data_placement_records_screen.dart';
import 'package:project_ui/provider/filter_provider.dart';
import 'package:project_ui/provider/placement_records_get_data_provider.dart';
import 'package:project_ui/widgets/bar_graph.dart';
import 'package:project_ui/widgets/histogram_graph.dart';
import 'package:project_ui/widgets/pie_chart_new.dart';
import 'package:provider/provider.dart';

class PlacementRecords extends StatefulWidget {
  const PlacementRecords({
    super.key,
  });

  @override
  State<PlacementRecords> createState() => _PlacementRecordsState();
}

class _PlacementRecordsState extends State<PlacementRecords> {
  bool viewTable = false;
  bool getData = true;
  Color myColor = const Color.fromARGB(255, 155, 59, 52);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> barGraphDataForCompanies = {};
    Map<dynamic, dynamic> dataForPackage = {};
    List<double> histogramGraphDataPackage = [];
    Map<dynamic, dynamic> pieChartDataForCetagory = {};
    Map<dynamic, dynamic> dataForRole = {};

    return Consumer2<PlacementRecordsGetDataProvider, FilterProvider>(builder:
        (context, placementRecordsGetDataProvider, filterProvider, child) {
      if (getData) {
        String filter = '';
        List<String> branch_div = filterProvider.filter['branch_div'] != null
            ? filterProvider.filter['branch_div'] as List<String>
            : [];

        for (var i = 0; i < branch_div.length; i++) {
          filter = filter + '&branch_div=${branch_div[i].replaceAll('&', '%26')}';
          print(branch_div[i].replaceAll('&', '%26'));
        }

        print(filter + "Filter in placement records");

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

        // replace all & with %26

        // filter = filter.replaceAll('&', '%26'); 

        // print(filter + "Filter in placement records");

        placementRecordsGetDataProvider.getPlacementRecordsData(filter);
        getData = false;
      }

      if (placementRecordsGetDataProvider
          .placementRecordsGetDataModelList.isEmpty) {
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
        placementRecordsGetDataProvider.getPlacementRecordsData(filter);

        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      for (var element
          in placementRecordsGetDataProvider.placementRecordsGetDataModelList) {
        if (barGraphDataForCompanies.containsKey(element.placedComp)) {
          barGraphDataForCompanies[element.placedComp] =
              barGraphDataForCompanies[element.placedComp] + 1;
        } else {
          barGraphDataForCompanies[element.placedComp] = 1;
        }
      }

      for (var element
          in placementRecordsGetDataProvider.placementRecordsGetDataModelList) {
        if (dataForPackage.containsKey(element.package)) {
          dataForPackage[element.package] = dataForPackage[element.package] + 1;
        } else {
          dataForPackage[element.package] = 1;
        }
      }

      // Sort the dataForPackage data in descending order
      dataForPackage = Map.fromEntries(
        dataForPackage.entries.toList()
          ..sort((e1, e2) => e2.key.compareTo(e1.key)),
      );

      for (var element
          in placementRecordsGetDataProvider.placementRecordsGetDataModelList) {
        histogramGraphDataPackage.add(element.package.toDouble());
      }

      for (var element
          in placementRecordsGetDataProvider.placementRecordsGetDataModelList) {
        if (pieChartDataForCetagory.containsKey(element.category)) {
          pieChartDataForCetagory[element.category] =
              pieChartDataForCetagory[element.category] + 1;
        } else {
          pieChartDataForCetagory[element.category] = 1;
        }
      }

      for (var element
          in placementRecordsGetDataProvider.placementRecordsGetDataModelList) {
        if (dataForRole.containsKey(element.role)) {
          dataForRole[element.role] = dataForRole[element.role] + 1;
        } else {
          dataForRole[element.role] = 1;
        }
      }

      // Sort the dataForRole data in descending order
      dataForRole = Map.fromEntries(
        dataForRole.entries.toList()
          ..sort((e1, e2) => e2.value.compareTo(e1.value)),
      );

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
                            builder: (context) =>
                                ViewDataPlacementRecordsScreen(
                              data: placementRecordsGetDataProvider
                                  .placementRecordsGetDataModelList,
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
                              dataList: barGraphDataForCompanies,
                              title: 'Placement Records',
                              color: myColor,
                            ),
                          ),
                          const SizedBox(
                            height: 420,
                            child: VerticalDivider(),
                          ),
                          Expanded(
                            child: BarGraph(
                              dataList: dataForRole,
                              title: 'Role Offered Records',
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
                              dataList: histogramGraphDataPackage,
                              title: 'Package Distribution',
                              interval: 5,
                              color: myColor,
                            ),
                          ),
                          const SizedBox(
                            height: 420,
                            child: VerticalDivider(),
                          ),
                          Expanded(
                            child: PieChart(
                              dataList: pieChartDataForCetagory,
                              title: 'Category Distribution',
                            ),
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
