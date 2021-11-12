import 'dart:convert';

import 'package:submission_bfaf_1/data/menu.dart';

class Restaurants{
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late double rating;
  late Menus menus;

  Restaurants({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus
});

  Restaurants.fromJson(Map<String, dynamic>restaurant){
    id = restaurant['id'];
    name = restaurant['name'];
    description = restaurant['description'];
    pictureId = restaurant['pictureId'];
    city = restaurant['city'];
    rating = restaurant['rating'].toDouble();
    menus = Menus.fromJson(restaurant['menus']);
  }
}

List<Restaurants> parseRestaurants(String? json){
  if(json == null) { return[]; }

  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => Restaurants.fromJson(json)).toList();
}