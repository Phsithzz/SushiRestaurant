import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/components/button.dart';
import 'package:sushi_restaurant/models/food.dart';
import 'package:sushi_restaurant/models/shop.dart';
import 'package:sushi_restaurant/theme/colors.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  //quantity
  int quantityCount = 0;

  //decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //increament quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  //add to cart
  void addToCart() {
    //only add to cart if there is something in the cart
    if (quantityCount > 0) {
      //get access to shop
      final shop = context.read<Shop>();
      //add to cart
      shop.addToCart(widget.food, quantityCount);
      //let the user know it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: Text("Successfuly added to cart",style: TextStyle(color:Colors.white),textAlign: TextAlign.center,),
          actions: [
            //okay button
            IconButton(
              onPressed: () {
                //pop once to remove dialog box
                Navigator.pop(context);
                //pop again to go previous screen
                Navigator.pop(context);
              },
              icon: Icon(Icons.done,color:Colors.white),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //listview of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  //image
                  Image.asset(widget.food.imagePath, height: 200),
                  const SizedBox(height: 25),
                  //rating
                  Row(
                    children: [
                      //start icon
                      Icon(Icons.star, color: Colors.amberAccent),
                      const SizedBox(width: 5),
                      //rating number
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  //food name
                  Text(widget.food.name, style: TextStyle(fontSize: 28)),
                  //description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Fresh and premium-cut salmon served on perfectly seasoned Japanese rice. Soft, buttery texture with a naturally sweet flavor that melts in your mouth.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //price + quantity +add to cart button
          Container(
            color: primaryColor,
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                //price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      "\$" + widget.food.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    //quantity
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: Icon(Icons.remove, color: Colors.white),
                          ),
                        ),
                        //quantity count
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        //plus buutton
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                //add to cart button
                MyButton(text: "Add to Cart", onTap: addToCart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
