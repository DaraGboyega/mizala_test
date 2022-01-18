import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mizala_test/model/photo.dart';
import 'package:mizala_test/model/server_response.dart';
import 'package:mizala_test/remote/image_source.dart';

class ImageSourceImpl implements ImageSource {
  ImageSourceImpl({required Dio? dio}) : _dio = dio!;

  final Dio _dio;
  static String accessKey = "ChfITU3q00tosGsJT9xsafSuIWedTL3U0I9U4RRS-3I";

  @override
  Future<List<String>> getImageList() async {
    return _dio
        .get("/photos",
            options:
                Options(headers: {"authorization": "Client-ID $accessKey"}))
        .then((response) {
      return (response.data as List)
          .map((data) => data["id"].toString())
          .toList();
    });
  }

  @override
  Future<Photo> getImage(String id) async {
    return _dio
        .get("/photos/$id",
            options:
                Options(headers: {"authorization": "Client-ID $accessKey"}))
        .then((response) {
      Map<String, dynamic> apiResponse = response.data;
      return Photo.fromJson(apiResponse);
    }).then((value) => value);
  }
}
