import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/colors.dart';
import '../utils/text.dart';

class CartCard extends StatefulWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int _amount = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 118,
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.black, width: 2),
          ),
          child: Stack(
            children: [
              GestureDetector(
                onTap: (){
                  print("you tried to delete");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Material(
                              elevation: 1,
                              color: Paints.primaryColor,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                              // child: Icon(Icons.delete),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Center(child: FaIcon(FontAwesomeIcons.trashCan, color: Colors.white, size: 15,)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.78,
                child: Material(
                  borderRadius: BorderRadius.circular(15),

                  color: Colors.white,
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        //<---------- Cart item Image ------------------>
                        Image.asset("assets/images/soles.png", width: 90, height: MediaQuery.of(context).size.width, fit: BoxFit.contain,),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5,),
                                        TextMD(text: "Orthopedic Soles", color: Paints.darkGrey, size: 15,),
                                        SizedBox(
                                          width: 45,
                                          child: Divider(
                                            height: 0,
                                            color: Paints.secondaryColor,
                                            thickness: 3,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextLG(text: "\$2\284.50", color: Paints.secondaryColor, size: 16,),
                                        // SizedBox(width: 20,),
                                        //<------------- amount increment/decrement -------------->
                                        Material(
                                          elevation: 0,
                                          // color: Paints.secondaryColor,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                                          child: Row(
                                            children: [
                                              //<------------ decrease number of items ------------>
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (_amount <= 1) {
                                                      _amount = 1;
                                                    }
                                                    _amount--;
                                                  });
                                                },
                                                icon: Ink(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(7.32),
                                                      border: Border.all(color: Paints.whiteOpacity)
                                                  ),
                                                  height: 24,
                                                  width: 20,
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size: 10,
                                                    // color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              //<------------ display of number of items ------------>
                                              // Text('$_amount'),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                                child: TextMD(text: "$_amount",),
                                              ),

                                              //<------------ increase number of items ------------>
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _amount++;
                                                  });
                                                },
                                                icon: Ink(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(7.32),
                                                      border: Border.all(color: Paints.white1)
                                                  ),
                                                  height: 24,
                                                  width: 20,
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 10,
                                                    // color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
