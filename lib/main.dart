import 'package:flutter/material.dart';
import 'package:json_api/class/service.dart';
import 'package:json_api/screens/loading.dart';

Services service = Services();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Api",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoadingScreen(),
    );
  }
}
