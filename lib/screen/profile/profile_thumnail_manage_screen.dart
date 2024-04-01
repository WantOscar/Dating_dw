import 'dart:math';

import 'package:flutter/material.dart';

class ProfileThumnailManageScreen extends StatelessWidget {
  const ProfileThumnailManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
