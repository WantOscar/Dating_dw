import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class ButtonLoadingIndicator extends StatelessWidget {
  final double? size;
  final Color? color;
  const ButtonLoadingIndicator(
      {super.key, this.size = 50, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: CircularProgressIndicator(color: color),
      ),
    );
  }
}
