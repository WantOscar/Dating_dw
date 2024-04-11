import 'package:dating/data/model/album.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class ProfileImageController extends GetxController {
  Rx<List<AlbumModel>> _albums = Rx<List<AlbumModel>>([]);

  List<AlbumModel> get album => _albums.value;

  RxInt _index = 0.obs;

  int get idx => _index.value;

  @override
  void onReady() {
    _checkPermission();
    super.onReady();
  }

  void _checkPermission() async {
    final _ps = await PhotoManager.requestPermissionExtend();
    if (_ps.isAuth) {
      getAlbums();
    } else {
      PhotoManager.openSetting();
    }
  }

  Future<void> getAlbums() async {
    await PhotoManager.getAssetPathList(type: RequestType.image).then((paths) {
      for (AssetPathEntity asset in paths) {
        asset.getAssetListRange(start: 0, end: 10000).then((images) {
          if (images.isNotEmpty) {
            final album = AlbumModel.fromGallery(asset.id, asset.name, images);
            _albums.value.add(album);
            _albums.refresh();
          }
        });
      }
    });
  }
}
