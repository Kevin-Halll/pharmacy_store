import 'package:flutter/material.dart';
import 'package:pharmacy_store/components/footer.dart';
import 'package:pharmacy_store/utils/colors.dart';
import 'package:pharmacy_store/utils/text.dart';
import 'package:pharmacy_store/widgets/appDrawer.dart';
import 'package:pharmacy_store/widgets/category-card.dart';

import '../model/category.dart';
import '../services/category-service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var apiLink2 = "https://pharmacy-api-eta.vercel.app/api/v1/categories";

  List<ProductCategory> category = [];

  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  getCategories() async {
    try{
      category = await CategoryService().getCategories();
      if(category != 0) {
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
    return Visibility(
      visible: isLoaded,
      replacement: Scaffold(
        backgroundColor: Paints.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: CircularProgressIndicator(color: Colors.white,),)
          ],
        ),
      ),
      child: Scaffold(
        drawer: Drawer(

        ),
        backgroundColor: Paints.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //this is the banner section...
                Material(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 0.9],
                        colors: [
                          // Color(0xFFFDFAF3),
                          // Color(0xFFFFE3C8),
                          Color(0xFFFAEBDD),
                          Color(0xFFFACB9F),
                        ]
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)
                      )
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 80,),
                              // TextLG(text: "For Your\nPresciption Needs"),
                              Text("For Your\nPresciption Needs", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "Kalam"),),
                              SizedBox(height: 10,),
                              TextSM(text: "this will be some actual content text in\nthe future but for now its better"),
                              SizedBox(height: 30,),
                              ElevatedButton(
                                  onPressed: (){},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Paints.secondaryColor),
                                    foregroundColor: MaterialStateProperty.all(Paints.white1),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                                    child: TextMD(text: "Register",),
                                  )
                              )
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 50,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset("assets/images/bottle-of-pills3.png", height: 315),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextLG(text: "Categories", color: Paints.white1),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, "/categories");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextMD(text: "SEE ALL", color: Paints.white1,),
                            Icon(Icons.arrow_forward, color: Paints.white1, ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //this is the category display section...
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20),),
                        child: Container(
                          // width: MediaQuery.of(context).size.width * 0.5,
                          padding: EdgeInsets.all(25),
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
                            boxShadow: [
                              // BoxShadow(
                              //   color: Colors.grey.withOpacity(0.5),
                              //   spreadRadius: 1,
                              //   blurRadius: 7,
                              //   offset: Offset(0, 3),
                              // ),
                            ]
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: CategoryCard(text: category[0].name, imageUrl: "${apiLink2}/image/${category[0].id}", itemCount: "120 items", id: category[0].id,)),
                              SizedBox(
                                  width: 150,
                                  child: CategoryCard(text: category[1].name, imageUrl: "${apiLink2}/image/${category[1].id}", itemCount: "120 items", id: category[1].id,)),
                              SizedBox(
                                  width: 150,
                                  child: CategoryCard(text: category[2].name, imageUrl: "${apiLink2}/image/${category[2].id}", itemCount: "120 items", id: category[2].id,)),
                            ],
                          ),
                          // child: Column(
                          //   children: [
                          //     ListView.builder(
                          //
                          //         itemCount: category.length - 8,
                          //         scrollDirection: Axis.horizontal,
                          //         itemBuilder: (BuildContext context, index) {
                          //           return SizedBox(
                          //               width: 150,
                          //               child: CategoryCard(text: category[index].name, imageUrl: "${apiLink2}/image/${category[index].id}", itemCount: "120 items", id: category[index].id,));
                          //         }),
                          //   ],
                          // ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20),),
                          child: Container(
                            // width: MediaQuery.of(context).size.width * 0.5,
                            padding: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20),),
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
                                SizedBox(
                                    width: 150,
                                    child: CategoryCard(text: category[3].name, imageUrl: "${apiLink2}/image/${category[3].id}", itemCount: "120 items", id: category[3].id,)),
                                SizedBox(
                                    width: 150,
                                    child: CategoryCard(text: category[4].name, imageUrl: "${apiLink2}/image/${category[4].id}", itemCount: "120 items", id: category[4].id,)),
                                SizedBox(
                                    width: 150,
                                    child: CategoryCard(text: category[5].name, imageUrl: "${apiLink2}/image/${category[5].id}", itemCount: "120 items", id: category[5].id,)),
                              ],
                            ),
                            // child: Column(
                            //   children: [
                            //     ListView.builder(
                            //
                            //         itemCount: category.length - 8,
                            //         scrollDirection: Axis.horizontal,
                            //         itemBuilder: (BuildContext context, index) {
                            //           return SizedBox(
                            //               width: 150,
                            //               child: CategoryCard(text: category[index].name, imageUrl: "${apiLink2}/image/${category[index].id}", itemCount: "120 items", id: category[index].id,));
                            //         }),
                            //   ],
                            // ),
                          ),
                        ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                // Info/action card 1....
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 288,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 70,),
                                  TextLG(text: "Free Online Consultations!"),
                                  TextSM(text: "At Amber Pharmaceuticals we provide the best\npharmacists and doctors around the clock to provide\nassistance with any of your prescription queries.\nYou can rest assure that this consultation medium\nis safe and confidential."),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          onPressed: (){},
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Paints.secondaryColor),
                                            foregroundColor: MaterialStateProperty.all(Paints.white1),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                                            child: TextMD(text: "Chat",),
                                          )
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: 25,),
                                  Row(
                                    children: [
                                      Container(
                                        width: 250,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          color: Paints.secondaryColor,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(width: 30,),
                                  Image.asset("assets/images/doctor.png", width: 200),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Info/action card 2....
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 280,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 75,),
                                  TextLG(text: "We Deliver to Our Members!"),
                                  TextSM(text: "As a member at Amber Pharma you can enjoy\nthe convenience of our fast and efficient delivery\nservices. This and a lot more when you become a\nmember of our pharmacy."),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          onPressed: (){},
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Paints.tertiaryColor),
                                            foregroundColor: MaterialStateProperty.all(Paints.white1),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                                            child: TextMD(text: "Become a Member",),
                                          )
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: 25,),
                                  Row(
                                    children: [
                                      Container(
                                        width: 250,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          color: Paints.tertiaryColor,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(width: 70,),
                                  Image.asset("assets/images/delivery-boy.png", width: 160),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(20),
                      child: TextLG(text: "News Letters"),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("BUMDES Desa Sidosari Produksi\nObat Pertanian", style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 15,),
                                  Text("BUMDES Desa Sidosari Berinovas..."),
                                  SizedBox(height: 15,),
                                  Text("13 Jan 2022", style: TextStyle(color: Colors.grey),),
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network("https://picsum.photos/300/300?random=3", width: 120, height: 120,),
                              ),
                            ],
                          ),
                          Divider(height: 30,)
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("BUMDES Desa Sidosari Produksi\nObat Pertanian", style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 15,),
                                  Text("BUMDES Desa Sidosari Berinovas..."),
                                  SizedBox(height: 15,),
                                  Text("13 Jan 2022", style: TextStyle(color: Colors.grey),),
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network("https://picsum.photos/300/300?random=6", width: 120, height: 120,),
                              ),
                            ],
                          ),
                          Divider(height: 30,)
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("BUMDES Desa Sidosari Produksi\nObat Pertanian", style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 15,),
                                  Text("BUMDES Desa Sidosari Berinovas..."),
                                  SizedBox(height: 15,),
                                  Text("13 Jan 2022", style: TextStyle(color: Colors.grey),),
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network("https://picsum.photos/300/300?random=1", width: 120, height: 120,),
                              ),
                            ],
                          ),
                          Divider(height: 30,)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                            onPressed: (){},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Paints.tertiaryColor),
                              foregroundColor: MaterialStateProperty.all(Paints.white1),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                              child: TextMD(text: "View Our News Letters",),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
                 Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
