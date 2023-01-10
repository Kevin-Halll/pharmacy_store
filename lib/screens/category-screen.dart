import 'package:flutter/material.dart';
import 'package:pharmacy_store/components/footer.dart';
import 'package:pharmacy_store/model/category.dart';
import 'package:pharmacy_store/services/category-service.dart';
import 'package:pharmacy_store/utils/colors.dart';
import 'package:pharmacy_store/utils/text.dart';

import '../widgets/category-card.dart';

class CategoryScreen extends StatefulWidget {

   CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var item = [1,2,3,4,5,6,7,8,9];

  var apiLink = "https://pharmacy-api-eta.vercel.app/api/v1/categories";

  List<ProductCategory> category = [];

  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //  get products
    print("products page initialized");
    getCategories();
  }

  getCategories() async {
    try{
      category = await CategoryService().getCategories();
      if(category.length > 0) {
        print("all is null");
        isLoaded = true;
      }
      setState(() {});
    }catch(error){
      print(error);
    }

  }

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
                                    List.generate(category.length, (index) {
                                      return Container(
                                          height: 400,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            // border: Border.all(color: Colors.blue)
                                          ),
                                          child: CategoryCard(text: category[index].name, imageUrl: "${apiLink}/image/${category[index].id}", itemCount: "147 items", id: category[index].id,));
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
