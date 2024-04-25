import 'package:dating/controller/profile_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class ChangeAlbumScreen extends GetView<ProfileImageController> {
  const ChangeAlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            "앨범 선택",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(controller.album.length, (index) {
              final album = controller.album[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    controller.changeIndex(index);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: AssetEntityImage(
                          album.images![0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              album.name.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                            ),
                            Text(
                              album.images!.length.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
