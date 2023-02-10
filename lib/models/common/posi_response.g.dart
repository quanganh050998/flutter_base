// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosiResponse<T> _$PosiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PosiResponse<T>(
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$PosiResponseToJson<T>(
  PosiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      code: json['code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
