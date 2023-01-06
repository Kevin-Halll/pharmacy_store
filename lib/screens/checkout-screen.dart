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
                  Padding(padding: EdgeInsets.all(25),
                    child: TextMD(text: "Choose a payment method"),
                  ),
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Material(
                             elevation: 3,
                            borderRadius: BorderRadius.circular(15),
                            child: RadioListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Paypal"),
                                  Icon(Icons.paypal, color: Color(0xFF0A3B82),)
                                ],
                              ),
                              value: "paypal",
                              groupValue: payment,
                              onChanged: (value){
                                setState(() {
                                  payment = value.toString();
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 15,),
                          Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(15),
                            child: RadioListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Credit Card"),
                                  Icon(Icons.credit_card, color: Colors.blue,)
                                ],
                              ),
                              value: "credit-card",
                              groupValue: payment,
                              onChanged: (value){
                                setState(() {
                                  payment = value.toString();
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 15,),
                          Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(15),
                            child: RadioListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Apple Pay"),
                                  Icon(Icons.apple, color: Colors.black,)
                                ],
                              ),
                              value: "apple-pay",
                              groupValue: payment,
                              onChanged: (value){
                                setState(() {
                                  payment = value.toString();
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 20,),
                          SizedBox(
                            width: 260,
                            child: Material(
                              elevation: 3,
                              borderRadius: BorderRadius.circular(15),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: RadioListTile(
                                      title: Text("Pickup", style: TextStyle(fontSize: 12)),
                                      value: "pickup",
                                      groupValue: delivery,
                                      onChanged: (value){
                                        setState(() {
                                          delivery = value.toString();
                                        });
                                      },
                                    ),
                                  ),
                                  Flexible(
                                    child: RadioListTile(
                                      title: Text("Delivery", style: TextStyle(fontSize: 12),),
                                      value: "delivery",
                                      groupValue: delivery,
                                      onChanged: (value){
                                        setState(() {
                                          delivery = value.toString();
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SummaryCard(),
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
