import 'package:flutter/material.dart';

class EmployeeDetailViewModel extends ChangeNotifier {
  List<Map<String, String>> _employees = [];

  List<Map<String, String>> get employees => _employees;

  void addEmployee(String name, String position) {
    _employees.add({
      'name': name,
      'position': position,
    });
    notifyListeners();
  }
}
