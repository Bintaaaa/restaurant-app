
import 'package:flutter/material.dart';
import 'package:submission_bfaf_1/style/color.dart';
import 'package:submission_bfaf_1/style/const.dart';

class SearchBar extends StatelessWidget {
  final bool isFocus;
  final Function()? onTap;
  final Function(String)? onChange;
  final TextEditingController? controller;
  const SearchBar({Key? key,this.isFocus = false, this.onTap, this.onChange, this.controller}) : super(key: key);

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
        controller: controller,
        decoration: InputDecoration(
            hintText: "Search Your Favorite Restaurant",
            hintStyle: TextStyle(color: softGreyColor),
            icon: Image.asset("assets/icon_search.png"),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none),
        autofocus: isFocus,
        onTap: onTap,
        onChanged: onChange,
      ),
    );
  }
}
