import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImageDetailView extends StatelessWidget {
  final String path;
  const ProfileImageDetailView({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Center(
          child: AspectRatio(
        aspectRatio: 1.0,
        child: SizedBox(
            width: double.infinity, child: CachedNetworkImage(imageUrl: path)),
      )),
    );
  }
}
