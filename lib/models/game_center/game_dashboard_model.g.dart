// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameDashboardModel _$GameDashboardModelFromJson(Map<String, dynamic> json) =>
    GameDashboardModel(
      totalEarned: (json['total_earned'] as num?)?.toDouble() ?? 0,
      playerOnline: json['player_online'] as int? ?? 0,
      totalGames: json['total_games'] as int? ?? 0,
      totalParticipants: (json['total_participants'] as num?)?.toDouble() ?? 0,
      totalPlayers: json['total_players'] as int? ?? 0,
    );

Map<String, dynamic> _$GameDashboardModelToJson(GameDashboardModel instance) =>
    <String, dynamic>{
      'total_earned': instance.totalEarned,
      'total_participants': instance.totalParticipants,
      'total_players': instance.totalPlayers,
      'player_online': instance.playerOnline,
      'total_games': instance.totalGames,
    };
