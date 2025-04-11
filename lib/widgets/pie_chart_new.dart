import 'package:flutter/material.dart';
import 'package:project_ui/utils/data_conversion.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  final Map<dynamic, dynamic> dataList;
  final String title;
  const PieChart({
    super.key,
    required this.dataList,
    required this.title,
  });

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  late final List<PieChartData> _data =
      DataConversion().getPieChartData(widget.dataList);
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCircularChart(
        palette: [const Color.fromARGB(255, 196, 25, 13), Color.fromARGB(195, 196, 25, 13), Color.fromARGB(150, 196, 25, 13)],
          tooltipBehavior: _tooltipBehavior,
          title: ChartTitle(
            text: widget.title,
            textStyle: const TextStyle(
              // fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          legend: const Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
          ),
          series: <CircularSeries>[
            PieSeries<PieChartData, String>(
              dataSource: _data,
              pointColorMapper: (PieChartData data, _) => data.color,
              xValueMapper: (PieChartData data, _) => data.x,
              yValueMapper: (PieChartData data, _) => data.y,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              enableTooltip: true,
            ) //ActivationMode.singleTap
          ]),
    );
  }
}

class PieChartData {
  PieChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
