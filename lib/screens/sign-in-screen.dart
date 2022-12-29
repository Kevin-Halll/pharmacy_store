import 'package:flutter/material.dart';
import 'package:pharmacy_store/utils/colors.dart';
import 'package:pharmacy_store/utils/text.dart';
import 'package:pharmacy_store/widgets/buttons.dart';
import 'package:pharmacy_store/widgets/inputFields.dart';


class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Paints.primaryColor,
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
                  child: Image.asset("assets/images/cover1.png",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.40,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  // SizedBox(height: 10,),
                  TextLG(text: "Sign In", color: Paints.white1,),
                  TextSM(text: "Welcome Back", color: Paints.white1,),
                  SizedBox(height: 15,),
                  Form(child: Column(
                    children: [
                      InputField(hint: "Email", validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      }, InputIcon: Icons.person),
                      SizedBox(height: 15,),
                      PasswordField(hint: "Password", InputIcon: Icons.lock, validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "You must enter a password";
                        }

                        return null;
                      },),
                      SizedBox(height: 5,),
                      GestureDetector(
                          onTap: (){},

                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextSM(text: "Forgot Password?", color: Paints.white1,)),
                          )),
                      SizedBox(height: 15,),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: MainButtons(text: "SIGN IN", isLoading: false, onclickFunction: (){
                            Navigator.pushNamed(context, "/home");
                          },)),
                      SizedBox(height: 10,),
                    ],
                  )),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            endIndent: 10,
                            thickness: 1,
                            color: Paints.whiteOpacity,
                          ),
                        ),
                        TextMD(
                          text: "OR",
                          color: Paints.whiteOpacity,
                        ),
                        Expanded(
                          child: Divider(
                            indent: 10,
                            thickness: 1,
                            color: Paints.whiteOpacity,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                            decoration:BoxDecoration(
                                color: Paints.white1,
                                borderRadius: BorderRadius.circular(999)
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: Icon(Icons.facebook, color: Color(0xFF2B30B4), size: 20,),
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                            decoration:BoxDecoration(
                                color: Paints.white1,
                                borderRadius: BorderRadius.circular(999)
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: Icon(Icons.apple_outlined, size: 20),
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                            decoration:BoxDecoration(
                                color: Paints.white1,
                                borderRadius: BorderRadius.circular(999)
                            ),
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                child: Image.asset("assets/images/google.png", height: 20, width: 20,)
                            )
                        ),
                      ),

                    ],),
                  SizedBox(height: 25,),
                ],
              ),
            ),
            Container(
              color: Paints.tertiaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextMD(text: "Don't have an account?", color: Paints.white1,),
                    SizedBox(width: 10,),
                    GestureDetector(
                        onTap: (){},
                        child: TextMD(text: "SIGN UP!", color: Paints.primaryColor,))
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
