import 'package:dating/style/icon_shape.dart';
import 'package:dating/style/text_styling.dart';
import 'package:flutter/material.dart';

class ProfilePositionedAge extends StatelessWidget {
  const ProfilePositionedAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 360,
      left: 20,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: IconShape.iconPerson,
          ),
          TextStyling.profileAge,
          const SizedBox(width: 10),
          TextStyling.profileHeight,
        ],
      ),
    );
  }
}
