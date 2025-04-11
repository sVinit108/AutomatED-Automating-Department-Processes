import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/sdp_get_data_model.dart';

class SdpGetDataProvider extends ChangeNotifier {
  List<SdpGetDataModel> sdpGetDataModelList = [];

  // List<ActGetDataModel> get actGetDataModelList => _actGetDataModelList;

  void getSDPData() async {
    // print('Fetching data...');
    sdpGetDataModelList.clear();

    final response =
        await http.get(Uri.parse('http://127.0.0.1:3000/ACT/getData'));
    // print(response.body);
    if (response.statusCode == 200) {
      // int count = 0;
      if (sdpGetDataModelList.isEmpty) {
        for (var i in json.decode(response.body)) {
          sdpGetDataModelList.add(SdpGetDataModel.fromJson(i));
          // count++;
        }
      }
      else {
        sdpGetDataModelList.clear();
        for (var i in json.decode(response.body)) {
          sdpGetDataModelList.add(SdpGetDataModel.fromJson(i));
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
