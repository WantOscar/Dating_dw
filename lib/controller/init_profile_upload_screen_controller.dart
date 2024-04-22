import 'package:dating/data/model/album.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class InitProfileUploadScreenController extends GetxController {
  static InitProfileUploadScreenController get to => Get.find();
  final Rx<List<AlbumModel>> _albums = Rx<List<AlbumModel>>([]);
  final RxInt _albumIndex = 0.obs;
  List<AlbumModel> get albums => _albums.value;
  int get albumIndex => _albumIndex.value;

  @override
  void onReady() {
    _checkPermission();
    super.onReady();
  }

  void _checkPermission() async {
    final ps = await PhotoManager.requestPermissionExtend();
    if (ps == PermissionState.authorized) {
      _getAlbums();
    } else {
      PhotoManager.openSetting();
    }
  }

  void _getAlbums() async {
    final assets = await PhotoManager.getAssetPathList(type: RequestType.image);
    if (assets.isNotEmpty) {
      final List<AlbumModel> albums = [];
      for (AssetPathEntity _asset in assets) {
        final assetEntities =
            await _asset.getAssetListRange(start: 0, end: 10000);

        final AlbumModel album =
            AlbumModel.fromGallery(_asset.name, _asset.id, assetEntities);
        albums.add(album);
      }
      _albums.value = albums;
      _albums.refresh();
    }
  }
}
