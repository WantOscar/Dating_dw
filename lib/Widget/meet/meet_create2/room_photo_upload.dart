import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';

class RoomPhotoUpload extends StatelessWidget {
  const RoomPhotoUpload({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        width: width * 0.9,
        height: height * 0.3,
        decoration: BoxDecoration(
          color: inputColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Container(
            width: width * 0.15,
            height: width * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () {},
              icon: IconShape.iconPhotoCamera,
            ),
          ),
        ),
      ),
    );
  }
}
