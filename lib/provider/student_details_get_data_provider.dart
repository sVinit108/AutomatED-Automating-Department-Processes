import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import '../model/act_get_data_model.dart';
import '../model/student_details_get_data_model.dart';

class StudentDetailsDataProvider extends ChangeNotifier {
  List<StudentDetailsGetDataModel> studentDetailsGetDataModelList = [];

  // List<ActGetDataModel> get actGetDataModelList => _actGetDataModelList;

  void getStudentDetailsData(String filter) async {
    // print('Fetching data...');
    studentDetailsGetDataModelList.clear();

    final response =
        await http.get(Uri.parse('http://127.0.0.1:3000/ACT/getData?$filter'));
    // print(response.body);
    if (response.statusCode == 200) {
      // int count = 0;
      if (studentDetailsGetDataModelList.isEmpty) {
        for (var i in json.decode(response.body)) {
          studentDetailsGetDataModelList.add(StudentDetailsGetDataModel.fromJson(i));
          // count++;
        }
      }
      else {
        studentDetailsGetDataModelList.clear();
        for (var i in json.decode(response.body)) {
          studentDetailsGetDataModelList.add(StudentDetailsGetDataModel.fromJson(i));
          // count++;
        }
      }
      // print(actGetDataModelList.length);
      // print('Data fetched successfully with count: $count');
      notifyListeners();
    } else {
      print('Failed to fetch data with status code: ${response.statusCode}');
    }
  }
}
