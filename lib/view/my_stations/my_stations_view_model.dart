import 'package:flutter/material.dart';

class MyStationsViewModel extends ChangeNotifier {
  List<Map<String, String>> _stations = [
    {'name': 'İstasyon 1', 'location': 'Lokasyon 1'},
    {'name': 'İstasyon 2', 'location': 'Lokasyon 2'},
    {'name': 'İstasyon 3', 'location': 'Lokasyon 3'},
  ];

  List<Map<String, String>> get stations => _stations;

  void addStation(String name, String location) {
    _stations.add({
      'name': name,
      'location': location,
    });
    notifyListeners();
  }

  void updateStation(int index, String newName) {
    _stations[index]['name'] = newName;
    notifyListeners();
  }

  void deleteStation(int index) {
    _stations.removeAt(index);
    notifyListeners();
  }
}
