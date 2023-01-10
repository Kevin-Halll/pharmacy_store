import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text.dart';

class CategoryCard extends StatelessWidget {

  final String text;
  final String imageUrl;
  final String itemCount;
  final String id;

  const CategoryCard({required this.text, required this.imageUrl, required this.itemCount, required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Navigator.pushNamed(context, "/products");
        Navigator.pushNamed(context, arguments: id, "/products");
      },
      child: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.black)
        // ),
        height: 80,
        // width: 16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrl, width: 70, height: 70, fit: BoxFit.contain,),
            SizedBox(width: 5,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextMD(text: "${text}\nProducts", color: Paints.white1,),
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
