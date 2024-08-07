import 'package:flutter/material.dart';
import 'package:flutter_application_pj2/components/my_button.dart';
import 'package:flutter_application_pj2/components/my_cart_tile.dart';
import 'package:flutter_application_pj2/models/shop.dart';
import 'package:flutter_application_pj2/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, shop, child) {
      //cart
      final userCart = shop.cart;

      //scaffold UI
      return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            actions: [
              //clear cart button
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure want to clear that?"),
                      actions: [
                        //cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),

                        //Yes button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            shop.clearCart();
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              )
            ],
          ),
          body: Column(
            children: [
              //list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text("Cart is empty.."),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                                itemCount: userCart.length,
                                itemBuilder: (context, index) {
                                  //get individual cart item
                                  final cartItem = userCart[index];

                                  //return
                                  return MyCartTile(
                                    cartItem: cartItem,
                                  );
                                }),
                          ),
                  ],
                ),
              ),
              //button to pay
              MyButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymMentPage(),
                  ),
                ),
                text: 'Go to Payment',
              ),

              const SizedBox(height: 25),
            ],
          ));
    });
  }
}
