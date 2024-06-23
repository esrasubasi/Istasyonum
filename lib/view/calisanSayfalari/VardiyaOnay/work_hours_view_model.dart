import 'package:flutter/material.dart';

class WorkHoursViewModel extends ChangeNotifier {
  List<Map<String, String>> _workHours = [
    {'date': '2023-01-01', 'hours': '8'},
    {'date': '2023-01-02', 'hours': '6'},
    {'date': '2023-01-03', 'hours': '7'},
  ];

  List<Map<String, String>> get workHours => _workHours;

  void addWorkHours(String date, String hours) {
    _workHours.add({'date': date, 'hours': hours});
    notifyListeners();
  }
}
