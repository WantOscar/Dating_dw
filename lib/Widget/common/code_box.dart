import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class CodeBox extends StatelessWidget {
  final String value;
  const CodeBox({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 30,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 2.0,
                  color: (value == "") ? Colors.black : ThemeColor.fontColor))),
      child: Text(
        value,
        style: const TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black),
      ),
    );
  }
}
