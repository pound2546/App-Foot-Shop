import 'package:flutter/material.dart';
import 'package:flutter_application_pj2/components/my_button.dart';
import 'package:flutter_application_pj2/models/shoes.dart';
import 'package:flutter_application_pj2/models/shop.dart';
import 'package:provider/provider.dart';

class ShoesPage extends StatefulWidget {
  final Shoes shoes;

  const ShoesPage({
    super.key,
    required this.shoes,
  });

  @override
  State<ShoesPage> createState() => _ShoesPageState();
}

class _ShoesPageState extends State<ShoesPage> {
  //method to add cart
  void addToCart(Shoes shoes) {
    //close to ga back to Home
    Navigator.pop(context);

    //add to cart
    context.read<Shop>().addToCart(shoes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //shoes image
            Image.asset(widget.shoes.imagePath),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //shoes name
                  Text(
                    widget.shoes.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),

                  //shoes Price
                  Text(
                    widget.shoes.price.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 15),

                  //SHOES DESCRIPTION
                  Text(widget.shoes.description),

                  const SizedBox(height: 45),
                ],
              ),
            ),

            //button
            MyButton(
              onTap: () => addToCart(widget.shoes),
              text: 'Add to cart',
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
