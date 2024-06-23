import 'package:flutter/material.dart';

class MyEmployeesViewModel extends ChangeNotifier {
  List<Map<String, String>> _employees = [
    {'name': 'Çalışan 1', 'position': 'Pozisyon 1'},
    {'name': 'Çalışan 2', 'position': 'Pozisyon 2'},
    {'name': 'Çalışan 3', 'position': 'Pozisyon 3'},
  ];

  List<Map<String, String>> get employees => _employees;

  void addEmployee(String name, String position) {
    _employees.add({
      'name': name,
      'position': position,
    });
    notifyListeners();
  }

  void updateEmployee(int index, String newName) {
    _employees[index]['name'] = newName;
    notifyListeners();
  }

  void deleteEmployee(int index) {
    _employees.removeAt(index);
    notifyListeners();
  }
}
