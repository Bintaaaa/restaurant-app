import 'dart:convert';

import 'package:submission_bfaf_1/data/restaurant_profile.dart';

class RestaurantsDetail {

  final bool error;
  final String message;
  final RestaurantProfile restaurant;

  RestaurantsDetail({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory RestaurantsDetail.fromRawJson(String str) =>
      RestaurantsDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RestaurantsDetail.fromJson(Map<String, dynamic> json) =>
      RestaurantsDetail(
        error: json["error"],
        message: json["message"],
        restaurant: RestaurantProfile.fromJson(json["restaurant"]),
      );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "restaurant": restaurant.toJson(),
  };
}








