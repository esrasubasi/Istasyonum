import 'package:flutter/material.dart';
import 'package:istasyonum/view/ShiftDetails/shift_details_view_model.dart';
import 'package:provider/provider.dart';

class ShiftDetailPage extends StatefulWidget {
  @override
  _ShiftDetailPageState createState() => _ShiftDetailPageState();
}

class _ShiftDetailPageState extends State<ShiftDetailPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  void _saveShift() {
    final viewModel = Provider.of<ShiftDetailViewModel>(context, listen: false);
    viewModel.addShift(
      _nameController.text,
      _dateController.text,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShiftDetailViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vardiya Tanımla'),
          backgroundColor: Colors.purple.shade100,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Vardiya Adı',
                  filled: true,
                  fillColor: Colors.purple.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Vardiya Tarihi',
                  filled: true,
                  fillColor: Colors.purple.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveShift,
                child: Text('Kaydet'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.purple.shade50,
      ),
    );
  }
}
