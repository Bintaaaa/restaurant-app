import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:submission_bfaf_1/style/color.dart';
import 'package:submission_bfaf_1/style/text_style.dart';

class AlertSearch extends StatelessWidget {
  final String title;
  const AlertSearch({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset("assets/search.json"),
          Center(
            child: Text(
              title,
              style: myTexTheme.headline5?.copyWith(color: hardGreenColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
