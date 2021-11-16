import 'package:submission_bfaf_1/data/restaurant_list.dart';

class Restaurants {
  final bool error;
  final String message;
  final int count;
  final List<RestaurantList> restaurantList;

  Restaurants(
      {required this.error,
      required this.message,
      required this.count,
      required this.restaurantList});

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
      error: json['error'],
      message: json['message'],
      count: json['count'],
      restaurantList:
      List<RestaurantList>.from(
      json["restaurants"].map((x) => RestaurantList.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(restaurantList.map((e) => e.toJson()))
      };
}
