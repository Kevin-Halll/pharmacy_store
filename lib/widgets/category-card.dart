import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text.dart';

class CategoryCard extends StatelessWidget {

  final String text;
  final String imageUrl;
  final String itemCount;

  const CategoryCard({required this.text, required this.imageUrl, required this.itemCount, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "/products");
      },
      child: Container(
        height: 80,
        child: Row(
          children: [
            Image.asset(imageUrl, width: 60,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextMD(text: text, color: Paints.white1,),
                  TextSM(text: itemCount, color: Paints.white1,)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
