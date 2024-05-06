import 'package:application/screens/home.dart';
import 'package:application/utility/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String humidityUI = "Loading";
  String airspeedUI = "Loading";
  String descriptionUI = "Loading";
  String iconUI = "Loading";
  String tempUI = "Loading";
  void initApp() async {
    Helper helper = Helper(location: "Dehradun");
    await helper.getData();
    setState(() {
      tempUI = helper.tempUI!;
      humidityUI = helper.humidityUI!;
      airspeedUI = helper.windspeedUI!;
      descriptionUI = helper.descriptionUI!;
      iconUI = helper.iconUI!;
      Navigator.pushReplacementNamed(context, Home.routeName, arguments: {
        "tempUI_key": tempUI,
        "airspeedUI_key": airspeedUI,
        "humidityUI_key": humidityUI,
        "descriptionUI_key": descriptionUI,
        "iconUI_key": iconUI,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      initApp();
    });
    //
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bgimg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Krishi Mausam",
                                style: GoogleFonts.poppins(
                                  fontSize: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "A weather forecast App",
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.yellow.shade300),
                          ),
                          Image.asset("assets/images/logo.png")
                        ],
                      ),
                    ),
                    SpinKitThreeBounce(
                      color: Colors.white,
                      size: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Shimmer.fromColors(
                        child: Text(
                          "Loading",
                          style: GoogleFonts.poppins(fontSize: 30),
                        ),
                        baseColor: Colors.white,
                        highlightColor: Color.fromARGB(255, 233, 222, 123),
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Made with ",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    WidgetSpan(
                      child: Icon(
                        CupertinoIcons.heart,
                        size: 15,
                      ),
                    ),
                    TextSpan(
                        text: " by Aaryan",
                        style: GoogleFonts.dancingScript(
                            color: Colors.yellow, fontSize: 15))
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
