// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilePlayerModel _$ProfilePlayerModelFromJson(Map<String, dynamic> json) =>
    ProfilePlayerModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      age: json['age'] as String,
      description: json['description'] as String,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ProfilePlayerModelToJson(ProfilePlayerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'description': instance.description,
      'phone': instance.phone,
    };
