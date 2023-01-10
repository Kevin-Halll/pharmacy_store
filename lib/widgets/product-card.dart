import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text.dart';

class ProductCard extends StatelessWidget {

  String name;
  String image;
  num price;

   ProductCard({
     required this.name,
     required this.image,
     required this.price,
     Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Material(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: (){
                      print("here are the details");
                      Navigator.pushNamed(context, "/details");
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Image.network(image, height: 100,)),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Padding(padding: EdgeInsets.symmetric(vertical: 3),
                          child: TextMD(text: name),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 0),
                          child: Row(
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
                        ),
                        TextLG(text: "\$$price", color: Paints.secondaryColor,),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //********
                        // Add to cart button
                        //*********
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                                color: Paints.secondaryColor,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                            ),
                            child: Icon(Icons.add, color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
