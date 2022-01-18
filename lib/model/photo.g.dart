// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      id: json['id'] as String,
      likes: (json['likes'] as num?)?.toDouble(),
      downloads: (json['downloads'] as num?)?.toDouble(),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)
          ?.map(
              (e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      urls: json['urls'] == null
          ? null
          : URLS.fromJson(json['urls'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'likes': instance.likes,
      'downloads': instance.downloads,
      'location': instance.location,
      'tags': instance.tags,
      'urls': instance.urls,
    };
