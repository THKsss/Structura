import 'dart:convert';
import 'dart:typed_data';

import 'package:webant_test/core/core.dart';
import 'package:webant_test/pages/photo_profile/data/models/photos_profile_data_model.dart';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhotoProfileDataApi {
  Future<PhotoProfileDataModel> apiGetPhotos() async {
    var dio = Dio();
    var prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('photo_id');
    var response = await dio.request(
      '$url/photos/$id',
      options: Options(method: 'GET'),
    );

    final data = response.data as Map<String, dynamic>;
    var responses = await Future.wait([
      dio.get('$url/media_objects/${data['image']['id']}'),
      dio.get('$url/clients/${data['id']}'),
    ]);

    Uint8List file = base64Decode(
      responses[0].data['file'].toString().substring(23),
    );
    String username = responses[1].data['name'];

    final PhotoProfileDataModel photoProfileData = PhotoProfileDataModel(
      id: data['id'],
      name: data['name'],
      username: username,
      dateCreate: data['dateCreate'],
      description: data['description'],
      image: file,
    );

    return photoProfileData;
  }
}
