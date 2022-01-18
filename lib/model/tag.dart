import 'package:json_annotation/json_annotation.dart';
part 'tag.g.dart';

@JsonSerializable()
class Tag {
  final String type;
  final String title;

  Tag({required this.type, required this.title});

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
