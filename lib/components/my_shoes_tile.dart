import 'package:flutter/material.dart';
import 'package:flutter_application_pj2/models/shoes.dart';

class ShoesTile extends StatelessWidget {
  final Shoes shoes;
  final void Function()? onTap;

  const ShoesTile({
    super.key,
    required this.shoes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // text shoes details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(shoes.name),
                      Text(
                        shoes.price.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        shoes.description,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 20),

                //shoes image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    shoes.imagePath,
                    height: 120,
                  ),
                ),

                //divider Line
                const Divider(
                  color: Colors.black,
                  endIndent: 25,
                  indent: 8,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
