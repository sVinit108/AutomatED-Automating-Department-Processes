import 'package:flutter/material.dart';
import 'package:project_ui/utils/data_conversion.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  final Map<dynamic, dynamic> dataList;
  final String title;
  final Color color;
  const LineChart({
    super.key,
    required this.dataList,
    required this.title,
    required this.color,
  });

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  late final List<LineChartData> _data =
      DataConversion().getLineChartData(widget.dataList);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCartesianChart(
        title: ChartTitle(
          text: widget.title,
          textStyle: const TextStyle(
            // fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        series: <CartesianSeries>[
          // Renders line chart
          LineSeries<LineChartData, int>(
            dataSource: _data,
            xValueMapper: (LineChartData data, _) => data.xAxis,
            yValueMapper: (LineChartData data, _) => data.yAxis,
            color: widget.color,
          )
        ],
      ),
    );
  }
}

class LineChartData {
  final int xAxis;
  final double yAxis;
  LineChartData(this.xAxis, this.yAxis);
}
