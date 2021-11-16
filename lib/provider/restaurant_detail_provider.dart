import 'package:flutter/cupertino.dart';
import 'package:submission_bfaf_1/API/api_service.dart';
import 'package:submission_bfaf_1/data/restaurant_detail.dart';


enum ResultState{ Loading, NoData, HashData, Error}
class RestaurantDetailPovider extends ChangeNotifier{
  final ApiService apiService;
  final String id;
  RestaurantDetailPovider({required this.apiService, required this.id}){
    _fetchDetailRestaurant();
  }

  late RestaurantsDetail _result;
  late ResultState _state;
  late String _message;

  RestaurantsDetail get result => _result;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _fetchDetailRestaurant() async {
    try{
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiService.detailRestaurant(id);
      if(restaurant.restaurant == null || restaurant.restaurant == []){
        _state = ResultState.NoData;
        notifyListeners();
        return _message = "Data tidak tersedia didalam sistem";
      }else{
        _state = ResultState.HashData;
        notifyListeners();
        return _result = restaurant;
      }
    }catch(e){
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Periksa Kembali Koneksi anda $e';
    }
  }

}



