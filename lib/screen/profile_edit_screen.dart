import 'package:dating/Widget/profile/container_basic.dart';
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              spacing: 1,
              runSpacing: 1,
              children: [
                const ContainerBasic(),
                const ContainerBasic(),
                const ContainerBasic(),
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
        ],
      ),
    );
  }
}
