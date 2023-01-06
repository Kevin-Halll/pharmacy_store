import 'package:flutter/material.dart';
import 'package:pharmacy_store/utils/colors.dart';
import 'package:pharmacy_store/utils/text.dart';

import '../widgets/SummaryCard.dart';
import '../widgets/cart-card.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var item = [1, 2, 4, 5, 6, 7, 8, 9, 10];
  String navRoute = "/payments";
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor: Color(0xFFD5E8F4),
      appBar: AppBar(
        backgroundColor: Paints.primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Ink(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: Paints.primaryColor, borderRadius: BorderRadius.circular(10)),
            child: Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        title: TextLG(text: "My Cart", color: Colors.white,),
      ),

      body: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        TextMD(text: "${item.length} items in cart"),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.47,
                    child: ListView.builder(
                      itemCount: item.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: const CartCard(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
             Positioned(
              bottom: 0,
              child: SummaryCard(route: "payments"),
            ),
          ],
        ),
      ),
    ));
  }
}
