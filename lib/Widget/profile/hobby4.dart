import 'package:dating/Widget/profile/hobby_container.dart';
import 'package:flutter/material.dart';

class Hobby4 extends StatelessWidget {
  const Hobby4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
          child: Text('이상형'),
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
                text: '예쁜',
                color: Colors.grey,
              ),
              HobbyContainer(
                text: '귀여운',
                color: Colors.grey,
              ),
              HobbyContainer(
                text: '섹시한',
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
