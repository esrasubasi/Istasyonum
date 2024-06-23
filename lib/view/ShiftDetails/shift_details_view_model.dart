import 'package:flutter/material.dart';

class ShiftDetailViewModel extends ChangeNotifier {
  List<Map<String, String>> _shifts = [];

  List<Map<String, String>> get shifts => _shifts;

  void addShift(String name, String date) {
    _shifts.add({
      'name': name,
      'date': date,
    });
    notifyListeners();
  }
}
