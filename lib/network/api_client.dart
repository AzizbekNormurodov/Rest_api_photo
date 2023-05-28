import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/photo_response.dart';


class ApiClient {
  ApiClient._();

  static final ApiClient initance = ApiClient._();

  Future<List<PhotoResponse>> getPhotos() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse("https://jsonplaceholder.typicode.com/photos"),
      );
      var  decodedResponse = json.decode(response.body) as List<dynamic>;
      List<PhotoResponse> list=decodedResponse.map((e) => PhotoResponse.fromJson(e)).toList();
      return Future.value(list);
    } finally {
      client.close();
    }
  }
}
