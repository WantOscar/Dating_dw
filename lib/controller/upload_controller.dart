import 'package:dating/Widget/meet_create2/albums.dart';
import 'package:dating/data/model/album.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadController extends GetxController {
  final Rx<List<AlbumModel>> _albums = Rx<List<AlbumModel>>([]);
  final Rxn<AssetEntity> _selectImage = Rxn<AssetEntity>();
  final RxInt _index = 0.obs;

  List<AlbumModel> get albums => _albums.value;
  AssetEntity? get selectImage => _selectImage.value;
  int get index => _index.value;

  @override
  void onReady() {
    super.onReady();
    _checkPermission();
  }

  void _checkPermission() {
    PhotoManager.requestPermissionExtend().then((ps) {
      if (ps.isAuth) {
        getAlbums();
      } else {
        PhotoManager.openSetting();
      }
    });
  }

  void getAlbums() {
    PhotoManager.getAssetPathList().then((paths) {
      for (AssetPathEntity path in paths) {
        path.getAssetListRange(start: 0, end: 10000).then((images) {
          if (images.isNotEmpty) {
            final album = AlbumModel.fromGallery(path.name, path.id, images);
            _albums.value.add(album);
            _albums.refresh();
          }
        });
      }
    });
  }

  void changeAlbum() {
    Get.to(() => const Albums(), transition: Transition.downToUp);
  }

  void changeIndex(int value) {
    _index(value);
    Get.back();
  }

  void select(AssetEntity e) {
    _selectImage(e);
  }
}
