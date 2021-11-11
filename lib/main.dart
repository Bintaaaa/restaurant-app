import 'package:flutter/material.dart';
import 'package:submission_bfaf_1/page/detail_restaurant_page.dart';
import 'package:submission_bfaf_1/page/get_started_page.dart';
import 'package:submission_bfaf_1/page/home_page.dart';
import 'package:submission_bfaf_1/page/splashscreen_page.dart';
import 'package:submission_bfaf_1/style/color.dart';
import 'package:submission_bfaf_1/style/text_style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kotak Temu",
      theme: ThemeData(
        textTheme: myTexTheme,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: hardGreenColor,
        ),
      ),
      routes: {
        '/': (context) => SplashscreenPage(),
        '/get-started': (context) => GetStartedPage(),
        '/home': (context) => HomePage(),
        '/detail-restaurant': (context) => DetailRestaurantPage()
      },
    );
  }
}
