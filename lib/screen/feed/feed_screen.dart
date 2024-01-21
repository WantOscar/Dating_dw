import 'package:dating/Widget/common_header.dart';
import 'package:dating/Widget/feed/feed.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/data/repository/feed_repository.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonHeader(text: '피드'),
      body: FutureBuilder<List<Feed>>(
        future: FeedRepository().getFeedList(),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                50,
                (index) => const FeedIcon2(),
              ),
            ),
          );
        },
      ),
    );
  }
}
