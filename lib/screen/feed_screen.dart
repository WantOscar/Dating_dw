import 'package:dating/Widget/feed.dart';
import 'package:dating/Widget/feed_icon.dart';
import 'package:dating/Widget/story_circle.dart';
import 'package:dating/constant.dart';
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: List.generate(
                    50,
                    (index) => const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 13),
                        child: StoryCircle()),
                  ),
                ),
              ),
            ),
            const Feed(),
            const Feed(),
            const Feed()
          ],
        ),
      ),
    );
  }
}
