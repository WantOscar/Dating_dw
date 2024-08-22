import 'dart:math';

import 'package:dating/Widget/common/icon_header.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';

class ProfileThumnailManageScreen extends StatelessWidget {
  const ProfileThumnailManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IconHeader(
        text: '취소할 사진 선택',
        actions: [
          IconButton(onPressed: () {}, icon: IconShape.iconArrowGoto),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
              6,
              (index) => AspectRatio(
                    aspectRatio: 1.0,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)]),
                        ),
                        Positioned(
                            right: 10,
                            top: 10,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
