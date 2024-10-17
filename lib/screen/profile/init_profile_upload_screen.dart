import 'package:dating/controller/init_profile_upload_screen_controller.dart';
import 'package:dating/screen/profile/init_profile_album_change_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

/// 최초 로그인한 사용자가 프로필을 등록하기 위하여
/// 가장 최초로 사용하게 되는 업로드 화면
/// 최초로 사진을 업로드 하게 되면
/// 이 화면을 더이상 사용하지 않음.
class InitProfileUploadScreen
    extends GetView<InitProfileUploadScreenController> {
  const InitProfileUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: Get.back,
            child: Icon(Icons.close,
                size: 25, color: Theme.of(context).colorScheme.onSecondary),
          ),
          title: (controller.isReady)
              ? GestureDetector(
                  onTap: () {
                    Get.to(() => const InitProfileAlbumChangeScreen(),
                        transition: Transition.downToUp);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        controller.albums[controller.albumIndex].name!,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                      Icon(Icons.arrow_drop_down,
                          color: Theme.of(context).colorScheme.onSecondary)
                    ],
                  ),
                )
              : Container(),
          actions: [
            GestureDetector(
                onTap: controller.completeSelectProfileImage,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.check,
                    color: ThemeColor.fontColor,
                  ),
                ))
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: (controller.isReady)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1.0),
                itemCount:
                    controller.albums[controller.albumIndex].images!.length,
                itemBuilder: (context, index) {
                  final AssetEntity image =
                      controller.albums[controller.albumIndex].images![index];
                  return GestureDetector(
                    onTap: () {
                      controller.selectImage(image, index);
                    },
                    child: Obx(
                      () => Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 1.0,
                            child: SizedBox(
                              width: double.infinity,
                              child: AssetEntityImage(
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          (controller.selectImageIndex.contains(index))
                              ? AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    color: Colors.white.withOpacity(0.3),
                                    child: Text(
                                      "${controller.selectImageIndex.indexOf(index) + 1}",
                                      style: const TextStyle(
                                          fontSize: 50,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  );
                })
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
      ),
    );
  }
}
