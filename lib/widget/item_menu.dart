import 'package:flutter/material.dart';
import 'package:submission_bfaf_1/style/color.dart';
import 'package:submission_bfaf_1/style/text_style.dart';

class ItemMenu extends StatelessWidget {
  const ItemMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 30),
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: softGreenColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Ikan Kakap Bakar",
            style: myTexTheme.headline6?.copyWith(color: whiteColor),
          ),
          Image.asset("assets/icon_plus.png"),
        ],
      ),
    );
  }
}
