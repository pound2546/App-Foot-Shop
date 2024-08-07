import 'package:flutter/material.dart';
import 'package:flutter_application_pj2/components/my_quantity_selecter.dart';
import 'package:flutter_application_pj2/models/cart_item.dart';
import 'package:flutter_application_pj2/models/shop.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, shop, child) => Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  //shoes image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.shoes.imagePath,
                      height: 150,
                      width: 150,
                    ),
                  ),

                  const SizedBox(width: 15),

                  //name and Price
                  Column(
                      children: [
                        //shoes name
                        Text(cartItem.shoes.name),

                        //shoes price
                        Text(
                          '\฿' + cartItem.shoes.price.toString(),
                        ),


                        const SizedBox(height: 15),


                      //add or delete quantity
                      QuantitySelector(
                        quantity: cartItem.quantity,
                        shoes: cartItem.shoes,
                        onDecrement: () {
                          shop.removeFromCart(cartItem);
                        },
                        onIncrement: () {
                          shop.addToCart(cartItem.shoes);
                        },
                      ),
                      ]
                      ),

                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
