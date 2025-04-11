import 'package:flutter/material.dart';
import 'package:project_ui/utils/data_conversion.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraph extends StatefulWidget {
  // final List<dynamic> dataList;
  final Map<dynamic, dynamic> dataList;
  final String title;
  final Color color;
  const BarGraph({
    super.key,
    required this.dataList,
    required this.title,
    required this.color,
  });

  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  late final List<BarGraphData> _data =
      DataConversion().getBarGraphData(widget.dataList);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      
      
      child: SfCartesianChart(
          title: ChartTitle(
            text: widget.title,
            textStyle: const TextStyle(
              // fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          crosshairBehavior: CrosshairBehavior(enable: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          primaryXAxis: const CategoryAxis(),
          series: <CartesianSeries>[
            // Renders bar chart
            BarSeries<BarGraphData, String>(
              dataSource: _data,
              xValueMapper: (BarGraphData data, _) => data.xAxis,
              yValueMapper: (BarGraphData data, _) => data.yAxis,

              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),

              color: widget.color, //Color.fromARGB(255, 155, 59, 52),

              // Enable selection for tapping to select data points
              selectionBehavior: SelectionBehavior(enable: true),
              // Enable animation for smoother transitions
              animationDuration: 1000, // 1 second animation duration
            ),
          ]),
    );
  }
}

class BarGraphData {
  final String xAxis;
  final int yAxis;

  BarGraphData(this.xAxis, this.yAxis);
}
