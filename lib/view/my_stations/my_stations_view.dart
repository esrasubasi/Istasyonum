import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../my_employees/my_employees_view.dart';
import '../my_reports/my_reports_view.dart';
import '../my_shifts/my_shifts_view.dart';
import '../station_details/station_details_view.dart';
import 'my_stations_view_model.dart';

class MyStations extends StatefulWidget {
  @override
  _MyStationsState createState() => _MyStationsState();
}

class _MyStationsState extends State<MyStations> {
  void _showPopupMenu(BuildContext context, int index, MyStationsViewModel viewModel) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(200, 200, 0, 0),
      items: [
        PopupMenuItem<int>(
          value: 0,
          child: Text("İstasyon Güncelle"),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: Text("İstasyon Sil"),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value == 0) {
        _showUpdateDialog(index, viewModel);
      } else if (value == 1) {
        viewModel.deleteStation(index);
      }
    });
  }

  void _showUpdateDialog(int index, MyStationsViewModel viewModel) {
    TextEditingController _updateController = TextEditingController();
    if (viewModel.stations[index] != null) {
      _updateController.text = viewModel.stations[index]['name'] ?? '';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("İstasyon Güncelle"),
          content: TextField(
            controller: _updateController,
            decoration: InputDecoration(hintText: "Yeni istasyon adını girin"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("İptal"),
            ),
            TextButton(
              onPressed: () {
                viewModel.updateStation(index, _updateController.text);
                Navigator.of(context).pop();
              },
              child: Text("Güncelle"),
            ),
          ],
        );
      },
    );
  }

  void _onBottomNavTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyStations()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyEmployees()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyShifts()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyReports()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyStationsViewModel(),
      child: Consumer<MyStationsViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('İstasyonlarım'),
              backgroundColor: Colors.purple.shade100,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: viewModel.stations.length,
                      itemBuilder: (context, index) {
                        final station = viewModel.stations[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.purple.shade50,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    station['name'] ?? 'Bilinmeyen İstasyon',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.more_vert, color: Colors.purple[300]),
                                onPressed: () {
                                  _showPopupMenu(context, index, viewModel);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StationDetailPage()),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.purple,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.gasPump),
                  label: 'İstasyonlarım',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.users),
                  label: 'Çalışanlarım',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.calendar),
                  label: 'Vardiyalarım',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.clipboardList),
                  label: 'Raporlarım',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.purple,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.purple.shade100,
              onTap: _onBottomNavTapped,
            ),
          );
        },
      ),
    );
  }
}
