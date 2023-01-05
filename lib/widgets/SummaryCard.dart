import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 280,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            // border: Border.all(color: Colors.grey, style: BorderStyle.solid),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    height: 40,
                    child: Center(child: TextLG(text: 'Payment Summary'))),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1, color: Colors.grey),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextMD(text: 'Sub Total'),
                              TextMD(text: '\$1088'),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1, color: Colors.grey),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextMD(text: 'Tax'),
                              TextMD(text: '15%'),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextMD(text: 'Total'),
                              TextMD(text: '\$1950.00'),
                            ],
                          ),
                        ),
                      ],
                    )),
                // SizedBox(
                //     width: 350,
                //     height: 50,
                //     child: TextButton(
                //         child: BigText(text: 'CHECHOUT', color: Colors.white,),
                //         style: ButtonStyle(
                //             padding:
                //             MaterialStateProperty.all<EdgeInsets>(
                //                 EdgeInsets.all(15)),
                //             backgroundColor:
                //             MaterialStateProperty.all<Color>(
                //                 AppColor.secondBlue),
                //             // foregroundColor: MaterialStateProperty.all<Color>(
                //             //     Colors.blue.shade900),
                //             shape: MaterialStateProperty.all<
                //                 RoundedRectangleBorder>(
                //                 RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(25.0),
                //                   // side: BorderSide(color: Colors.red)
                //                 ))),
                //         onPressed: () => null)),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, "/checkout");
                        },
                      child: TextLG(text: "CHECKOUT"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Paints.secondaryColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999)
                          )
                        )
                      ),
                    ),
                    // child: MainButtons(
                    //     isLoading: false,
                    //     text: "CHECKOUT",
                    //     onclickFunction: () {
                    //       Navigator.pushNamed(context, "/checkout");
                    //     }),
                  ),
                )
              ]),
        ),
      ],
    );
  }
}