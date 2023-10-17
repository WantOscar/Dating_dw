import 'package:dating/Widget/profile/hobby_container.dart';
import 'package:dating/Widget/profile/profile_positioned_age.dart';
import 'package:dating/Widget/profile/profile_positioned_edit.dart';
import 'package:dating/Widget/profile/profile_positioned_location.dart';
import 'package:dating/Widget/profile/profile_positioned_name.dart';
import 'package:dating/Widget/profile/profile_picture.dart';
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
            child: Icon(
              Icons.settings,
              color: Colors.black,
              size: 30,
            ),
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Text('인적사항'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                spacing: 5,
                runSpacing: 5,
                children: [
                  HobbyContainer(
                    text: '일반대',
                    color: Colors.grey,
                  ),
                  HobbyContainer(
                    text: '학생',
                    color: Colors.grey,
                  ),
                  HobbyContainer(
                    text: 'ESTP',
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Text('성격'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                spacing: 5,
                runSpacing: 5,
                children: [
                  HobbyContainer(
                    text: '털털한',
                    color: Colors.grey,
                  ),
                  HobbyContainer(
                    text: '기모띠',
                    color: Colors.grey,
                  ),
                  HobbyContainer(
                    text: '자유로운',
                    color: Colors.grey,
                  ),
                  HobbyContainer(
                    text: '유쾌한',
                    color: Colors.grey,
                  ),
                  HobbyContainer(
                    text: '대담한',
                    color: Colors.grey,
                  ),
                  HobbyContainer(
                    text: '보수적인',
                    color: Colors.grey,
                  ),
                  HobbyContainer(
                    text: '재밌는',
                    color: Colors.grey,
                  ),
                  HobbyContainer(
                    text: '호전적인',
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
