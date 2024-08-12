import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageAvatar extends StatelessWidget {
  final String? imagePath;
  final double? size;
  const ImageAvatar({super.key, this.imagePath, this.size = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: (imagePath != null)
          ? ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: imagePath!,
                fit: BoxFit.cover,
              ),
            )
          : null,
    );
  }
}
