// TODO Implement this library.import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_store/utils/colors.dart';

// normal text input field
class InputField extends StatefulWidget {
  final String hint;
  final controllerName;
  final int? maxLength;
  final IconData InputIcon;
  String? Function(String?) validator;

  InputField({
    super.key,
    required this.hint,
    this.controllerName,
    this.maxLength,
    required this.validator,
    required this.InputIcon,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      validator: widget.validator,
      controller: widget.controllerName,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: Colors.white
          ),
        ),
        prefixIcon:
        Icon(widget.InputIcon, color: Paints.white1),
        hintStyle: TextStyle(color: Color.fromARGB(60, 238, 242, 246), fontFamily: "Kalam"),
        filled: true,
        hintText: widget.hint,
        isDense: true,
      ),
    );
  }
}

// password field
class PasswordField extends StatefulWidget {
  final String hint;
  final int? maxLength;
  final controllerName;
  final IconData InputIcon;
  String? Function(String?) validator;

  PasswordField({
    super.key,
    this.controllerName,
    this.maxLength,
    required this.hint,
    required this.InputIcon,
    required this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  //function that shows and hide password for password fields
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      controller: widget.controllerName,
      validator: widget.validator,
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.InputIcon,
          color: Paints.white1,
        ),

        // shows or hides password
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText
                ?

            /// Check Show & Hide.
            Icons.visibility
                : Icons.visibility_off,
            color: Color.fromRGBO(121, 116, 116, 10),
          ),
        ),
        hintStyle: TextStyle(color: Color.fromARGB(60, 238, 242, 246), fontFamily: "Kalam"),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: Paints.white1
          ),
        ),
        filled: true,
        hintText: widget.hint,
        isDense: true,
      ),
    );
  }
}

// class PasswordInput extends InputField {
//   late final String hint;
//   late final controllerName;
//   late final IconData InputIcon;
//   final love;

//   PasswordInput(
//       {required super.hint,
//       required super.InputIcon,
//       super.controllerName,
//       this.love});

//   @override
//   _PasswordInputState createState() => _PasswordInputState();
// }

// class _PasswordInputState extends State<PasswordInput> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
//
