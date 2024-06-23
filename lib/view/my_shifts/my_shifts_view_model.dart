import 'package:flutter/material.dart';

class MyShiftsViewModel extends ChangeNotifier {
  List<Map<String, String>> _shifts = [
    {'name': 'Vardiya 1', 'date': '2023-01-01'},
    {'name': 'Vardiya 2', 'date': '2023-01-02'},
    {'name': 'Vardiya 3', 'date': '2023-01-03'},
  ];

  List<Map<String, String>> get shifts => _shifts;

  void addShift(String name, String date) {
    _shifts.add({
      'name': name,
      'date': date,
    });
    notifyListeners();
  }

  void updateShift(int index, String newName) {
    _shifts[index]['name'] = newName;
    notifyListeners();
  }

  void deleteShift(int index) {
    _shifts.removeAt(index);
    notifyListeners();
  }
}
