import 'package:flutter/material.dart';
import 'package:pharmacy_store/components/footer.dart';
import 'package:pharmacy_store/utils/colors.dart';
import 'package:pharmacy_store/utils/text.dart';

import '../widgets/category-card.dart';

class CategoryScreen extends StatelessWidget {

  var item = [1,2,3,4,5,6,7,8,9];
   CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: TextLG(text: "All Categories", color: Colors.white,),
          centerTitle: true,
        ),
        backgroundColor: Paints.primaryColor,
        body: Column(
          children: [
            SingleChildScrollView(
              child: Expanded(
                child: Container(
                  // width: 100,
                  // height: 100,
                  // color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 20,),
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(25),),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20),),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.1, 0.9],
                                  colors: [
                                    Color(0xFF45A996),
                                    Color(0xFF0F5E5F),
                                  ]
                              ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 2,
                                child: GridView.count(
                                    shrinkWrap: false,
                                    primary: false,
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 25,
                                    mainAxisSpacing: 0,
                                    childAspectRatio: 1.5,
                                    children:

                                    // <--------------- list generated from list called categories --------------->
                                    List.generate(item.length, (index) {
                                      return Container(
                                          height: 400,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            // border: Border.all(color: Colors.blue)
                                          ),
                                          child: CategoryCard(text: "Orthopedic\nProducts", imageUrl: "assets/images/soles.png", itemCount: "147 items"));
                                    })),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(alignment: Alignment.bottomLeft,child: Footer()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
