import 'package:flutter/material.dart';
import 'package:submission_bfaf_1/data/restaurants.dart';
import 'package:submission_bfaf_1/style/color.dart';
import 'package:submission_bfaf_1/style/const.dart';
import 'package:submission_bfaf_1/style/text_style.dart';
import 'package:submission_bfaf_1/widget/item_menu.dart';

class DetailRestaurantPage extends StatelessWidget {
  final Restaurants restaurants;

  const DetailRestaurantPage({Key? key, required this.restaurants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _imageRestaurant() {
      return Image.network(
        restaurants.pictureId,
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.6,
        fit: BoxFit.cover,
      );
    }

    Widget _itemMenu(context, index) {
      return ItemMenu(name: index,);
    }

    Widget _detailRestaurant() {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin:
          EdgeInsets.only(top: MediaQuery
              .of(context)
              .size
              .height * 0.5),
          padding: EdgeInsets.all(defaultPadding),
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurants.name,
                style: myTexTheme.headline5,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                restaurants.description,
                style: myTexTheme.caption,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Foods",
                style: myTexTheme.headline6,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: restaurants.menus.foods.length,
                itemBuilder: (context, index) => _itemMenu(context, restaurants.menus.foods.map((e) => e.name).toList()[index].toString())
                ,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Drinks",
                style: myTexTheme.headline6,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: restaurants.menus.drinks.length,
                itemBuilder: (context,index) => _itemMenu(context, restaurants.menus.drinks.map((e) => e.name).toList()[index].toString()),
              ),
            ],
          ),
        ),
      );
    }

    Widget _btnBack() {
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
