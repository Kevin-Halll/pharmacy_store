import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/colors.dart';
import '../utils/text.dart';
import '../widgets/SummaryCard.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {

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
        title: TextLG(text: "Payment Method", color: Colors.white,),
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
                                  FaIcon(FontAwesomeIcons.creditCard, color: Colors.blue, size: 20,)
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
                        SummaryCard(btnText: "Proceed to Checkout", onPressed: (){
                          Navigator.pushNamed(context, "/checkout");
                        }),
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
