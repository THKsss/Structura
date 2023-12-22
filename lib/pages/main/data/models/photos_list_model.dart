import 'dart:typed_data';

class PhotosListDataModel {
  PhotosListDataModel({
    required this.id,
    required this.image,
  });

  final int id;
  final Uint8List image;
}
