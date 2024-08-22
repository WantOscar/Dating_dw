// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class AlbumImage extends StatelessWidget {
  final AssetEntity image;

  const AlbumImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AssetEntityImage(
      image,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        color: Colors.grey,
        child: const Center(
          child: Icon(
            Icons.error,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
