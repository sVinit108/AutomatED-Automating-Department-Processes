import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/act_get_data_model.dart';

class ActGetDataProvider extends ChangeNotifier {
  List<ActGetDataModel> actGetDataModelList = [];

  // List<ActGetDataModel> get actGetDataModelList => _actGetDataModelList;

  void getActData(String filter) async {
    // print('Fetching data...');
    actGetDataModelList.clear();

    final response =
        await http.get(Uri.parse('http://127.0.0.1:3000/ACT/getData?$filter'));
    // print(response.body);
    if (response.statusCode == 200) {
      // int count = 0;
      if (actGetDataModelList.isEmpty) {
        for (var i in json.decode(response.body)) {
          actGetDataModelList.add(ActGetDataModel.fromJson(i));
          // count++;
        }
      }
      else {
        actGetDataModelList.clear();
        for (var i in json.decode(response.body)) {
          actGetDataModelList.add(ActGetDataModel.fromJson(i));
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
