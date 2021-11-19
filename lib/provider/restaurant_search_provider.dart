import 'package:flutter/cupertino.dart';
import 'package:submission_bfaf_1/API/api_service.dart';
import 'package:submission_bfaf_1/data/restaurant_search.dart';

enum ResultState { loading, noData, hashData, error }

class RestaurantSearchProvider extends ChangeNotifier {
  late final ApiService apiService;
  late final String query;

  RestaurantSearchProvider({required this.apiService, required this.query}) {
    searchAllRestourant(query);
  }

  late RestaurantSearch _result;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  RestaurantSearch get result => _result;
  ResultState get state => _state;

  Future<dynamic> searchAllRestourant(query) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.searchRestaurant(query);
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'There is No Data in This System!';
      } else {
        _state = ResultState.hashData;
        notifyListeners();
        return _result = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Let's Find Your Favorite Restaurant Now!";
    }
  }
}