import 'package:dating/Widget/feed/feed.dart';
import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 23),
          child: Text(
            '피드',
            style: TextStyle(
                fontSize: 25, color: fontColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 10),
            //     child: Row(
            //       children: List.generate(
            //         50,
            //         (index) => const Padding(
            //           padding:
            //               EdgeInsets.symmetric(vertical: 6, horizontal: 13),
            //           child: StoryCircle(),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Column(
              children: List.generate(
                50,
                (index) => const Feed(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
