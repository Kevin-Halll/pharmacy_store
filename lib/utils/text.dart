

import 'package:flutter/cupertino.dart';

class TextLG extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  TextLG({this.color, this.size=20, required this. text, this.overflow=TextOverflow.ellipsis, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: size,
        fontFamily: 'Kalam',
        // letterSpacing: 1
      ),
    );
  }
}

class TextMD extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  TextMD({this.color, this.size=12, required this.text, this.overflow=TextOverflow.ellipsis, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: size,
        fontFamily: 'Kalam'
      ),
    );
  }
}


class TextSM extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  TextSM({this.color, this.size=12, required this.text, this.overflow=TextOverflow.ellipsis, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        // fontWeight: FontWeight.bold,
        fontSize: size,
        fontFamily: 'Kalam'
      ),
    );
  }
}
