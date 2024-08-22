import 'package:photo_manager/photo_manager.dart';

class Album {
  String? name;
  String? id;
  List<AssetEntity>? images;

  Album({required this.name, required this.id, required this.images});

  factory Album.fromGallery(String name, String id, List<AssetEntity> images) {
    return Album(name: name, id: id, images: images);
  }
}
