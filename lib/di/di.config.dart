// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:socket_io_client/socket_io_client.dart' as _i10;

import '../data/data_source/service/game_system.dart' as _i6;
import '../data/repositories/api_service/game_management_impl.dart' as _i15;
import '../data/repositories/firebase/firebase_config_impl.dart' as _i13;
import '../data/repositories/local_repositories/imp/profile_player_imp.dart'
    as _i8;
import '../data/repositories/local_repositories/local/acc_local_db.dart' as _i9;
import '../data/repositories/socket/socket_repo_impl.dart' as _i19;
import '../domain/repositories/api_service/game_management_repository.dart'
    as _i14;
import '../domain/repositories/firebase_config_repository.dart' as _i12;
import '../domain/repositories/profile_player_repository.dart' as _i7;
import '../domain/repositories/socket_mapping.dart' as _i18;
import '../domain/use_case/all_game_usecase.dart' as _i20;
import '../domain/use_case/data_dash_board_usecase.dart' as _i21;
import '../domain/use_case/list_hot_game_usecase.dart' as _i16;
import '../domain/use_case/mark_price_usecase.dart' as _i25;
import '../domain/use_case/player_profile_usecase.dart' as _i17;
import '../env_config.dart' as _i3;
import '../network/core_socket.dart' as _i11;
import '../presentation/game_center/cubit/game_center_cubit.dart' as _i22;
import '../presentation/game_center/game_onboarding/cubit/game_onboarding_cubit.dart'
    as _i23;
import '../presentation/game_center/list_all_game/cubit/list_all_game_cubit.dart'
    as _i24;
import '../presentation/game_center/player_profile/cubit/player_profile_cubit.dart'
    as _i26;
import 'module/firebase_module.dart' as _i28;
import 'module/network_module.dart' as _i27;
import 'module/socket_module.dart' as _i29;

const String _prod = 'prod';
const String _qc = 'qc';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  final firebaseModule = _$FirebaseModule();
  final socketModule = _$SocketModule();
  gh.factory<_i3.BuildConfig>(
    () => _i3.BuildConfigProd(),
    registerFor: {_prod},
  );
  gh.factory<_i3.BuildConfig>(
    () => _i3.BuildConfigQC(),
    registerFor: {_qc},
  );
  gh.factory<_i4.Dio>(() => networkModule.dio);
  gh.factory<_i5.FirebaseRemoteConfig>(() => firebaseModule.remoteConfig);
  gh.factory<_i6.GameSystem>(() => networkModule.gameSystem);
  gh.factory<_i7.ProfilePlayerRepository>(
      () => _i8.ProfilePlayerImp(get<_i9.AccLocalDatabase>()));
  gh.singleton<_i10.Socket>(socketModule.socketIO);
  gh.singleton<_i11.CoreSocket>(_i11.CoreSocket(socketIO: get<_i10.Socket>()));
  gh.factory<_i12.FirebaseConfigRepository>(
      () => _i13.FirebaseConfigImp(get<_i5.FirebaseRemoteConfig>()));
  gh.factory<_i14.GameManagementRepository>(() => _i15.GameManagementImpl(
        get<_i6.GameSystem>(),
        get<_i9.AccLocalDatabase>(),
      ));
  gh.factory<_i16.ListHotGameUseCase>(() => _i16.ListHotGameUseCase(
        get<_i14.GameManagementRepository>(),
        get<_i12.FirebaseConfigRepository>(),
      ));
  gh.factory<_i17.PlayerProfileUseCase>(() => _i17.PlayerProfileUseCase(
        get<_i14.GameManagementRepository>(),
        get<_i7.ProfilePlayerRepository>(),
      ));
  gh.factory<_i18.SocketMapping>(
      () => _i19.SocketRepoImpl(get<_i11.CoreSocket>()));
  gh.factory<_i20.AllGameUseCase>(() => _i20.AllGameUseCase(
        get<_i14.GameManagementRepository>(),
        get<_i12.FirebaseConfigRepository>(),
      ));
  gh.factory<_i21.DataDashBoardUseCase>(() => _i21.DataDashBoardUseCase(
        get<_i14.GameManagementRepository>(),
        get<_i12.FirebaseConfigRepository>(),
      ));
  gh.factory<_i22.GameCenterCubit>(() => _i22.GameCenterCubit(
        get<_i20.AllGameUseCase>(),
        get<_i21.DataDashBoardUseCase>(),
        get<_i16.ListHotGameUseCase>(),
      ));
  gh.factory<_i23.GameOnBoardingCubit>(
      () => _i23.GameOnBoardingCubit(get<_i21.DataDashBoardUseCase>()));
  gh.factory<_i24.ListAllGameCubit>(
      () => _i24.ListAllGameCubit(get<_i20.AllGameUseCase>()));
  gh.factory<_i25.MarkPriceUseCase>(
      () => _i25.MarkPriceUseCase(get<_i18.SocketMapping>()));
  gh.factory<_i26.PlayerProfileCubit>(() => _i26.PlayerProfileCubit(
        get<_i17.PlayerProfileUseCase>(),
        get<_i25.MarkPriceUseCase>(),
      ));
  return get;
}

class _$NetworkModule extends _i27.NetworkModule {}

class _$FirebaseModule extends _i28.FirebaseModule {}

class _$SocketModule extends _i29.SocketModule {}
