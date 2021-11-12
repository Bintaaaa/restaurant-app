import 'package:submission_bfaf_1/data/drinks.dart';
import 'package:submission_bfaf_1/data/foods.dart';

class Menus {
  final List<Foods> foods;
  final List<Drinks> drinks;

  Menus({required this.foods, required this.drinks});

  List<Object> get props => [
        foods,
        drinks,
      ];

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Foods>.from(
          json['foods'].map(
            (food) => Foods.fromJson(food),
          ),
        ),
        drinks: List<Drinks>.from(
          json['drinks'].map(
            (drink) => Drinks.fromJson(drink),
          ),
        ),
      );
}
