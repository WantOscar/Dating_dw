import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;
  final Color color;
  const BottomButton({super.key, this.onTap, this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: child,
      ),
    );
  }
}
