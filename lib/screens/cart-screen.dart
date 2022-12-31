import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacy_store/utils/colors.dart';
import 'package:pharmacy_store/utils/text.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _amount = 100;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor: Paints.white1,
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
        centerTitle: true,
        title: TextLG(text: "My Cart", color: Paints.darkGrey,),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    TextMD(text: "8 items in cart"),

                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 118,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
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
                                         width: 100,
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
                              // color: Paints.darkGrey,
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.pink
                                    )
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                           decoration: BoxDecoration(
                                             border: Border.all(color: Colors.blue)
                                           ),
                                          child: Image.asset("assets/images/soles.png", width: 95, height: MediaQuery.of(context).size.width, fit: BoxFit.contain,)),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.green)
                                        ),
                                        child: Expanded(
                                          child: Row(
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      TextMD(text: "Orthopedic Soles", color: Paints.darkGrey, size: 14,),
                                                      SizedBox(
                                                        width: 50,
                                                        child: Divider(
                                                          color: Paints.secondaryColor,
                                                          thickness: 3,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        TextLG(text: "\$\284.50", color: Paints.secondaryColor, size: 16,),
                                                        SizedBox(width: 20,),
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
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
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
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
