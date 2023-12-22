import 'dart:typed_data';

class PhotoProfileDataModel {
  PhotoProfileDataModel({
    required this.id,
    required this.name,
    required this.username,
    required this.dateCreate,
    required this.description,
    required this.image,
  });

  final int id;
  final String name, username, dateCreate, description;
  final Uint8List image;
}
