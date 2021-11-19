import 'package:flutter/material.dart';
import 'package:submission_bfaf_1/style/const.dart';

class BtnBack extends StatelessWidget {
  const BtnBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Image.asset("assets/icon_back.png"),
        ),
      ),
    );
  }
}
