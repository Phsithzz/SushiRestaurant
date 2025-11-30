import 'package:flutter/material.dart';
import 'package:sushi_restaurant/screens/intro_page.dart';
import 'package:sushi_restaurant/screens/menu_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:IntroPage(),
      routes: {
        "intro_page":(context)=>const IntroPage(),
        "/menu_page":(context)=>const MenuPage(),
      },
    );
  }
}
