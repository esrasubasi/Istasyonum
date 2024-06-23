import 'package:flutter/material.dart';
import 'package:istasyonum/view/authenticate/login/login_view.dart';
import 'package:istasyonum/view/my_employees/my_employees_view.dart';
import 'package:istasyonum/view/my_shifts/my_shifts_view.dart';

import 'package:istasyonum/view/my_stations/my_stations_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginView());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
