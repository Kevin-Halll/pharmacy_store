import 'package:flutter/material.dart';
import 'package:pharmacy_store/screens/cart-screen.dart';
import 'package:pharmacy_store/screens/details-screen.dart';
import 'package:pharmacy_store/screens/home.dart';
import 'package:pharmacy_store/screens/products.dart';
import 'package:pharmacy_store/screens/sign-in-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: SafeArea(child: const SignIn()),

      routes: {
        "": (context) => SignIn(),
        "/home": (context) => HomeScreen(),
        "/products": (context) => ProductScreen(),
        "/details": (context) => ProductDetails(),
        "/cart": (context) => Cart(),
      },
    );

  }
}


