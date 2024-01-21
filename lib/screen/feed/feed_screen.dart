import 'package:dating/Widget/common_header.dart';
import 'package:dating/Widget/feed/feed_icon2.dart';
import 'package:dating/controller/feed_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/data/repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedScreen extends GetView<FeedController> {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonHeader(text: '피드'),
      body: FutureBuilder<List<Feed>>(
        future: FeedRepository().getFeedList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<Feed> feed = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  50,
                  (index) => const FeedIcon2(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
