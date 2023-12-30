import 'package:dating/Widget/meet_create2/upload_image.dart';
import 'package:dating/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetingScreenUploadScreen extends GetView<UploadController> {
  const MeetingScreenUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UploadController());
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: GestureDetector(
              onTap: Get.back, child: const Icon(Icons.back_hand)),
        ),
        title: const Text(
          '세 개시물',
        ),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.next_plan),
          )
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            _preview(),
            _header(),
            _images(),
          ],
        ),
      ),
    );
  }

  Widget _preview() {
    return (controller.selectImage == null)
        ? Container(
            width: Get.width,
            height: Get.width,
            color: Colors.black,
          )
        : SizedBox(
            width: Get.width,
            height: Get.width,
            child: UploadImage(
                entity: controller.selectImage!, fit: BoxFit.contain),
          );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              (controller.albums.isEmpty)
                  ? Container()
                  : GestureDetector(
                      onTap: controller.changeAlbum,
                      child: Text(
                        controller.albums[0].name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
              const Icon(Icons.arrow_circle_down)
            ],
          ),
        ),
        Row(
          children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF808080)),
                child: const Icon(Icons.image_outlined)),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF808080),
              ),
              child: const Icon(Icons.camera),
            )
          ],
        )
      ],
    );
  }

  Widget _images() {
    return (controller.albums.isEmpty)
        ? Container()
        : Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0),
              itemCount: controller.albums[controller.index].images!.length,
              itemBuilder: (context, index) {
                final image =
                    controller.albums[controller.index].images![index];
                return GestureDetector(
                    onTap: () {
                      controller.select(image);
                    },
                    child: UploadImage(entity: image, fit: BoxFit.cover));
              },
            ),
          );
  }
}
