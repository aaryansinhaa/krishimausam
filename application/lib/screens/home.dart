import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  static const String routeName = "/home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var cityName = [
      "Mumbai",
      "Chennai",
      "Kolkata",
      "Bengaluru",
      "Delhi",
      "London",
      "Any City"
    ];
    var _random = new Random();
    var city = cityName[_random.nextInt(cityName.length)];
    final info = ModalRoute.of(context)!.settings.arguments as Map;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bgimg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      // searchBox
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      margin:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey.shade200,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.search_sharp),
                            ),
                            onTap: () {},
                          ),
                          Expanded(
                              child: TextField(
                            decoration: InputDecoration(
                              hintText: "Try Searching " + city,
                              border: InputBorder.none,
                            ),
                          )),
                        ],
                      ),
                    ),
                    Row(
                      //Description Card
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                Image.network(
                                    "https://openweathermap.org/img/wn/" +
                                        info["iconUI_key"] +
                                        "@2x.png"),
                                Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        info["descriptionUI_key"],
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "in Dehradun",
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // Temperature card
                      children: [
                        Expanded(
                          child: Container(
                            height: 250,
                            margin: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(WeatherIcons.thermometer),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 30, 5, 0),
                                          child: Text(
                                            info["tempUI_key"],
                                            style: GoogleFonts.poppins(
                                                color: Image.network(
                                                        "https://openweathermap.org/img/wn/" +
                                                            info["iconUI_key"] +
                                                            "@2x.png")
                                                    .color,
                                                fontSize: 60,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          "C",
                                          style: TextStyle(fontSize: 30),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //humidity and air speed card
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 150,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 18),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child:
                                                    Icon(WeatherIcons.humidity),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  "Humidity",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                info["humidityUI_key"],
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 40,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "%",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 150,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 18),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                    WeatherIcons.day_windy),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  "Wind Speed",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                info["airspeedUI_key"],
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 40,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "km/hr",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                //bottom text
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Data Provided by openweathermap.org",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
