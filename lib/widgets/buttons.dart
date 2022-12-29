import 'package:flutter/material.dart';
import 'package:pharmacy_store/utils/colors.dart';

class MainButtons extends StatefulWidget {
  final void Function()? onclickFunction;
  final dynamic text;
  final bool isLoading;

  const MainButtons({
    super.key,
    this.onclickFunction,
    required this.text,
    required this.isLoading,
  });

  @override
  State<MainButtons> createState() => _MainButtonsState();
}

class _MainButtonsState extends State<MainButtons> {
  @override
  Widget build(BuildContext context) {
    Color disabledColor =
    const Color.fromARGB(50, 252, 162, 35);

    return GestureDetector(
      onTap: widget.isLoading ? () {} : widget.onclickFunction,
      child: Container(
        decoration: BoxDecoration(
          color: widget.isLoading
              ? disabledColor
              : Paints.tertiaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(12),
        child: Center(
          child: widget.text is String?
              ? widget.isLoading
              ? const CircularProgressIndicator(
            color: Colors.white,
          )
              : Text(
            widget.text,
            style: TextStyle(
              color: Paints.white1,
              fontSize: 12,
              // fontWeight: FontWeight.bold,
              fontFamily: "Kalam"
            ),
          )
              : widget.text,
        ),
      ),
    );
  }
}

class AppBtn extends StatelessWidget {
  const AppBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

