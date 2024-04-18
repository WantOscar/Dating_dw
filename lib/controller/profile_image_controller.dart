import 'package:dating/data/model/album.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class ProfileImageController extends GetxController {
  final Rx<List<AlbumModel>> _albums = Rx<List<AlbumModel>>([]);
  final Rxn<AssetEntity> _image = Rxn<AssetEntity>();

  List<AlbumModel> get album => _albums.value;

  final RxInt _index = 0.obs;

  int get idx => _index.value;
  AssetEntity? get image => _image.value;

  @override
  void onReady() {
    _checkPermission();
    super.onReady();
  }

  /// 앨범 변경 메소드
  void changeIndex(int index) {
    _index(index);
    Get.back();
  }

  /// 갤러리 접근 권환 확인
  void _checkPermission() async {
    final ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      getAlbums();
    } else {
      PhotoManager.openSetting();
    }
  }

  /// 갤러리 이미지를 가져오는 메소드
  Future<void> getAlbums() async {
    await PhotoManager.getAssetPathList(type: RequestType.image).then((paths) {
      for (AssetPathEntity asset in paths) {
        asset.getAssetListRange(start: 0, end: 10000).then((images) {
          if (images.isNotEmpty) {
            final album = AlbumModel.fromGallery(
              asset.name,
              asset.id,
              images,
            );
            print(album);
            _albums.value.add(album);
            _albums.refresh();
          }
        });
      }
    });
  }

  void changeImage(AssetEntity image) {
    if (image == _image.value) {
      clearImage();
    } else {
      _image(image);
    }
  }

  void clearImage() {
    _image.value = null;
  }
}
