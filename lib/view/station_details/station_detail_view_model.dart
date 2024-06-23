import 'package:flutter/material.dart';

class StationDetailViewModel extends ChangeNotifier {
  List<Map<String, String>> _stations = [];

  List<Map<String, String>> get stations => _stations;

  void addStation(String name, String location) {
    _stations.add({
      'name': name,
      'location': location,
    });
    notifyListeners();
  }
}
