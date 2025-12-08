import 'package:flutter/material.dart';
import 'package:sushi_restaurant/models/food.dart';

class Shop extends ChangeNotifier {

  final List<Food> _foodMenu = [
    Food(
      name: "Salmon Sushi",
      price: "25.00",
      imagePath: "assets/images/salmon.png",
      rating: "4.8",
      description: "Fresh, thick-cut salmon with a soft, buttery texture that melts in your mouth. Served on fragrant Japanese sushi rice seasoned with a delicate vinegar blend for a perfectly balanced bite."
    ),

    Food(
      name: "Tuna Sushi",
      price: "50.00",
      imagePath: "assets/images/tuna.png",
      rating: "4.5",
      description: "A premium combination of rich, buttery salmon and flavorful, tender tuna. This duo delivers a perfectly balanced taste and texture, served with authentic soy sauce and wasabi for an elevated sushi experience."
      
    ),
    Food(
      name: "Ramen",
      price: "100.00",
      imagePath: "assets/images/ramen.png",
      rating: "5.0",
      description: "A bowl of rich, slow-cooked broth paired with springy ramen noodles. Topped with tender chashu pork, a soft-boiled egg, and fresh scallions to create a deeply comforting and flavorful Japanese classic."
    ),
  ];


  List<Food> _cart = [];


  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;


  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food foodItem) {
    _cart.remove(foodItem);
    notifyListeners();
  }
}
