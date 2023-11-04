import 'package:dating/Widget/container_standard.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetingDetail extends StatelessWidget {
  const MeetingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 8)),
            ], color: Colors.white),
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    'https://i.pinimg.com/474x/a6/24/5b/a6245bee6c4461558e293551fa463265.jpg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 40,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: IconShape.iconArrowBack,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ContainerStandard(
                    w: 0.08,
                    h: 0.05,
                    child: Text(
                      '홍대',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
