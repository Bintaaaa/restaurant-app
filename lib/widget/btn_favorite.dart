import 'package:flutter/material.dart';
import 'package:submission_bfaf_1/style/const.dart';

class BtnFav extends StatefulWidget {
  const BtnFav({Key? key}) : super(key: key);

  @override
  State<BtnFav> createState() => _BtnFavState();
}

class _BtnFavState extends State<BtnFav> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: () {
          setState(() {
            isFav = !isFav;
          });
        },
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Image.asset(
              isFav ? "assets/icon_fav_red.png" : "assets/icon_fav_black.png"),
        ),
      ),
    );
  }
}
