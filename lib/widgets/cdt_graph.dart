// // import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// // import 'package:project_ui/provider/sdp_get_data_provider.dart';
// import 'package:project_ui/utils/data_conversion.dart';
// // import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class SdpGraph extends StatefulWidget {
//   final List<SdpGetDataModel> sdpGetDataModelList;
//   const SdpGraph({
//     super.key,
//     required this.sdpGetDataModelList,
//   });

//   @override
//   State<SdpGraph> createState() => _SdpGraphState();
// }

// class _SdpGraphState extends State<SdpGraph> {
//   // List<sdpAttendanceGraphData> data = [];

//   late final List<SdpGraphData> _data = DataConversion().getData(widget.sdpGetDataModelList);

//   // List<sdpAttendanceGraphData> data = DataConversion().getAttendanceData(widget.sdpGetDataModelList);

//   // void getAttendanceData(List<sdpGetDataModel> sdpGetDataModelList) {
//   //   Map<String, int> attendanceData = {};
//   //   for (var data in sdpGetDataModelList) {
//   //     if (attendanceData.containsKey(data.branchDiv.name)) {
//   //       attendanceData[data.branchDiv.name] =
//   //           attendanceData[data.branchDiv.name]! + data.attendance;
//   //     } else {
//   //       attendanceData[data.branchDiv.name] = data.attendance;
//   //     }
//   //   }

//   //   attendanceData.forEach((key, value) {
//   //     data.add(sdpAttendanceGraphData(key, value));
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
   

//         return Container(
//           margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
//           child: SfCartesianChart(
//               title: const ChartTitle(
//                 text: 'Branch wise Attendance',
//                 textStyle: TextStyle(
//                   // fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),

//               // Enable legend for better data interpretation
//               // legend: Legend(isVisible: true),
//               // custom legend
//               // legend: Legend(
//               //   isVisible: true,
//               //   position: LegendPosition.bottom,
//               //   // Legend will be placed at the bottom
//               //   // Customize legend appearance
//               //   textStyle: TextStyle(
//               //     color: Colors.black,
//               //     fontWeight: FontWeight.bold,
//               //   ),
//               // ),

//               crosshairBehavior: CrosshairBehavior(enable: true),
//               tooltipBehavior: TooltipBehavior(enable: true),
//               primaryXAxis: const CategoryAxis(
//                   // Customize x-axis labels (optional)
//                   // labelPlacement: LabelPlacement.betweenTicks,
//                   ),
//               series: <CartesianSeries>[
//                 // Renders bar chart
//                 BarSeries<SdpGraphData, String>(
//                   dataSource: _data,
//                   xValueMapper: (SdpGraphData data, _) => data.branch,
//                   yValueMapper: (SdpGraphData data, _) =>
//                       data.attendance,

//                   // Enable tooltip for better data visualization
//                   // dataLabelSettings: DataLabelSettings(isVisible: true),
//                   // Enable selection for tapping to select data points
//                   selectionBehavior: SelectionBehavior(enable: true),
//                   // Enable animation for smoother transitions
//                   animationDuration: 1000, // 1 second animation duration
//                 ),
//               ]),
//         );
//       // },
//     // );
//   }
// }

// class SdpGraphData {
//   final String branch;
//   final int attendance;

//   SdpGraphData(this.branch, this.attendance);
// }
