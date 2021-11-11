import 'package:flutter/material.dart';
import 'package:submission_bfaf_1/style/color.dart';
import 'package:submission_bfaf_1/style/const.dart';
import 'package:submission_bfaf_1/style/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return Text(
        "Choose Your\nFavorite Restaurant",
        style: myTexTheme.headline5!.copyWith(color: hardGreenColor),
      );
    }

    Widget _searchBar() {
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
        ),
      );
    }

    Widget _cardRestaurant(){
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/detail-restaurant');
        },
        child: Container(
          margin: EdgeInsets.only(bottom: defaultMargin),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage("assets/14.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.all(defaultMargin),
                    padding: EdgeInsets.all(defaultPadding),
                    height: 110,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Kafe Kita",
                                style: myTexTheme.headline6,
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/star_rate.png"),
                                  Text(
                                    "4",
                                    style: myTexTheme.caption!
                                        .copyWith(fontSize: 18),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/location_on.png"),
                              Text("Gorontalo",style: myTexTheme.caption!.copyWith(fontSize: 18,color: softGreenColor),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: middleGreyColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                _searchBar(),
                _cardRestaurant()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
