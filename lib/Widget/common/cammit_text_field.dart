// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class CammitTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueSetter<String> onChanged;
  final bool obscureText;
  final String? hintText;
  const CammitTextField({
    super.key,
    this.obscureText = false,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

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
          onChanged: onChanged,
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
