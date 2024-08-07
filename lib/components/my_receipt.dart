import 'package:flutter/material.dart';
import 'package:flutter_application_pj2/models/shop.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          children: [
            const Text("Thank you for your order!"),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(25),
              child: Consumer<Shop>(
                builder: (context, shop, child) =>
                    Text(shop.displayCartReceipt()),
              ),
            ),
            const SizedBox(height: 25),
            const Text("เวลาจัดส่งประมาณ 30 นาที"),
          ],
        ),
      ),
    );
  }
}
