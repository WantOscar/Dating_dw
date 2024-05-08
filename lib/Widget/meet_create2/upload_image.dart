import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class UploadImage extends StatelessWidget {
  final AssetEntity entity;
  final BoxFit fit;
  const UploadImage({super.key, required this.entity, required this.fit});

  @override
  Widget build(BuildContext context) {
    return AssetEntityImage(
      entity,
      fit: fit,
      isOriginal: false,
    );
  }
}
