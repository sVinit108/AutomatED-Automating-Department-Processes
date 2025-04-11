import 'package:flutter/material.dart';
import 'package:project_ui/model/act_get_data_model.dart';
import 'package:project_ui/utils/data_conversion.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Histogram extends StatefulWidget {
  final List<ActGetDataModel> actGetDataModelList;
  const Histogram({
    super.key,
    required this.actGetDataModelList,
  });

  @override
  State<Histogram> createState() => _HistogramState();
}

class _HistogramState extends State<Histogram> {
  late List<HistogramChartData> histogramData =
      DataConversion().getHistogramData(widget.actGetDataModelList);
  late TooltipBehavior _tooltipBehavior;

   @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SfCartesianChart(
            tooltipBehavior: _tooltipBehavior,
            title: const ChartTitle(
              text: 'Marks Distribution',
              textStyle: TextStyle(
                // fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            series: <CartesianSeries>[
              HistogramSeries<HistogramChartData, double>(
                  dataSource: histogramData,
                  // showNormalDistributionCurve: true,
                  // curveColor: const Color.fromRGBO(192, 108, 132, 1),
                  binInterval: 10,
                  yValueMapper: (HistogramChartData data, _) => data.y)
            ]),
      ),
    );
  }
}

class HistogramChartData {
  HistogramChartData(this.y);
  final double y;
}
