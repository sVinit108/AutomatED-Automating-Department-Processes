import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  Map<String, List> filter = {};

  void setFilter(Map<String, List> newFilter) {
    filter = newFilter;
    notifyListeners();
  }

  void clearFilter() {
    filter = {};
    notifyListeners();
  }
}
