import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text.dart';

class SummaryCard extends StatelessWidget {

  // final void Function() onPressed;
  final VoidCallback onPressed;
  final String btnText;
   SummaryCard({Key? key, required this.btnText, required this.onPressed }) : super(key: key);

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
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: onPressed,
                      child: TextLG(text: btnText),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                        backgroundColor: MaterialStateProperty.all(Paints.secondaryColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999)
                          )
                        )
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ],
    );
  }
}