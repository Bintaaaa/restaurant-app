import 'dart:convert';

import 'package:submission_bfaf_1/data/restaurant_detail.dart';
import 'package:submission_bfaf_1/data/restaurants.dart';
import 'package:http/http.dart' as http;
class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';
  static const String _list = '/list';
  static const String _detail = '/detail/';
  static const String _search = '/search?q=';

  Future<Restaurants> listRestaurant() async {
    final response = await http.get(Uri.parse(_baseUrl + _list));
    if (response.statusCode == 200) {
      return Restaurants.fromJson(json.decode(response.body));
    } else {
      throw Exception('Maaf Silahkan Coba Lagi');
    }
  }

  Future<RestaurantsDetail>detailRestaurant(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + _detail + id));
    if(response.statusCode == 200){
      return RestaurantsDetail.fromJson(json.decode(response.body));
    }else{
      throw Exception('Maaf Silahkan Coba Lagi');
    }

  }
}