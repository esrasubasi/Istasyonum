import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'work_hours_view_model.dart';

class WorkHours extends StatefulWidget {
  @override
  _WorkHoursState createState() => _WorkHoursState();
}

class _WorkHoursState extends State<WorkHours> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkHoursViewModel(),
      child: Consumer<WorkHoursViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Çalışma Saatlerim'),
              backgroundColor: Colors.purple.shade100,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: viewModel.workHours.length,
                itemBuilder: (context, index) {
                  final workHour = viewModel.workHours[index];
                  return Card(
                    color: Colors.purple.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(workHour['date'] ?? 'Bilinmeyen Tarih'),
                      subtitle: Text('Saat: ${workHour['hours'] ?? 'Bilinmeyen'}'),
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
