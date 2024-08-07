import 'package:flutter/material.dart';
import 'package:flutter_application_pj2/components/my_receipt.dart';
import 'package:flutter_application_pj2/models/shop.dart';
import 'package:flutter_application_pj2/services/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  
  
  //get db
  FirestoreService db = FirestoreService();
  
  @override
  void initState() {
    super.initState();

    String receipt = context.read<Shop>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  //custom Bottom Navbar -ข้อความกับโทร
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(children: [
        //profile of driver
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 10),

        //driver detail
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Thanaphon S.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              "Driver",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),

        const Spacer(),

        Row(
          children: [
            //message button
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message_sharp),
                color: Colors.black,
              ),
            ),

            const SizedBox(
              width: 10,
            ),

            //call button
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call),
                color: Colors.green,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
