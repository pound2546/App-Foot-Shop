import 'package:flutter_application_pj2/models/shoes.dart';

class CartItem {
  Shoes shoes;
  int quantity;

  CartItem({
    required this.shoes,
    this.quantity = 1,
  });

  double get totalPrice {
    return shoes.price * quantity;
  }
}
