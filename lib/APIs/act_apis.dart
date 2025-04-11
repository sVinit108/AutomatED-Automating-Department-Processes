import 'dart:convert';

import 'package:http/http.dart' as http;

class ACT_APIs {
  // function for post request
  static void postRequest(String path, Map<String, String> data) async {
    try {
      String url = 'http://127.0.0.1:3000/$path';
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(data),
      );
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  // function for put request

  static void putRequest(String path, Map<String, String> data) async {
    try {
      String url = 'http://127.0.0.1:3000/$path/putDataById';
      // print(path);
      final response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(data),
      );
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  // function for delete request

  static void deleteRequest(String path, Map<String, String> data) async {
    print(data);
    try {
      String url = 'http://127.0.0.1:3000/$path/deleteData';
      final response = await http.delete(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(data),
      );
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  // static Future<List<ActGetDataModel>> getRequest(String path) async {
  //   try {
  //     String url = 'http://127.0.0.1:3000/$path';
  //     print(url);
  //     final response = await http.get(Uri.parse(url));

  //     // list of ActGetDataModel

  //     List<ActGetDataModel> actGetDataModelList = [];

  //     for (var i in json.decode(response.body)) {
  //       // actGetDataModelList.add(ActGetDataModel.fromJson(i));
  //       ActGetDataProvider().addActGetDataModel(ActGetDataModel.fromJson(i));
  //       // print(i);
  //     }

  //     if (response.statusCode == 200) {
  //       // return List<Map<String, dynamic>>.from(json.decode(response.body));
  //       return actGetDataModelList;
  //     } else {
  //       print('Failed to fetch data with status code: ${response.statusCode}');
  //       return actGetDataModelList;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }
}
