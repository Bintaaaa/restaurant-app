import 'package:flutter/cupertino.dart';
import 'package:submission_bfaf_1/API/api_service.dart';
import 'package:submission_bfaf_1/data/restaurant_list.dart';
import 'package:submission_bfaf_1/data/restaurants.dart';

enum ResultState { Loading, Nodata, HashData, Error }

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
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiService.listRestaurant();
      if (restaurant.restaurantList.isEmpty) {
        _state = ResultState.Nodata;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HashData;
        notifyListeners();
        return _restaurants = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Periksa Kembali Koneksi anda';
    }
  }
}
