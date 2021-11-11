import 'dart:async';

import 'package:flutter/material.dart';
import 'package:submission_bfaf_1/style/color.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, '/get-started');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softGreenColor,
      body: Center(
        child: Image.asset("assets/splash.png"),
      ),
    );
  }
}
