import 'package:dating/Widget/profile_edit/my_photos.dart';
import 'package:dating/Widget/profile/personal_information.dart';
import 'package:dating/Widget/profile/personality.dart';
import 'package:dating/Widget/profile/interest.dart';
import 'package:dating/Widget/profile/ideal_type.dart';
import 'package:dating/Widget/profile/profile_positioned_age.dart';
import 'package:dating/Widget/profile/profile_edit_button.dart';
import 'package:dating/Widget/profile/profile_positioned_location.dart';
import 'package:dating/Widget/profile/profile_positioned_name.dart';
import 'package:dating/Widget/profile/profile_picture.dart';
import 'package:dating/controller/auth_controller.dart';
import 'package:dating/style/text_styling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  ProfileScreen({super.key});

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                authController.logOut();
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
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
                    // my representative profile photo
                    ProfilePicture(),

                    // my name
                    ProfilePositionedName(),

                    // my age
                    ProfilePositionedAge(),

                    // my residence
                    ProfilePositionedLocation(),

                    // profile edit button
                    Positioned(
                      top: 360,
                      right: 20,
                      child: ProfileEditButton(),
                    ),
                  ],
                ),
              ],
            ),
            // personal information
            PersonalInformation(),

            // my personality
            Personality(),

            // my interest
            Interest(),

            // my ideal type
            IdealType(),
            SizedBox(height: 50),

            // my story text
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextStyling.story,
            ),

            // my story collection
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                children: [
                  MyPhotos(),
                  MyPhotos(),
                  MyPhotos(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
