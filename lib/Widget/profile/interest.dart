import 'package:dating/widget/profile/hobby_container.dart';
import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class Interest extends StatelessWidget {
  const Interest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
          child: Text('관심사'),
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
                text: '게임',
                color: ThemeColor.inputColor,
              ),
              HobbyContainer(
                text: 'IT',
                color: ThemeColor.inputColor,
              ),
              HobbyContainer(
                text: '운동',
                color: ThemeColor.inputColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
