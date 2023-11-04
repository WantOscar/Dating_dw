import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class ContainerStandard extends StatelessWidget {
  final double w;
  final double h;
  final dynamic? child;
  const ContainerStandard(
      {super.key, required this.w, required this.h, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * w,
      height: MediaQuery.of(context).size.width * h,
      decoration: BoxDecoration(
        color: fontColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
