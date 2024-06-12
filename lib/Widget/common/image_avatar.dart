import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageAvatar extends StatelessWidget {
  final String? imagePath;
  final double? size;
  const ImageAvatar({super.key, this.imagePath, this.size = 30});

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      return SizedBox(
        width: size,
        height: size,
        child: CircleAvatar(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
              imageUrl: imagePath!,
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
    } else {
      return const SizedBox(width: 25, height: 25, child: CircleAvatar());
    }
  }
}
