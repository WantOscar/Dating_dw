import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final dynamic src;
  final BoxFit? fit;

  ProfileImage({super.key, required this.src, this.fit})
      : assert(src.runtimeType is! File && src.runtimeType is! String,
            "지원하지 않는 이미지 형식입니다.");

  @override
  Widget build(BuildContext context) {
    if (src is String) {
      return _buildNetworkUrlImage();
    } else {
      return _buildFilePathImage();
    }
  }

  Widget _buildNetworkUrlImage() {
    return CachedNetworkImage(
      imageUrl: src,
      fit: fit,
    );
  }

  Widget _buildFilePathImage() {
    return Image.file(
      File(src.path),
      fit: fit,
    );
  }
}
