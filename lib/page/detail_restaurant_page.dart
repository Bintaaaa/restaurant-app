import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:submission_bfaf_1/API/api_service.dart';
import 'package:submission_bfaf_1/data/restaurant_profile.dart';
import 'package:submission_bfaf_1/provider/restaurant_detail_provider.dart';
import 'package:submission_bfaf_1/style/color.dart';
import 'package:submission_bfaf_1/style/const.dart';
import 'package:submission_bfaf_1/style/text_style.dart';
import 'package:submission_bfaf_1/widget/btn_back.dart';
import 'package:submission_bfaf_1/widget/item_menu.dart';

class DetailRestaurantPage extends StatelessWidget {
  final String id;

  const DetailRestaurantPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _imageRestaurant(context, RestaurantProfile restaurantProfile) {
      return Image.network(
        "https://restaurant-api.dicoding.dev/images/small/${restaurantProfile.pictureId}",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        fit: BoxFit.cover,
      );
    }
    Widget _itemMenu(context, index) {
      return ItemMenu(
        name: index,
      );
    }

    Widget _detailRestaurant(
        BuildContext context, RestaurantProfile restaurantProfile) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    restaurantProfile.name,
                    style: myTexTheme.headline5,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/star_rate.png"),
                      Text(
                        restaurantProfile.rating.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: myTexTheme.caption!.copyWith(fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                restaurantProfile.description,
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
                itemCount: restaurantProfile.menus.foods.length,
                itemBuilder: (context, index) => _itemMenu(
                    context,
                    restaurantProfile.menus.foods
                        .map((e) => e.name)
                        .toList()[index]
                        .toString()),
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
                itemCount: restaurantProfile.menus.drinks.length,
                itemBuilder: (context, index) => _itemMenu(
                    context,
                    restaurantProfile.menus.drinks
                        .map((e) => e.name)
                        .toList()[index]
                        .toString()),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Reviews",
                style: myTexTheme.headline6,
              ),
              SizedBox(
                height: 24,
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.zero,
                itemCount: restaurantProfile.customerReviews.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding - 8,
                        vertical: defaultPadding),
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: greyColor.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 2)),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              restaurantProfile.customerReviews[index].name,
                              style:
                                  myTexTheme.headline6?.copyWith(fontSize: 16),
                            ),
                            Text(
                              restaurantProfile.customerReviews[index].date,
                              style: myTexTheme.caption
                                  ?.copyWith(color: greyColor),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          restaurantProfile.customerReviews[index].review,
                          style: myTexTheme.caption,
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      );
    }



    Widget _build() {
      return Consumer<RestaurantDetailPovider>(builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.state == ResultState.hashData) {
          return Stack(
            children: [
              _imageRestaurant(context, state.result.restaurant),
              _detailRestaurant(context, state.result.restaurant),
            ],
          );
        } else if (state.state == ResultState.noData) {
          return Center(
            child: Column(
              children: [
                Lottie.asset("assets/search.json"),
                Text(
                  state.message,
                  style: myTexTheme.headline5,
                )
              ],
            ),
          );
        } else if (state.state == ResultState.error) {
          return Center(
              child: Column(
            children: [
              Lottie.asset('assets/error.json'),
              Text(
                state.message,
                style: myTexTheme.headline5,
              )
            ],
          ));
        } else {
          return Center(child: Text(''));
        }
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          ChangeNotifierProvider(
            create: (_) => RestaurantDetailPovider(
                apiService: ApiService(), id: id),
            child: _build(),
          ),
          BtnBack()
        ],
      ),
    );
  }
}
