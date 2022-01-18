import 'package:json_annotation/json_annotation.dart';
part 'urls.g.dart';

@JsonSerializable()
class URLS {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  URLS(
      {required this.raw,
      required this.full,
      required this.regular,
      required this.small,
      required this.thumb});

  factory URLS.fromJson(Map<String, dynamic> json) => _$URLSFromJson(json);    
}
