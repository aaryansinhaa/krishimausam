import 'dart:convert';
import 'dart:ffi';

import 'package:application/main.dart';
import 'package:flutter/material.dart';
import 'package:application/screens/loading.dart';
import 'package:application/screens/location.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  static const String routeName = "/home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getData() async {
    var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=" +
        GlobalVariables.LOCN +
        "&appid=" +
        GlobalVariables.APIKEY);
    Response response = await get(url);
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      Map temp_data = data["main"];
      double temp = temp_data["temp"];
      //String feeltemp = temp_data["feels_like"];
      double temp_min = temp_data["temp_min"];
      double temp_max = temp_data["temp_max"];
      List weather = data["weather"];
      Map description_data = weather[0];
      String icon = description_data["icon"];
      String description = description_data["main"];
      print(icon + ' ' + description);
      print(temp);
      print(temp_max);
      print(temp_min);
    } else {
      print("EXIT ERROR CODE: $response.statusCode");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text("Home!"),
      ),
    );
  }
}
