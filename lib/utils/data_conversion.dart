import 'package:project_ui/model/act_get_data_model.dart';
import 'package:project_ui/widgets/act_graph.dart';
import 'package:project_ui/widgets/bar_graph.dart';
import 'package:project_ui/widgets/histogram.dart';
import 'package:project_ui/widgets/histogram_graph.dart';
import 'package:project_ui/widgets/line_chart.dart';
import 'package:project_ui/widgets/pie_chart.dart';
import 'package:project_ui/widgets/pie_chart_new.dart';

class DataConversion {
  List<ActGraphData> getData(List<ActGetDataModel> actGetDataModelList) {
    List<ActGraphData> data = [];
    Map<String, int> attendanceData = {};
    for (var data in actGetDataModelList) {
      if (attendanceData.containsKey(data.branchDiv)) {
        attendanceData[data.branchDiv] =
            (attendanceData[data.branchDiv]! + data.actAttendance);
      } else {
        attendanceData[data.branchDiv] = data.actAttendance;
      }
    }

    attendanceData.forEach((key, value) {
      data.add(ActGraphData(key, value));
    });
    return data;
  }

  List<BarGraphData> getBarGraphData(Map<dynamic, dynamic> dataList) {
    List<BarGraphData> data = [];

    dataList.forEach((key, value) {
      data.add(BarGraphData(key.toString(), value));
    });
    return data;
  }

  List<LineChartData> getLineChartData(Map<dynamic, dynamic> dataList) {
    List<LineChartData> data = [];

    dataList.forEach((key, value) {
      data.add(LineChartData(key, value));
    });
    return data;
  }

  List<ChartData> getPieData(List<ActGetDataModel> actGetDataModelList) {
    // print('Pie Data');
    List<ChartData> data = [];
    Map<String, int> pieData = {};
    // for (var data in actGetDataModelList) {
    //   if (pieData.containsKey(data.category.toString())) {
    //     pieData[data.category.toString()] =
    //         pieData[data.category.toString()]! + 1;
    //   } else {
    //     pieData[data.category.toString()] = 1;
    //   }
    // }
    // print('Pie Data: $pieData');

    pieData.forEach((key, value) {
      data.add(ChartData(key, value.toDouble()));
    });

    return data;
  }

  List<PieChartData> getPieChartData(Map<dynamic, dynamic> dataList) {
    List<PieChartData> data = [];
    // Map<String, int> pieData = {};

    dataList.forEach((key, value) {
      data.add(PieChartData(key.toString(), value.toDouble()));
    });

    return data;
  }

  // Histogram Data
  List<HistogramChartData> getHistogramData(
      List<ActGetDataModel> actGetDataModelList) {
    List<HistogramChartData> histogramData = [];
    // Map<String, int> histogramData = {};
    for (var data in actGetDataModelList) {
      // if (histogramData.containsKey(data.category.toString())) {
      //   histogramData[data.category.toString()] =
      //       histogramData[data.category.toString()]! + 1;
      // } else {
      //   histogramData[data.category.toString()] = 1;
      // }
      histogramData.add(HistogramChartData(data.actTestMarks.toDouble()));
    }
    // int c = 0;
    // histogramData.forEach((value) {
    //   if (value.y >= 15 && value.y < 25) {
    //     c++;
    //     print('Value: ${value.y}');
    //     print('Count: $c');
    //   }
    // });
    return histogramData;
  }

  // Histogram Data
  List<HistogramGraphData> getHistogramGraphData(List<double> dataList) {
    List<HistogramGraphData> data = [];
    for (var d in dataList) {
      data.add(HistogramGraphData(d));
    }

    return data;
  }
}
