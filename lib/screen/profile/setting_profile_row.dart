import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';

class SettingProfileRow extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final String? status;
  const SettingProfileRow(
      {super.key, required this.label, this.onTap, this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        IconButton(
          onPressed: onTap,
          icon: IconShape.iconArrowForward,
        ),
      ],
    );
  }
}
