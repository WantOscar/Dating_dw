import 'package:dating/Widget/profile/container_basic.dart';
import 'package:dating/Widget/profile/input_field.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/style/text_styling.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextStyling.profileEdit2,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconShape.iconSettings,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                children: [
                  ContainerBasic(),
                  ContainerBasic(),
                  ContainerBasic(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  const ContainerBasic(),
                  const ContainerBasic(),
                  Stack(
                    children: [
                      const ContainerBasic(),
                      Positioned(
                        top: 90,
                        right: 1,
                        child: IconButton(
                          icon: IconShape.iconPhotoCamera,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const InputField(text1: '이름', text2: '이름 입력'),
            const SizedBox(height: 10),
            const InputField(text1: '한줄 소개', text2: '소개 입력'),
            const SizedBox(height: 10),
            const InputField(text1: '성별', text2: '성별 입력'),
            const SizedBox(height: 10),
            const InputField(text1: '주소', text2: '주소 입력'),
          ],
        ),
      ),
    );
  }
}
