// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class CammitTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueSetter<String> onChanged;
  final bool obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  const CammitTextField({
    super.key,
    this.obscureText = false,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: TextField(
          cursorColor: Theme.of(context).colorScheme.primary,
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: (hintText != null) ? hintText : null,
            border: InputBorder.none,
            fillColor: Theme.of(context).colorScheme.tertiary,
            filled: true,
            suffixIcon: suffixIcon,
            hintStyle: const TextStyle(color: Color(0xffafafaf)),
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}
