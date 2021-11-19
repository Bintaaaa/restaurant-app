import 'package:flutter/cupertino.dart';
import 'package:submission_bfaf_1/API/api_service.dart';
import 'package:submission_bfaf_1/data/restaurant_detail.dart';


enum ResultState{ loading, noData, hashData, error}
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
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.detailRestaurant(id);
      // ignore: unrelated_type_equality_checks
      if(restaurant.restaurant == []){
        _state = ResultState.noData;
        notifyListeners();
        return _message = "There is No Data in This System!";
      }else{
        _state = ResultState.hashData;
        notifyListeners();
        return _result = restaurant;
      }
    }catch(e){
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Please Check Your Connection!';
    }
  }

}



