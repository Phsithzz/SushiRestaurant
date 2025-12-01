import 'package:flutter/material.dart';
import 'package:sushi_restaurant/models/food.dart';

class Shop extends ChangeNotifier {
  //food menu
  final List<Food> _foodMenu = [
    Food(
      name: "Salmon Sushi",
      price: "25.00",
      imagePath: "assets/images/sushi.png",
      rating: "4.9",
    ),
    //tuna sushi
    Food(
      name: "Tuna Sushi",
      price: "50.00",
      imagePath: "assets/images/sushi.png",
      rating: "4.9",
    ),
  ];

  //customr cart
  List<Food> _cart = [];

  //getter method
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food foodItem) {
    _cart.remove(foodItem);
    notifyListeners();
  }
}
