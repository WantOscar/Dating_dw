import 'package:dating/screen/profile_edit_screen.dart';
import 'package:dating/style/text_styling.dart';
import 'package:flutter/material.dart';

class ProfilePositionedEdit extends StatelessWidget {
  const ProfilePositionedEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 360,
      right: 20,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileEditScreen()),
          );
        },
        child: TextStyling.profileEdit,
      ),
    );
  }
}
