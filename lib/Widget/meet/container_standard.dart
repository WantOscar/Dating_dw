import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class ContainerStandard extends StatelessWidget {
  final dynamic child;

  const ContainerStandard({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: ThemeColor.fontColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: child,
    );
  }
}
