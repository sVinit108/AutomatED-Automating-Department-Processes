import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_ui/model/cdt_get_data_model.dart';


class CdtGetDataProvider extends ChangeNotifier {
  List<CdtGetDataModel> cdtGetDataModelList = [];

  // List<ActGetDataModel> get actGetDataModelList => _actGetDataModelList;

  void getCDTData() async {
    // print('Fetching data...');
    cdtGetDataModelList.clear();

    final response =
        await http.get(Uri.parse('http://127.0.0.1:3000/ACT/getData'));
    // print(response.body);
    if (response.statusCode == 200) {
      // int count = 0;
      if (cdtGetDataModelList.isEmpty) {
        for (var i in json.decode(response.body)) {
          cdtGetDataModelList.add(CdtGetDataModel.fromJson(i));
          // count++;
        }
      }
      else {
        cdtGetDataModelList.clear();
        for (var i in json.decode(response.body)) {
          cdtGetDataModelList.add(CdtGetDataModel.fromJson(i));
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
