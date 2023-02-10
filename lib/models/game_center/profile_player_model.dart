import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_player_model.g.dart';

@JsonSerializable()
@Entity(tableName: 'profile_player')
class ProfilePlayerModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String name;
  final String age;
  final String description;
  String? phone;

  ProfilePlayerModel({
    this.id,
    required this.name,
    required this.age,
    required this.description,
    this.phone,
  });

  factory ProfilePlayerModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilePlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePlayerModelToJson(this);
}
