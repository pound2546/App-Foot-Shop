import 'package:flutter/material.dart';
import 'package:flutter_application_pj2/models/shoes.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Shoes shoes;
  final VoidCallback onIncrement; //เพิ่ม
  final VoidCallback onDecrement; //ลด

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.shoes,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: const Icon(
              Icons.remove,
              size: 20,
              color: Colors.black,
            ),
          ),

          //quantity count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 10,
              child: Center(
                child: Text(
                  quantity.toString(),
                ),
              ),
            ),
          ),

          //increase button
          GestureDetector(
            onTap: onIncrement,
            child: const Icon(
              Icons.add,
              size: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
