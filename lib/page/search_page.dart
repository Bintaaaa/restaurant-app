import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_bfaf_1/API/api_service.dart';
import 'package:submission_bfaf_1/provider/restaurant_search_provider.dart';
import 'package:submission_bfaf_1/style/color.dart';
import 'package:submission_bfaf_1/style/const.dart';
import 'package:submission_bfaf_1/style/text_style.dart';
import 'package:submission_bfaf_1/widget/alert_search_lottie.dart';
import 'package:submission_bfaf_1/widget/card_restaurant.dart';
import 'package:submission_bfaf_1/widget/search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchText = "";
  final TextEditingController _searchController = TextEditingController();
  late RestaurantSearchProvider stateProvider;
  @override
  Widget build(BuildContext context) {
    var provider =
        RestaurantSearchProvider(apiService: ApiService(), query: "");
    Widget _buildList(BuildContext context) {
      return Consumer<RestaurantSearchProvider>(builder: (context, state, _) {
        stateProvider = state;
        if (state.state == ResultState.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.state == ResultState.hashData) {
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurants = state.result.restaurants[index];
              return CardRestaurant(
                restaurantList: restaurants,
              );
            },
          );
        } else if (state.state == ResultState.noData) {
          return AlertSearch(title: state.message);
        } else if (state.state == ResultState.error) {
          return AlertSearch(title: state.message);
        } else {
          return Center(child: Text(''));
        }
      });
    }

    Widget _searchBar() {
      return SearchBar(isFocus: true,controller: _searchController,onChange: (value) {
        searchApi(value);
        },);
    }

    Widget _header() {
      return Text(
        "Choose Your\nFavorite Restaurant",
        style: myTexTheme.headline5!.copyWith(color: hardGreenColor),
      );
    }



    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                _searchBar(),
                ChangeNotifierProvider<RestaurantSearchProvider>(
                    create: (_) => provider, child: _buildList(context))
              ],
            ),
          )
        ),
      ),
    );
  }
  void searchApi(String value){
    if(searchText == ""){
      stateProvider.searchAllRestourant(value);
    }
  }
}
