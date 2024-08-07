import 'package:flutter/material.dart';
import 'package:flutter_application_pj2/components/my_button.dart';
import 'package:flutter_application_pj2/pages/delivery_progress_page.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymMentPage extends StatefulWidget {
  const PaymMentPage({super.key});

  @override
  State<PaymMentPage> createState() => _PaymMentPageState();
}

class _PaymMentPageState extends State<PaymMentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";

  bool showBackView = false;

  //user want pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // show dialog confirm
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirm payment'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number : $cardNumber"),
                Text("Expire date : $expiryDate"),
                Text("Card Holder Name : $cardHolderName"),
                Text("CVV : $cvvCode"),
              ],
            ),
          ),
          actions: [
            //cancel
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),

            //yes
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeliveryProgressPage(),
                  ),
                );
              },
              child: const Text("Yes"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Payment'),
      ),
      body: Column(
        children: [
          //crdit card
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: showBackView,
            onCreditCardWidgetChange: (p0) {},
          ),

          //credit card from
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
                showBackView = data.isCvvFocused;
              });
            },
            formKey: formKey,
          ),

          const Spacer(),

          MyButton(onTap: userTappedPay, text: 'Pay Now!'),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
