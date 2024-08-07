import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    //text style
    var myPrimaryTextStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    var mySecondaryTextStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery free
          Column(
            children: [
              Text(
                '฿50',
                style: myPrimaryTextStyle,
              ),
              Text(
                "delivery",
                style: mySecondaryTextStyle,
              ),
            ],
          ),

          //delivery time
          Column(
            children: [
              Text(
                '15-30 min',
                style: myPrimaryTextStyle,
              ),
              Text(
                "Delivery Time",
                style: mySecondaryTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
