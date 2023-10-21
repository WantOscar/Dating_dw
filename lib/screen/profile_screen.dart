import 'package:dating/Widget/profile_edit/container_basic.dart';
import 'package:dating/Widget/profile/personal_information.dart';
import 'package:dating/Widget/profile/personality.dart';
import 'package:dating/Widget/profile/interest.dart';
import 'package:dating/Widget/profile/ideal_type.dart';
import 'package:dating/Widget/profile/profile_positioned_age.dart';
import 'package:dating/Widget/profile/profile_positioned_edit.dart';
import 'package:dating/Widget/profile/profile_positioned_location.dart';
import 'package:dating/Widget/profile/profile_positioned_name.dart';
import 'package:dating/Widget/profile/profile_picture.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/style/text_styling.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextStyling.profile,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconShape.iconSettings,
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    // 프로필
                    ProfilePicture(),
                    ProfilePositionedName(),
                    ProfilePositionedAge(),
                    ProfilePositionedLocation(),
                    ProfilePositionedEdit(),
                  ],
                ),
              ],
            ),
            // 인적사항
            PersonalInformation(),
            // 성격
            Personality(),
            // 관심사
            Interest(),
            // 이상형
            IdealType(),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextStyling.story,
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                children: [
                  // 스토리
                  ContainerBasic(),
                  ContainerBasic(),
                  ContainerBasic(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
