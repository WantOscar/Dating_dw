import 'package:flutter/material.dart';

class GestureBox extends StatelessWidget {
  const GestureBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.32,
      height: MediaQuery.of(context).size.width * 0.32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          'https://i.pinimg.com/564x/2b/0f/16/2b0f16a08f85c9989fb3043cfb51ba49.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
