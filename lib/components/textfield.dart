import 'package:flutter/material.dart';
// ignore: non_constant_identifier_names

class Text_Field extends StatelessWidget {
  final controller;
  final String HintText;
  final obsecureText;

  const Text_Field(
      {super.key,
      required this.controller,
      required this.HintText,
      required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 144, 136, 136)),
          ),
          fillColor: Colors.white30,
          filled: true,
          hintText: HintText,
        ),
      ),
    );
  }
}
