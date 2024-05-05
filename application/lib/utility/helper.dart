import 'dart:convert';

import 'package:http/http.dart';

class Helper {
  //APIKEY
  static var APIKEY = "6f5c04f409fb57efcf4d618c650bbdc3";

  // Data Parameters

  String location;
  String? tempUI;
  String? temp_maxUI;
  String? temp_minUI;
  String? descriptionUI;
  String? iconUI;

  //Contructor
  Helper({required this.location}) {
    location = this.location;
  }

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
      Map temp_data = data["main"];
      double temp = temp_data["temp"];

      //String feeltemp = temp_data["feels_like"];
      double temp_min = temp_data["temp_min"];
      double temp_max = temp_data["temp_max"];
      List weather = data["weather"];
      Map description_data = weather[0];
      String icon = description_data["icon"];
      String description = description_data["main"];
      //assigning
      tempUI = temp.toString() + " °C";
      temp_maxUI = temp_max.toString() + " °C";
      temp_minUI = temp_min.toString() + " °C";
      descriptionUI = description;
      iconUI = icon;
    } catch (e) {
      tempUI = "Unknown Error Occured, Please try changing the name!";
      temp_minUI = "Unknown Error Occured, Please try changing the name!";
      temp_maxUI = "Unknown Error Occured, Please try changing the name!";
      descriptionUI = "Unknown Error Occured, Please try changing the name!";
      iconUI = "Unknown Error Occured, Please try changing the name!";
    }
  }
}
