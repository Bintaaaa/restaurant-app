import 'package:flutter/material.dart';
import 'package:submission_bfaf_1/data/restaurants.dart';
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

    Widget _cardRestaurant(BuildContext context, Restaurants restaurant) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail-restaurant', arguments: restaurant);
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
                      image: NetworkImage(restaurant.pictureId),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                restaurant.name.toString(),
                                style: myTexTheme.headline6,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/star_rate.png"),
                                  Text(
                                    restaurant.rating.toString(),
                                    overflow: TextOverflow.ellipsis,
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
                              Text(
                                restaurant.city,
                                style: myTexTheme.caption!.copyWith(
                                    fontSize: 18, color: softGreenColor),
                              )
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
                FutureBuilder<String>(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/local_restaurant.json'),
                  builder: (context, snapshot) {
                    final List<Restaurants> restaurant =
                        parseRestaurants(snapshot.data);
                    return ListView.builder(
                      primary: false, // untuk scroll bila didalam scrollview
                      shrinkWrap: true,
                      itemCount: restaurant.length,
                      itemBuilder: (context, index) {
                        return _cardRestaurant(context, restaurant[index]);
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
