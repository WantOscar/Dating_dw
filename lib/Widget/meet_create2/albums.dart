import 'package:dating/Widget/meet_create2/upload_image.dart';
import 'package:dating/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Albums extends GetView<UploadController> {
  const Albums({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: GestureDetector(onTap: Get.back, child: Container()),
        ),
        title: const Text(
          '사진첩 선택',
        ),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        actions: const [
          Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.abc))
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.albums.length,
          itemBuilder: (context, index) {
            final album = controller.albums[index];
            return GestureDetector(
              onTap: () {
                controller.changeIndex(index);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: UploadImage(
                          entity: album.images![0], fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(album.name!),
                        Text(album.images!.length.toString()),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
