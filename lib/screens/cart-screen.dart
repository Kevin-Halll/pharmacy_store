import 'package:flutter/material.dart';
import 'package:pharmacy_store/utils/colors.dart';
import 'package:pharmacy_store/utils/text.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Ink(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: Paints.secondaryColor, borderRadius: BorderRadius.circular(10)),
            child: Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                TextMD(text: "8 items in cart"),

              ],
            )
          ],
        ),
      ),
    ));
  }
}
