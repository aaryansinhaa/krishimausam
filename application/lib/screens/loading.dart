import 'package:application/screens/home.dart';
import 'package:application/utility/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String temp_maxUI = "Loading";
  String temp_minUI = "Loading";
  String descriptionUI = "Loading";
  String iconUI = "Loading";
  String tempUI = "Loading";
  String location = "Loading";
  void initApp() async {
    String location = "Dehradun";
    Helper instance = Helper(location: location);
    await instance.getData();
    setState(() {
      tempUI = instance.tempUI!;
      temp_maxUI = instance.temp_maxUI!;
      temp_minUI = instance.temp_minUI!;
      descriptionUI = instance.descriptionUI!;
      iconUI = instance.iconUI!;
      Navigator.pushReplacementNamed(context, Home.routeName, arguments: {
        "location": location,
        "tempUI_key": tempUI,
        "temp_maxUI_key": temp_maxUI,
        "temp_minUI_key": temp_minUI,
        "descriptionUI_key": descriptionUI,
        "iconUI_key": iconUI,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initApp();
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Shimmer.fromColors(
                        child: Text(
                          "Loading",
                          style: GoogleFonts.poppins(fontSize: 50),
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
