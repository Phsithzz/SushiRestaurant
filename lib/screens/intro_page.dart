import 'package:flutter/material.dart';
import 'package:sushi_restaurant/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),

            const Text(
              "SUSHI MAN",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('assets/images/salmon.png'),
            ),
            const SizedBox(height: 25),

            const Text(
              "THE TASTE OF JAPANESE FOOD",
              style: TextStyle(fontSize: 44, color: Colors.white),
            ),
            const SizedBox(height: 10),

            Text(
              "Feel the taste of the most popular Japanesefood ",
              style: TextStyle(color: Colors.grey[300], height: 2),
            ),
            const SizedBox(height: 25),

            MyButton(
              text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, "/menu_page");
              },
            ),
          ],
        ),
      ),
    );
  }
}
