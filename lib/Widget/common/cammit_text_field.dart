// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class CammitTextField extends StatelessWidget {
  final TextEditingController controller;
  bool obscureText;
  String? hintText;
  CammitTextField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: TextField(
          cursorColor: Colors.black,
          controller: controller,
          decoration: InputDecoration(
            hintText: (hintText != null) ? hintText : null,
            border: InputBorder.none,
            fillColor: const Color(0xffefefef),
            filled: true,
            hintStyle: const TextStyle(color: Color(0xffafafaf)),
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}
