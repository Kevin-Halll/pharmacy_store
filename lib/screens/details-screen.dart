import 'package:flutter/material.dart';
import 'package:pharmacy_store/utils/colors.dart';
import 'package:pharmacy_store/utils/text.dart';

import '../components/footer.dart';


class ProductDetails extends StatefulWidget {

   ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _amount = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Ink(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.arrow_back),
            ),
          ),
          iconTheme: IconThemeData(
            color: Paints.darkGrey,
          ),
          titleSpacing: 10,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Paints.darkGrey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Paints.primaryColor,
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Image.asset("assets/images/soles.png"),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(25),
                color: Paints.white1,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        TextLG(text: "Orthopecid Soles"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, size: 12, color: Paints.tertiaryColor,),
                        Icon(Icons.star, size: 12, color: Paints.tertiaryColor,),
                        Icon(Icons.star, size: 12, color: Paints.tertiaryColor,),
                        Icon(Icons.star, size: 12, color: Paints.tertiaryColor,),
                        Icon(Icons.star, size: 12, color: Paints.tertiaryColor,),
                        SizedBox(width: 5,),
                        TextSM(text: "(547)")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextLG(text: "\$\284.50", color: Paints.secondaryColor,),
                        //<----------------- item amount button toggles ----------->//
                        Material(
                          elevation: 2,
                          color: Paints.secondaryColor,
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
                                      border: Border.all(color: Paints.whiteOpacity)),
                                  height: 24,
                                  width: 24,
                                  child: const Icon(
                                    Icons.remove,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              //<------------ display of number of items ------------>
                              // Text('$_amount'),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextLG(text: "$_amount", color: Colors.white,),
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
                                  width: 24,
                                  child: const Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: (){},
                          style: ButtonStyle(
                            maximumSize: MaterialStateProperty.all(MediaQuery.of(context).size),
                            backgroundColor: MaterialStateProperty.all(Paints.secondaryColor),
                            foregroundColor: MaterialStateProperty.all(Paints.white1),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)
                              ),
                            ),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                            child: TextLG(text: "Add to Cart",),
                          )
                      ),
                    ),
                    SizedBox(height: 15,),
                    SizedBox(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: TextMD(text: "At Amber Pharmaceuticals we provide the best pharmacists and doctors around the clock to provide\nassistance with any of your prescription queries.\nYou can rest assure that this consultation medium\nis safe and confidential.")),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(child: TextMD(text: "At Amber Pharmaceuticals we provide the best pharmacists and doctors around the clock to provide\nassistance with any of your prescription queries.\nYou can rest assure that this consultation medium\nis safe and confidential.")),
                              ],
                            ), Row(
                              children: [
                                Expanded(child: TextMD(text: "At Amber Pharmaceuticals we provide the best pharmacists and doctors around the clock to provide\nassistance with any of your prescription queries.\nYou can rest assure that this consultation medium\nis safe and confidential.")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}
