import 'package:flutter/material.dart';
import 'package:submission_bfaf_1/data/restaurant_list.dart';
import 'package:submission_bfaf_1/page/detail_restaurant_page.dart';
import 'package:submission_bfaf_1/style/color.dart';
import 'package:submission_bfaf_1/style/const.dart';
import 'package:submission_bfaf_1/style/text_style.dart';
import 'package:submission_bfaf_1/widget/transisi.dart';

class CardRestaurant extends StatelessWidget {
  final RestaurantList restaurantList;
  final Function() onTap;
  const CardRestaurant({Key? key, required this.restaurantList, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      //     () {
      //   Navigator.of(context).push(Geser(child: DetailRestaurantPage(restaurants: restaurant,)));
      // },
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
                    image: NetworkImage("https://restaurant-api.dicoding.dev/images/small/${restaurantList.pictureId}"),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(defaultMargin),
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin-4,
                    vertical: defaultMargin,
                  ),
                  height: 110,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            restaurantList.name,
                            style: myTexTheme.headline6?.copyWith(fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Image.asset("assets/star_rate.png"),
                              Text(
                                restaurantList.rating.toString(),
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
                            restaurantList.city,
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
          ],
        ),
      ),
    );
  }
}
