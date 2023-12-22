import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'package:webant_test/core/core.dart';

import 'package:webant_test/pages/main/data/models/photos_list_model.dart';

class PhotosDataApi {
  Future<List<PhotosListDataModel>> apiGetPhotos(
    bool isNew,
    int page,
    int limit,
  ) async {
    var request = http.Request(
      'GET',
      Uri.parse(
        '$url/photos?new=$isNew&popular=${!isNew}&page=$page&limit=$limit',
      ),
    );

    http.StreamedResponse response = await request.send();

    final data = json.decode(await response.stream.bytesToString());
    final List<PhotosListDataModel> photosList = [];
    List urlList = [];
    List<Future> responseList = [];

    for (int i = 0; i < data['data'].length; i++) {
      urlList.add(
        '$url/media_objects/${data['data'][i]['image']['id'].toString()}',
      );
      responseList.add(
        http.get(Uri.parse(urlList[i])),
      );
    }

    var responses = await Future.wait(responseList);

    for (int i = 0; i < responses.length; i++) {
      var response = json.decode(responses[i].body)['file'];
      if (response != null) {
        Uint8List file = base64Decode(response.toString().substring(23));
        photosList.add(
          PhotosListDataModel(
            id: data['data'][i]['id'],
            image: file,
          ),
        );
      } else {
        continue;
      }
    }
    return photosList;
  }
}
