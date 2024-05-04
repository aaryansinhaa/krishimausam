import 'package:application/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:application/screens/loading.dart';
import 'package:application/screens/location.dart';

void main() {
  runApp(const MyApp());
}

class GlobalVariables {
  // ignore: non_constant_identifier_names
  static var APIKEY = "6f5c04f409fb57efcf4d618c650bbdc3";
  static var LOCN = "Delhi";
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Krishi Mausam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => Loading(),
        "/home": (context) => Home(),
      },
    );
  }
}
