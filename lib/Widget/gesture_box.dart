import 'package:flutter/material.dart';

class GestureBox extends StatelessWidget {
  const GestureBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.grey),
    );
  }
}
