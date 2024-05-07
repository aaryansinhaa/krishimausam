import 'dart:convert';

import 'package:http/http.dart';

class Helper {
  //APIKEY
  static var APIKEY = "";

  // Data Parameters

  String location;

  //Contructor
  Helper({required this.location}) {
    location = this.location;
  }
  String? tempUI;
  String? humidityUI;
  String? windspeedUI;
  String? descriptionUI;
  String? iconUI;
  // Methods to get values of the Data parameters
  Future<void> getData() async {
    try {
      var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=" +
          location +
          "&appid=" +
          APIKEY +
          "&units=metric");
      Response response = await get(url);

      Map data = jsonDecode(response.body);
      print(data);
      Map temp_data = data["main"];
      double temp = temp_data["temp"];

      //String feeltemp = temp_data["feels_like"];
      int humidity = temp_data["humidity"];
      Map windData = data["wind"];
      double speed = windData["speed"];
      List weather = data["weather"];
      Map description_data = weather[0];
      String icon = description_data["icon"];
      String description = description_data["main"];
      //assigning
      tempUI = temp.toString();
      humidityUI = humidity.toString();
      windspeedUI = (speed * 3.6).toString();
      descriptionUI = description;
      iconUI = icon;
    } catch (e) {
      tempUI = "N/ A";
      humidityUI = "N/ A";
      windspeedUI = "N/ A";
      descriptionUI = "City not found";
      iconUI = "N/ A";
    }
  }
}
