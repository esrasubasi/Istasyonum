import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shift_approval_view_model.dart';

class ShiftApproval extends StatefulWidget {
  @override
  _ShiftApprovalState createState() => _ShiftApprovalState();
}

class _ShiftApprovalState extends State<ShiftApproval> {
  void _approveShift(int index, ShiftApprovalViewModel viewModel) {
    viewModel.approveShift(index);
  }

  void _rejectShift(int index, ShiftApprovalViewModel viewModel) {
    viewModel.rejectShift(index);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShiftApprovalViewModel(),
      child: Consumer<ShiftApprovalViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Vardiya Onaylama'),
              backgroundColor: Colors.purple.shade100,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: viewModel.shifts.length,
                itemBuilder: (context, index) {
                  final shift = viewModel.shifts[index];
                  return Card(
                    color: Colors.purple.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(shift['shiftName'] ?? 'Bilinmeyen Vardiya'),
                      subtitle: Text('Durum: ${shift['status'] ?? 'Bilinmeyen'}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.check, color: Colors.green),
                            onPressed: () => _approveShift(index, viewModel),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.red),
                            onPressed: () => _rejectShift(index, viewModel),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            backgroundColor: Colors.purple.shade50,
          );
        },
      ),
    );
  }
}
