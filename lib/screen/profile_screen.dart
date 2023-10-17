import 'package:dating/Widget/profile/container_basic.dart';
import 'package:dating/Widget/profile/hobby1.dart';
import 'package:dating/Widget/profile/hobby2.dart';
import 'package:dating/Widget/profile/hobby3.dart';
import 'package:dating/Widget/profile/hobby4.dart';
import 'package:dating/Widget/profile/profile_positioned_age.dart';
import 'package:dating/Widget/profile/profile_positioned_edit.dart';
import 'package:dating/Widget/profile/profile_positioned_location.dart';
import 'package:dating/Widget/profile/profile_positioned_name.dart';
import 'package:dating/Widget/profile/profile_picture.dart';
import 'package:dating/style/constant.dart';
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
                    ProfilePicture(),
                    ProfilePositionedName(),
                    ProfilePositionedAge(),
                    ProfilePositionedLocation(),
                    ProfilePositionedEdit(),
                  ],
                ),
              ],
            ),
            Hobby1(),
            Hobby2(),
            Hobby3(),
            Hobby4(),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '스토리',
                style: TextStyle(
                    color: fontColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                children: [
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
