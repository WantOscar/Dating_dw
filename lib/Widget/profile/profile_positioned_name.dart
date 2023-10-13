import 'package:dating/style/text_styling.dart';
import 'package:flutter/material.dart';

class ProfilePositionedName extends StatelessWidget {
  const ProfilePositionedName({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 300,
      left: 20,
      child: TextButton(
        onPressed: () {},
        child: TextStyling.profileName,
      ),
    );
  }
}
