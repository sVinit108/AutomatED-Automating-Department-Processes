import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/placement_records_get_data_model.dart';

class PlacementRecordsGetDataProvider extends ChangeNotifier {
  List<PlacementRecordsGetDataModel> placementRecordsGetDataModelList = [];

  // List<ActGetDataModel> get actGetDataModelList => _actGetDataModelList;

  void getPlacementRecordsData(String filter) async {
    // print('Fetching data...');
    placementRecordsGetDataModelList.clear();

    final response =
        await http.get(Uri.parse('http://127.0.0.1:3000/ACT/getData?$filter'));
    // print(response.body);
    if (response.statusCode == 200) {
      // int count = 0;
      if (placementRecordsGetDataModelList.isEmpty) {
        for (var i in json.decode(response.body)) {
          placementRecordsGetDataModelList.add(PlacementRecordsGetDataModel.fromJson(i));
          // count++;
        }
      }
      else {
        placementRecordsGetDataModelList.clear();
        for (var i in json.decode(response.body)) {
          placementRecordsGetDataModelList.add(PlacementRecordsGetDataModel.fromJson(i));
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
