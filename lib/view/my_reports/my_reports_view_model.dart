import 'package:flutter/material.dart';

class MyReportsViewModel extends ChangeNotifier {
  List<String> _reports = ['Rapor 1', 'Rapor 2', 'Rapor 3'];

  List<String> get reports => _reports;

  void addReport(String reportName) {
    _reports.add(reportName);
    notifyListeners();
  }

  void updateReport(int index, String newName) {
    _reports[index] = newName;
    notifyListeners();
  }

  void deleteReport(int index) {
    _reports.removeAt(index);
    notifyListeners();
  }
}
