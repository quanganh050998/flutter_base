// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllGamesModel _$AllGamesModelFromJson(Map<String, dynamic> json) =>
    AllGamesModel(
      currentPage: json['current_page'] as int? ?? 0,
      perPage: json['per_page'] as int? ?? 0,
      itemCount: json['item_count'] as int? ?? 0,
      pageCount: json['page_count'] as int? ?? 0,
      games: (json['games'] as List<dynamic>?)
              ?.map((e) => GameModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AllGamesModelToJson(AllGamesModel instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'item_count': instance.itemCount,
      'page_count': instance.pageCount,
      'games': instance.games,
    };

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
      id: json['id'] as int? ?? 0,
      chainId: json['chain_id'] as int? ?? 0,
      smartContractAddress: (json['smart_contract_address'] as List<dynamic>?)
          ?.map((e) =>
              ItemSmartContractAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      banners: (json['banners'] as List<dynamic>?)
              ?.map((e) => BannerImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      mobileBanners: (json['mobile_banners'] as List<dynamic>?)
              ?.map((e) => BannerImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      gameName: json['game_name'] as String? ?? '',
      shortDescription: json['short_description'] as String? ?? '',
      description: json['description'] as String? ?? '',
      gameUrl: json['game_url'] as String? ?? '',
      enable: json['enable'] as bool? ?? true,
      screenOrientation: $enumDecodeNullable(
              _$TypeScreenOrientationEnumMap, json['screen_orientation']) ??
          TypeScreenOrientation.ScreenOrientationLandscape,
    );

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'id': instance.id,
      'chain_id': instance.chainId,
      'smart_contract_address': instance.smartContractAddress,
      'banners': instance.banners,
      'mobile_banners': instance.mobileBanners,
      'game_name': instance.gameName,
      'short_description': instance.shortDescription,
      'description': instance.description,
      'game_url': instance.gameUrl,
      'enable': instance.enable,
      'screen_orientation':
          _$TypeScreenOrientationEnumMap[instance.screenOrientation],
    };

const _$TypeScreenOrientationEnumMap = {
  TypeScreenOrientation.ScreenOrientationLandscape:
      'SCREEN_ORIENTATION_LANDSCAPE',
  TypeScreenOrientation.ScreenOrientationPortrait:
      'SCREEN_ORIENTATION_PORTRAIT',
};

ItemSmartContractAddress _$ItemSmartContractAddressFromJson(
        Map<String, dynamic> json) =>
    ItemSmartContractAddress(
      address: json['address'] as String? ?? '',
      chainId: json['chain_id'] as int? ?? 0,
      gameId: json['game_id'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$ItemSmartContractAddressToJson(
        ItemSmartContractAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'game_id': instance.gameId,
      'chain_id': instance.chainId,
      'address': instance.address,
    };

BannerImage _$BannerImageFromJson(Map<String, dynamic> json) => BannerImage(
      gameId: json['game_id'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      url: json['url'] as String? ?? '',
      width: (json['width'] as num?)?.toDouble() ?? 0,
      height: (json['height'] as num?)?.toDouble() ?? 0,
      isMobile: json['is_mobile'] as bool? ?? true,
    );

Map<String, dynamic> _$BannerImageToJson(BannerImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'game_id': instance.gameId,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'is_mobile': instance.isMobile,
    };
