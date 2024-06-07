import 'package:dating/controller/init_profile_upload_screen_controller.dart';
import 'package:dating/data/model/album.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class InitProfileAlbumChangeScreen
    extends GetView<InitProfileUploadScreenController> {
  const InitProfileAlbumChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: Get.back,
          child: const Icon(
            Icons.close,
            size: 25,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    if (controller.albums.isNotEmpty) {
      return ListView.builder(
          itemCount: controller.albums.length,
          itemBuilder: (context, index) {
            final Album album = controller.albums[index];
            // return Text(album.toString());
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    controller.changeIndex(index);
                  },
                  child: Row(
                    children: [
                      // Text(album.images!.first.toString()),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: AssetEntityImage(
                          album.images!.first,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              album.name.toString(),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                            Text(
                              album.images!.length.toString(),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    } else if (controller.albums.isEmpty) {
      const Center(
          child: Text(
        "앨범이 존재하지 않습니다.",
        style: TextStyle(
            color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w700),
      ));
    } else {
      return Container();
    }
    return Container();
  }
}
