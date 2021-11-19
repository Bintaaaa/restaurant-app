import 'package:flutter/cupertino.dart';
import 'package:submission_bfaf_1/API/api_service.dart';
import 'package:submission_bfaf_1/data/restaurants.dart';

enum ResultState { loading, nodata, hashData, error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }

  late Restaurants _restaurants;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  Restaurants get result => _restaurants;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.listRestaurant();
      if (restaurant.restaurantList.isEmpty) {
        _state = ResultState.nodata;
        notifyListeners();
        return _message = 'There is No Data in This System!';
      } else {
        _state = ResultState.hashData;
        notifyListeners();
        return _restaurants = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Please Check Your Connection!';
    }
  }
}
