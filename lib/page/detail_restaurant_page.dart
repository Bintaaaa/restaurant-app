import 'package:flutter/material.dart';
import 'package:submission_bfaf_1/style/color.dart';
import 'package:submission_bfaf_1/style/const.dart';
import 'package:submission_bfaf_1/style/text_style.dart';
import 'package:submission_bfaf_1/widget/item_menu.dart';

class DetailRestaurantPage extends StatelessWidget {
  const DetailRestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _imageRestaurant() {
      return Image.asset(
        "assets/14.jpg",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        fit: BoxFit.cover,
      );
    }

    Widget _detailRestaurant() {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
          padding: EdgeInsets.all(defaultPadding),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama Restaurant",
                style: myTexTheme.headline5,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                " is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap",
                style: myTexTheme.caption,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Foods",
                style: myTexTheme.headline6,
              ),
              ItemMenu(),
              ItemMenu(),
              ItemMenu(),
              ItemMenu(),
              SizedBox(
                height: 24,
              ),
              Text(
                "Drinks",
                style: myTexTheme.headline6,
              ),
              ItemMenu(),
              ItemMenu(),
            ],
          ),
        ),
      );
    }

    Widget _btnBack() {
      return SafeArea(
        child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(defaultMargin),
            child: Image.asset("assets/icon_back.png"),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          _imageRestaurant(),
          _detailRestaurant(),
          _btnBack(),
        ],
      ),
    );
  }
}
