import 'package:flutter/material.dart';
import 'package:project_ui/model/act_get_data_model.dart';
import 'package:project_ui/utils/data_conversion.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActGraph extends StatefulWidget {
  final List<ActGetDataModel> actGetDataModelList;
  const ActGraph({
    super.key,
    required this.actGetDataModelList,
  });

  @override
  State<ActGraph> createState() => _ActGraphState();
}

class _ActGraphState extends State<ActGraph> {
  late final List<ActGraphData> _data =
      DataConversion().getData(widget.actGetDataModelList);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: SfCartesianChart(
          title: const ChartTitle(
            text: 'Branch wise Attendance',
            textStyle: TextStyle(
              // fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          crosshairBehavior: CrosshairBehavior(enable: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          primaryXAxis: const CategoryAxis(),
          series: <CartesianSeries>[
            // Renders bar chart
            BarSeries<ActGraphData, String>(
              dataSource: _data,
              xValueMapper: (ActGraphData data, _) => data.branch,
              yValueMapper: (ActGraphData data, _) => data.attendance,

              // Enable selection for tapping to select data points
              selectionBehavior: SelectionBehavior(enable: true),
              // Enable animation for smoother transitions
              animationDuration: 1000, // 1 second animation duration
            ),
          ]),
    );
  }
}

class ActGraphData {
  final String branch;
  final int attendance;

  ActGraphData(this.branch, this.attendance);
}
