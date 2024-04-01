import 'dart:html';

import 'package:dating/widget/icon_header.dart';
import 'package:flutter/material.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IconHeader(
        text: '사진 업로드',
      ),
    );
  }
}
