import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_game_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AllGamesModel {
  @JsonKey(defaultValue: 0)
  int currentPage;
  @JsonKey(defaultValue: 0)
  int perPage;
  @JsonKey(defaultValue: 0)
  int itemCount;
  @JsonKey(defaultValue: 0)
  int pageCount;
  @JsonKey(defaultValue: [])
  List<GameModel> games;

  AllGamesModel({
    required this.currentPage,
    required this.perPage,
    required this.itemCount,
    required this.pageCount,
    required this.games,
  });

  factory AllGamesModel.fromJson(Map<String, dynamic> json) =>
      _$AllGamesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllGamesModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GameModel {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: 0)
  int chainId;
  @JsonKey(defaultValue: null)
  List<ItemSmartContractAddress>? smartContractAddress;
  @JsonKey(defaultValue: [])
  List<BannerImage> banners;
  @JsonKey(defaultValue: [])
  List<BannerImage> mobileBanners;
  @JsonKey(defaultValue: '')
  String gameName;
  @JsonKey(defaultValue: '')
  String shortDescription;
  @JsonKey(defaultValue: '')
  String description;
  @JsonKey(defaultValue: '')
  String gameUrl;
  @JsonKey(defaultValue: true)
  bool enable;
  @JsonKey(defaultValue: TypeScreenOrientation.ScreenOrientationLandscape)
  TypeScreenOrientation? screenOrientation;

  GameModel({
    required this.id,
    required this.chainId,
    this.smartContractAddress,
    required this.banners,
    required this.mobileBanners,
    required this.gameName,
    required this.shortDescription,
    required this.description,
    required this.gameUrl,
    required this.enable,
    this.screenOrientation,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ItemSmartContractAddress {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: 0)
  int gameId;
  @JsonKey(defaultValue: 0)
  int chainId;
  @JsonKey(defaultValue: '')
  String address;

  ItemSmartContractAddress(
      {required this.address,
        required this.chainId,
        required this.gameId,
        required this.id,});

  factory ItemSmartContractAddress.fromJson(Map<String, dynamic> json) =>
      _$ItemSmartContractAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ItemSmartContractAddressToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BannerImage {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: 0)
  int gameId;
  @JsonKey(defaultValue: '')
  String url;
  @JsonKey(defaultValue: 0)
  double? width;
  @JsonKey(defaultValue: 0)
  double? height;
  @JsonKey(defaultValue: true)
  bool? isMobile;

  BannerImage({
    required this.gameId,
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    required this.isMobile,
  });

  factory BannerImage.fromJson(Map<String, dynamic> json) =>
      _$BannerImageFromJson(json);

  Map<String, dynamic> toJson() => _$BannerImageToJson(this);
}

enum TypeScreenOrientation {
  @JsonValue('SCREEN_ORIENTATION_LANDSCAPE')
  ScreenOrientationLandscape,
  @JsonValue('SCREEN_ORIENTATION_PORTRAIT')
  ScreenOrientationPortrait,
}
