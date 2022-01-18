import 'package:json_annotation/json_annotation.dart';
part 'location.g.dart';

@JsonSerializable()
class Location {
  final String? title;
  final String? name;
  final String? city;
  final String? country;
  final Map<String, double?>? position;

  Location({this.title, this.name, this.city, this.country, this.position});

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}
