import 'package:flutter/material.dart';

class ShiftApprovalViewModel extends ChangeNotifier {
  List<Map<String, String>> _shifts = [
    {'shiftName': 'Vardiya 1', 'status': 'Beklemede'},
    {'shiftName': 'Vardiya 2', 'status': 'Beklemede'},
    {'shiftName': 'Vardiya 3', 'status': 'Beklemede'},
  ];

  List<Map<String, String>> get shifts => _shifts;

  void approveShift(int index) {
    _shifts[index]['status'] = 'Onaylandı';
    notifyListeners();
  }

  void rejectShift(int index) {
    _shifts[index]['status'] = 'Reddedildi';
    notifyListeners();
  }
}
