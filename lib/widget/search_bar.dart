import 'package:flutter/material.dart';
import 'package:submission_bfaf_1/page/search_page.dart';
import 'package:submission_bfaf_1/style/color.dart';
import 'package:submission_bfaf_1/style/const.dart';

class SearchBar extends StatelessWidget {
  final bool isFocus;
  const SearchBar({Key? key,this.isFocus = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin, bottom: defaultMargin),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 3,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: softGreyColor),
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search Your Favorite Restaurant",
            hintStyle: TextStyle(color: softGreyColor),
            icon: Image.asset("assets/icon_search.png"),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none),
        autofocus: isFocus,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
      ),
    );
  }
}
