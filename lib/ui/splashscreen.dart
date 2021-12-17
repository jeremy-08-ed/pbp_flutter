import 'dart:async';

import 'package:pbp_flutter/ui/home.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    StartSplashScreen();
  }

  StartSplashScreen() async {
    var duration = const Duration(milliseconds: 3000);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return const Home();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xFF409CA6),
        body: Container(
            height: screenheight,
            width: screenwidth,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('lib/images/Splashscreen.png'),
            ))));
  }
}
