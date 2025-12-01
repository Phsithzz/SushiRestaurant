import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/models/shop.dart';
import 'package:sushi_restaurant/screens/cart_page.dart';
import 'package:sushi_restaurant/screens/intro_page.dart';
import 'package:sushi_restaurant/screens/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=> Shop(),
    child:const MainApp())
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const IntroPage(),
      routes: {
        "intro_page":(context)=>const IntroPage(),
        "/menu_page":(context)=>const MenuPage(),
        "/cart_page":(context)=>const CartPage(),
      },
    );
  }
}
