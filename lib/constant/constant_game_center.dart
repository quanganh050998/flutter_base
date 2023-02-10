import 'package:game_center/models/game_center/all_game_model.dart';
import 'package:game_center/models/game_center/game_dashboard_model.dart';
import 'package:game_center/models/game_center/profile_player_model.dart';

///conflig dummy data local test
final dataHotGameDefault =  [
  GameModel(
    id: 1,
    chainId: 56,
    banners: [],
    mobileBanners: [
      BannerImage(
        gameId: 1,
        id: 1,
        url:
        'https://i.pinimg.com/736x/83/4d/68/834d68ed257ce1a1515622649776565d.jpg',
        width: 12,
        height: 12,
        isMobile: true,
      ),
    ],
    gameName: 'Lala',
    shortDescription: 'LaLa earned POSI with lucky',
    description: 'description',
    gameUrl: 'gameUrl',
    enable: true,
    screenOrientation: TypeScreenOrientation.ScreenOrientationPortrait,
  ),
  GameModel(
    id: 4,
    chainId: 56,
    banners: [],
    mobileBanners: [
      BannerImage(
        gameId: 1,
        id: 1,
        url:
        'https://i.pinimg.com/736x/83/4d/68/834d68ed257ce1a1515622649776565d.jpg',
        width: 12,
        height: 12,
        isMobile: true,
      ),
    ],
    gameName: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    shortDescription:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mi duis egestas amet gravida vulputate...',
    description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus accumsan feugiat egestas blandit blandit massa elementum duis dignissim.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus accumsan feugiat egestas blandit blandit massa elementum duis dignissim.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus accumsan feugiat egestas blandit blandit massa elementum duis dignissim.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus accumsan feugiat egestas blandit blandit massa elementum duis dignissim.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus accumsan feugiat egestas blandit blandit massa elementum duis dignissim.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus accumsan feugiat egestas blandit blandit massa elementum duis dignissim.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus accumsan feugiat egestas blandit blandit massa elementum duis dignissim.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus accumsan feugiat egestas blandit blandit massa elementum duis dignissim.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus accumsan feugiat egestas blandit blandit massa elementum duis dignissim.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus accumsan feugiat egestas blandit blandit massa elementum duis dignissim.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus accumsan feugiat egestas blandit blandit massa elementum duis dignissim.',
    gameUrl: 'gameUrl',
    enable: true,
    screenOrientation: TypeScreenOrientation.ScreenOrientationPortrait,
  ),
  GameModel(
    id: 3,
    chainId: 56,
    banners: [],
    mobileBanners: [
      BannerImage(
        gameId: 1,
        id: 1,
        url:
        'https://i.pinimg.com/736x/83/4d/68/834d68ed257ce1a1515622649776565d.jpg',
        width: 12,
        height: 12,
        isMobile: true,
      ),
    ],
    gameName: 'Spin lucky',
    shortDescription: 'LaLa earned POSI with lucky',
    description: 'description',
    gameUrl: 'gameUrl',
    enable: true,
    screenOrientation: TypeScreenOrientation.ScreenOrientationPortrait,
  ),
  GameModel(
    id: 2,
    chainId: 56,
    banners: [],
    mobileBanners: [
      BannerImage(
        gameId: 1,
        id: 1,
        url:
        'https://i.pinimg.com/736x/83/4d/68/834d68ed257ce1a1515622649776565d.jpg',
        width: 12,
        height: 12,
        isMobile: true,
      ),
    ],
    gameName: 'Up Down price Up Down price',
    shortDescription: 'LaLa earned POSI with lucky',
    description: 'description',
    gameUrl: 'gameUrl',
    enable: true,
    screenOrientation: TypeScreenOrientation.ScreenOrientationPortrait,
  ),
];

final defaultGameDashBoard = GameDashboardModel(
  totalEarned: 0,
  playerOnline: 0,
  totalGames: 0,
  totalParticipants: 0,
  totalPlayers: 0,
);

final profileDefault = ProfilePlayerModel(name: 'default', age: '18', description: 'description', phone: '12345678');

const defaultSymbol = 'BTCBUSD';