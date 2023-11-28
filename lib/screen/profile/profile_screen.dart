import 'package:dating/Widget/profile/profile_edit/my_photos.dart';
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
import 'package:dating/data/model/user.dart';
import 'package:dating/data/repository/user_repository.dart';
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
      body: FutureBuilder<List<User>>(
        future: UserRepository().getUserData(),
        builder: (context, snapshot) {
          final users = snapshot.data!;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            const int index = 0;
            final user = users[index];
            return SingleChildScrollView(
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
                          const ProfilePicture(),

                          // my name
                          ProfilePositionedName(
                            user: user,
                          ),

                          // my age
                          ProfilePositionedAge(
                            user: user,
                          ),

                          // my residence
                          ProfilePositionedLocation(
                            user: user,
                          ),

                          // profile edit button
                          const Positioned(
                            top: 360,
                            right: 20,
                            child: ProfileEditButton(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // personal information
                  const PersonalInformation(),

                  // my personality
                  const Personality(),

                  // my interest
                  const Interest(),

                  // my ideal type
                  const IdealType(),
                  const SizedBox(height: 50),

                  // my story text
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextStyling.story,
                  ),

                  // my story collection
                  const Padding(
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
            );
          }
        },
      ),
    );
  }
}
