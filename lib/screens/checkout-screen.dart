import 'package:flutter/material.dart';
import 'package:pharmacy_store/utils/colors.dart';
import 'package:pharmacy_store/utils/text.dart';
import 'package:pharmacy_store/widgets/SummaryCard.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {

  String? gender;
  String? delivery;
  String? payment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Paints.white1,
      appBar: AppBar(
        backgroundColor: Paints.primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: TextLG(text: "Checkout", color: Colors.white,),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SummaryCard(route: "done"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
