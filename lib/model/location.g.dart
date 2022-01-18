// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      title: json['title'] as String?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      position: (json['position'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num?)?.toDouble()),
      ),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'title': instance.title,
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
      'position': instance.position,
    };
