import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/colors.dart';
import '../utils/text.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Paints.primaryColor,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: FaIcon(FontAwesomeIcons.squareFacebook, size: 25, color: Paints.white1,),
              ),Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: FaIcon(FontAwesomeIcons.instagram, size: 25, color: Paints.white1,),
              ),Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: FaIcon(FontAwesomeIcons.twitter, size: 25, color: Paints.white1,),
              ),

            ],
          ),
          Divider(
            color: Paints.whiteOpacity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0, vertical: 5),
            child: SizedBox(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextMD(text: "Privacy Policy", color: Paints.white1,),
                  VerticalDivider(color: Paints.whiteOpacity,),
                  TextMD(text: "User Agreement", color: Paints.white1,),
                  VerticalDivider(color: Paints.whiteOpacity,),
                  TextMD(text: "Terms of Sale", color: Paints.white1,),
                ],
              ),
            ),
          ),
          Divider(
            color: Paints.whiteOpacity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset("assets/images/truste-certified-privacy.png", width: 130,),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextSM(text: "@ 2012 - 2023 Amber Pharma All Rights Reserved.", color: Paints.whiteOpacity,),
          )
        ],
      ),
    );
  }
}
