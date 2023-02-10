import 'package:json_annotation/json_annotation.dart';

part 'posi_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PosiResponse<T> {
  @JsonKey(name: 'meta')
  Meta? meta;
  @JsonKey(name: 'data')
  T? data;

  PosiResponse({this.meta, this.data});

  factory PosiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$PosiResponseFromJson<T>(
        json,
        fromJsonT,
      );
}

@JsonSerializable()
class Meta {
  @JsonKey(name: 'code')
  int? code;
  @JsonKey(name: 'message')
  String? message;

  Meta({this.code, this.message});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
