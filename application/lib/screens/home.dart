import 'package:flutter/material.dart';

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
    final info = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Image.network('https://openweathermap.org/img/wn/' +
              info['iconUI_key'] +
              '.png'),
          Text(info["tempUI_key"]),
          Text(info["descriptionUI_key"]),
        ],
      )),
    );
  }
}
