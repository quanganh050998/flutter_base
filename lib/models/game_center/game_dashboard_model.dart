import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_dashboard_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GameDashboardModel {
  @JsonKey(defaultValue: 0)
  double totalEarned;
  @JsonKey(defaultValue: 0)
  double totalParticipants;
  @JsonKey(defaultValue: 0)
  int totalPlayers;
  @JsonKey(defaultValue: 0)
  int playerOnline;
  @JsonKey(defaultValue: 0)
  int totalGames;

  GameDashboardModel({
    required this.totalEarned,
    required this.playerOnline,
    required this.totalGames,
    required this.totalParticipants,
    required this.totalPlayers,
  });

  factory GameDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$GameDashboardModelFromJson(json);
}
