import 'package:flutter/material.dart';

class ReportDetailViewModel extends ChangeNotifier {
  List<Map<String, String>> _reports = [];

  List<Map<String, String>> get reports => _reports;

  void addReport(String title, String description) {
    _reports.add({
      'title': title,
      'description': description,
    });
    notifyListeners();
  }
}
