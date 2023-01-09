
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacy_store/utils/colors.dart';
import 'package:pharmacy_store/utils/text.dart';
import 'package:pharmacy_store/widgets/SummaryCard.dart';

import '../utils/inputValidators.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {

  final _formKey = GlobalKey<FormState>();
  final _field1Key = GlobalKey<FormFieldState>();
  final _field2Key = GlobalKey<FormFieldState>();
  final _field3Key = GlobalKey<FormFieldState>();
  final _field4Key = GlobalKey<FormFieldState>();
  FocusNode myFocusNode = new FocusNode();

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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top - kToolbarHeight,
          // height: newheight,
          // height: window.physicalSize.height,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      FaIcon(FontAwesomeIcons.creditCard, color: Colors.grey, size: 100,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Material(
                          elevation: 3,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      key: _field1Key,
                                      onChanged: (value) {
                                        _field1Key.currentState!.validate();
                                      },
                                      // The validator receives the text that the user has entered.
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter full name';
                                        }
                                        return null;
                                      },
                                      cursorColor: Paints.secondaryColor,
                                      decoration: InputDecoration(
                                        filled: true,
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide.none
                                        ),
                                        // border: OutlineInputBorder(borderSide: BorderSide.none),
                                        labelText: "Card Holder's Name",
                                        labelStyle: TextStyle(
                                            color: myFocusNode.hasFocus ? Colors.blue : Paints.secondaryColor
                                        ),
                                        hintText: "John Doe",
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      key: _field2Key,
                                      onChanged: (value){
                                        _field2Key.currentState!.validate();
                                        // myFocusNode.hasFocus;
                                      },
                                      // The validator receives the text that the user has entered.
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Your card number is required';
                                        }
                                        // if( !myFocusNode.hasFocus ) {
                                        //   return "Complete your 16 digit number";
                                        // }
                                        return null;
                                      },
                                      //<----------- Formatters ---------->
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        CardNumberFormatter(),
                                      ],
                                      keyboardType: TextInputType.number,
                                      maxLength: 25,
                                      //<----------------------------------->

                                      cursorColor: Paints.secondaryColor,
                                      decoration: InputDecoration(
                                        filled: true,

                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide.none
                                        ),
                                        // fillColor: _field2Key.currentState!.isValid ? Colors.red[200] : Colors.grey[200],
                                        // border: OutlineInputBorder(borderSide: !myFocusNode.hasFocus ? BorderSide() : BorderSide.none),
                                        labelText: "Card Number",
                                        labelStyle: TextStyle(
                                            color: myFocusNode.hasFocus ? Colors.blue : Paints.secondaryColor,
                                        ),
                                        hintText: "xxxx - xxxx - xxxx - xxxx",
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            key: _field3Key,
                                            onChanged: (value){
                                              _field3Key.currentState!.validate();
                                              // myFocusNode.hasFocus;
                                            },
                                            // The validator receives the text that the user has entered.
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Date required';
                                              }
                                              return null;
                                            },

                                            //<----------- Formatters ---------->
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              CardExpirationFormatter(),
                                            ],
                                            keyboardType: TextInputType.number,
                                            maxLength: 5,
                                            //<----------------------------------->


                                            cursorColor: Paints.secondaryColor,
                                            decoration: InputDecoration(
                                              filled: true,
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide.none
                                              ),
                                              // border: OutlineInputBorder(borderSide: BorderSide.none),
                                              labelText: "Expiration Date",
                                              labelStyle: TextStyle(
                                                  color: myFocusNode.hasFocus ? Colors.blue : Paints.secondaryColor
                                              ),
                                              hintText: "01/23",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            key: _field4Key,
                                            onChanged: (value){
                                              _field4Key.currentState!.validate();
                                            },
                                            // The validator receives the text that the user has entered.
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'CCV required';
                                              }
                                              return null;
                                            },

                                            //<----------- Formatters ---------->
                                            keyboardType: TextInputType.number,
                                            maxLength: 3,
                                            //<----------------------------------->
                                            cursorColor: Paints.secondaryColor,
                                            decoration: InputDecoration(
                                              filled: true,
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide.none
                                              ),
                                              // border: OutlineInputBorder(borderSide: BorderSide()),
                                              labelText: "CCV",
                                              labelStyle: TextStyle(
                                                  color: myFocusNode.hasFocus ? Colors.blue : Paints.secondaryColor
                                              ),
                                              hintText: "***",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SummaryCard(btnText: "Make Payment", onPressed: (){
                              Navigator.pushNamed(context, "/delivery");
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
        ),
      ),
    );
  }
}
