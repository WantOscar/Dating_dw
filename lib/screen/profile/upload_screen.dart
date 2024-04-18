import 'package:dating/controller/profile_image_controller.dart';
import 'package:dating/screen/profile/album_image.dart';
import 'package:dating/screen/profile/change_album_screen.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/widget/icon_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadScreen extends GetView<ProfileImageController> {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: IconHeader(
          text: '사진 업로드',
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconShape.iconArrowGoto,
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return (controller.album.isNotEmpty)
        ? CustomScrollView(
            slivers: [
              _preview(),
              _header(),
              _images(),
            ],
          )
        : const Center(
            child: CircularProgressIndicator.adaptive(),
          );
  }

  /// 선택한 사진 확인하는 영역
  Widget _preview() {
    return SliverToBoxAdapter(
      child: Container(
        height: Get.size.width * 1.1,
        width: Get.size.width,
        color: Colors.black,
        child: (controller.image != null)
            ? GestureDetector(
                onTap: controller.clearImage,
                child: AssetEntityImage(
                  controller.image!,
                  fit: BoxFit.cover,
                ))
            : null,
      ),
    );
  }

  /// 앨범 선택 버튼 영역, 다양한 옵션 버튼들
  Widget _header() {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const ChangeAlbumScreen(),
                        transition: Transition.downToUp);
                  },
                  child: Row(
                    children: [
                      Text(
                        controller.album[controller.idx].name.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        size: 25,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.photo_camera),
            ),
          ),
        ],
      ),
    );
  }

  Widget _images() {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ),
        itemCount: controller.album[controller.idx].images!.length,
        itemBuilder: (context, index) {
          AssetEntity? image = controller.album[controller.idx].images?[index];

          return GestureDetector(
              onTap: () => controller.changeImage(image),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AlbumImage(
                    image: image!,
                  ),
                  Container(
                    color: Colors.white
                        .withOpacity((controller.image == image) ? 0.4 : 0.0),
                  )
                ],
              ));
        });
  }
}
