import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api_photo/model/albom_response.dart';

import '../model/photo_response.dart';


class ApiClient {
  ApiClient._();

  static final ApiClient initance = ApiClient._();

  // Future<List<PhotoResponse>> getPhotos() async {
  //   var client = http.Client();
  //   try {
  //     var response = await client.get(
  //       Uri.parse("https://jsonplaceholder.typicode.com/albums"),
  //     );
  //     var  decodedResponse = json.decode(response.body) as List<dynamic>;
  //     List<PhotoResponse> list=decodedResponse.map((e) => PhotoResponse.fromJson(e)).toList();
  //     return Future.value(list);
  //   } finally {
  //     client.close();
  //   }
  // }
    Future<List<AlbomResponse>> getAlbom() async {
      var client =http.Client();
      try {
        var response = await client.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"),);
        var decodedResponse = json.decode(response.body) as List<dynamic>;
        List<AlbomResponse> list = decodedResponse.map((e) => AlbomResponse.fromJson(e)).toList();
        return Future.value(list);
      } finally {
        client.close();
      }
    }

}
