import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:submission_bfaf_1/API/api_service.dart';
import 'package:submission_bfaf_1/page/search_page.dart';
import 'package:submission_bfaf_1/provider/restaurants_provider.dart';
import 'package:submission_bfaf_1/style/color.dart';
import 'package:submission_bfaf_1/style/const.dart';
import 'package:submission_bfaf_1/style/text_style.dart';
import 'package:submission_bfaf_1/widget/card_restaurant.dart';
import 'package:submission_bfaf_1/widget/search_bar.dart';

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
      return SearchBar(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
        onChange: (value){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
      );
    }

    Widget _buildList(BuildContext context) {
      return Consumer<RestaurantProvider>(builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.state == ResultState.hashData) {
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: state.result.restaurantList.length,
            itemBuilder: (context, index) {
              var restaurants = state.result.restaurantList[index];
              return CardRestaurant(
                restaurantList: restaurants,
              );
            },
          );
        } else if (state.state == ResultState.nodata) {
          return Center(child: Text(state.message));
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
                ChangeNotifierProvider<RestaurantProvider>(
                  create: (_) => RestaurantProvider(apiService: ApiService()),
                  child: _buildList(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
