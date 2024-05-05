import 'package:application/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:application/screens/loading.dart';
import 'package:application/screens/location.dart';

void main() {
  runApp(const MyApp());
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
        "/": (context) => const Loading(),
        "/home": (context) => const Home(),
      },
    );
  }
}
