import 'package:flutter/material.dart';
import 'package:project_ui/utils/data_conversion.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistogramGraph extends StatefulWidget {
  final List<double> dataList;
  final String title;
  final double interval;
  final Color color;
  const HistogramGraph({
    super.key,
    required this.dataList,
    required this.title,
    required this.interval,
    required this.color,
  });

  @override
  State<HistogramGraph> createState() => _HistogramGraphState();
}

class _HistogramGraphState extends State<HistogramGraph> {
  late List<HistogramGraphData> histogramData =
      DataConversion().getHistogramGraphData(widget.dataList);
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          title: ChartTitle(
            text: widget.title,
            textStyle: const TextStyle(
              // fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          series: <CartesianSeries>[
            HistogramSeries<HistogramGraphData, double>(
              dataSource: histogramData,
              // showNormalDistributionCurve: true,
              // curveColor: const Color.fromRGBO(192, 108, 132, 1),
              binInterval: widget.interval,
              yValueMapper: (HistogramGraphData data, _) => data.y,
              color: widget.color, //const Color.fromARGB(255, 155, 59, 52),
            )
          ]),
    );
  }
}

class HistogramGraphData {
  HistogramGraphData(this.y);
  final double y;
}
