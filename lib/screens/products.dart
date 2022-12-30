import 'package:flutter/material.dart';
import 'package:pharmacy_store/utils/text.dart';
import 'package:pharmacy_store/widgets/product-card.dart';

import '../components/footer.dart';
import '../utils/colors.dart';
import '../widgets/category-card.dart';

class ProductScreen extends StatelessWidget {

  var item = [1,2,3,4,5,6,7,8,9];

   ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Paints.white1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Container with search bar....
              Material(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50))
                ),
                child: Container(
                  padding: EdgeInsets.all(25),
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFAEBDD),
                        Color(0xFFFACB9F),
                      ],
                      stops: [0.1, 0.9],
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        elevation: 1,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search_outlined, color: Paints.darkGrey,),
                            hintText: "Search",
                            hintStyle: TextStyle(fontFamily: "Kalam"),
                            fillColor: Colors.white,
                            filled: true,
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none
                              )
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 15,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
            // ******
              //Banner strip with list of categories...
           // *******
              Container(
                height: 110,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF45A996),
                      Color(0xFF0F5E5F),
                    ],
                    stops: [0.1, 0.9]
                  ),
                ),
                // child: ListView.builder(
                //
                //     itemCount: 6,
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (BuildContext context, index) {
                //       // return CategoryCard(text: "Medication\nProducts", imageUrl: "assets/images/bottle-of-pills.png", itemCount: "120 items");
                //       return  Row(
                //         children: [
                //           CategoryCard(text: "Medication\nProducts", imageUrl: "assets/images/bottle-of-pills.png", itemCount: "120 items"),
                //           // ClipRRect(
                //           //   borderRadius: BorderRadius.circular(15),
                //           //   child: Image.network("https://picsum.photos/300/300?random=6", width: 120, height: 120,),
                //           // ),
                //         ],
                //       );
                //     }),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 150, child: CategoryCard(text: "Medication\nProducts", imageUrl: "assets/images/bottle-of-pills.png", itemCount: "120 items")),
                      SizedBox(width: 150, child: CategoryCard(text: "Medication\nProducts", imageUrl: "assets/images/bottle-of-pills.png", itemCount: "120 items")),
                      SizedBox(width: 150, child: CategoryCard(text: "Medication\nProducts", imageUrl: "assets/images/bottle-of-pills.png", itemCount: "120 items")),
                      SizedBox(width: 150, child: CategoryCard(text: "Medicationddddddddddddddddd\nProducts", imageUrl: "assets/images/bottle-of-pills.png", itemCount: "120 items")),
                      SizedBox(width: 150, child: CategoryCard(text: "Medicationddddddddddddddddd\nProducts", imageUrl: "assets/images/bottle-of-pills.png", itemCount: "120 items")),
                      SizedBox(width: 150, child: CategoryCard(text: "Medicationddddddddddddddddd\nProducts", imageUrl: "assets/images/bottle-of-pills.png", itemCount: "120 items")),
                    ],
                  ),
                ),
              ),
              //**********
              // Product grid display section
              //***********
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextLG(text: "Orthopedic Products", color: Paints.secondaryColor,),
                  ),
                  GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.7,
                      children:

                      // <--------------- list generated from list called categories --------------->
                      List.generate(item.length, (index) {
                        return ProductCard();
                      }))
                ],
              ),
              SizedBox(height: 30,),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
