import 'package:flutter/material.dart';
import 'package:pharmacy_store/utils/colors.dart';
import 'package:pharmacy_store/utils/text.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

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
    );
  }
}
