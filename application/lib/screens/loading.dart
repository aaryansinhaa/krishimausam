import 'package:application/screens/home.dart';
import 'package:application/utility/helper.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Shimmer.fromColors(
            child: Text("Loading"),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100),
      )),
    );
  }
}
