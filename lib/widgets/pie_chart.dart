import 'package:flutter/material.dart';
import 'package:project_ui/model/act_get_data_model.dart';
import 'package:project_ui/utils/data_conversion.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  final List<ActGetDataModel> actGetDataModelList;
  const PieChart({
    super.key,
    required this.actGetDataModelList,
  });

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  late List<ChartData> chartData =
      DataConversion().getPieData(widget.actGetDataModelList);
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
          tooltipBehavior: _tooltipBehavior,
          title: const ChartTitle(
            text: 'Category Distribution',
            textStyle: TextStyle(
              // fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          legend: const Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
          ),

          // onDataLabelRender: (dataLabelArgs) {
          //   dataLabelArgs.text = '${dataLabelArgs.text} %';

          // },
          series: <CircularSeries>[
            PieSeries<ChartData, String>(
              dataSource: chartData,
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              enableTooltip: true,
            ) //ActivationMode.singleTap
          ]),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
