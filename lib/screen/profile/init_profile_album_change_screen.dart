import 'package:dating/controller/init_profile_upload_screen_controller.dart';
import 'package:dating/data/model/album.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () {
                  controller.changeIndex(index);
                },
                child: Row(
                  children: [
                    (album.images!.isNotEmpty)
                        ? SizedBox(
                            width: 100,
                            height: 100,
                            child: AssetEntityImage(
                              album.images!.first,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey,
                            child: const Icon(
                              Icons.broken_image,
                              color: Colors.white,
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            album.name.toString(),
                            style: const TextStyle(fontSize: 15),
                          ),
                          Text(
                            album.images!.length.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
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
