import 'package:mizala_test/model/location.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mizala_test/model/tag.dart';
import 'package:mizala_test/model/urls.dart';
part 'photo.g.dart';

@JsonSerializable()
class Photo {
  final String id;
  final double? likes;
  final double? downloads;
  final Location? location;
  final List<Tag?>? tags;
  final URLS? urls;

  Photo(
      {required this.id,
      this.likes,
      this.downloads,
      this.location,
      required this.tags,
      required this.urls});

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
