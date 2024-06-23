import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_station_view_model.dart';

class AddStation extends StatefulWidget {
  @override
  _AddStationState createState() => _AddStationState();
}

class _AddStationState extends State<AddStation> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  void _saveStation() {
    final viewModel = Provider.of<AddStationViewModel>(context, listen: false);
    viewModel.addStation(
      _nameController.text,
      _locationController.text,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddStationViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Yeni İstasyon Ekle'),
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
                  labelText: 'İstasyon Adı',
                  filled: true,
                  fillColor: Colors.purple.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'İstasyon Lokasyonu',
                  filled: true,
                  fillColor: Colors.purple.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveStation,
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
