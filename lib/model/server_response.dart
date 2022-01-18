import 'package:json_annotation/json_annotation.dart';
part 'server_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ServerResponse<T> {
  
  final int? status;
  final String? message;
  T? data;

  ServerResponse({this.status, this.message, this.data});

  factory ServerResponse.fromJson(
    Map<String, dynamic> json, 
    T Function(Object? json) fromJsonT
      ) => _$ServerResponseFromJson<T>(json, fromJsonT);
}