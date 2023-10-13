import 'package:dating/style/icon_shape.dart';
import 'package:dating/style/text_styling.dart';
import 'package:flutter/material.dart';

class ProfilePositionedLocation extends StatelessWidget {
  const ProfilePositionedLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 385,
      left: 20,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: IconShape.iconLocationOn,
          ),
          TextStyling.profileLocation,
        ],
      ),
    );
  }
}
