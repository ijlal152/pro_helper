// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'core/network/dio_client.dart' as _i45;
import 'core/network/network_info.dart' as _i75;
import 'features/auth/data/datasources/auth_local_data_source.dart' as _i791;
import 'features/auth/data/datasources/auth_remote_data_source.dart' as _i767;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i111;
import 'features/auth/domain/repositories/auth_repository.dart' as _i1015;
import 'features/auth/domain/usecases/get_current_user.dart' as _i191;
import 'features/auth/domain/usecases/login_with_email.dart' as _i871;
import 'features/auth/domain/usecases/logout.dart' as _i80;
import 'features/auth/domain/usecases/register_user.dart' as _i14;
import 'features/auth/presentation/cubit/auth_cubit.dart' as _i945;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i767.AuthRemoteDataSource>(
      () => _i767.AuthRemoteDataSourceImpl(gh<_i45.DioClient>()),
    );
    gh.lazySingleton<_i791.AuthLocalDataSource>(
      () => _i791.AuthLocalDataSourceImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i1015.AuthRepository>(
      () => _i111.AuthRepositoryImpl(
        remoteDataSource: gh<_i767.AuthRemoteDataSource>(),
        localDataSource: gh<_i791.AuthLocalDataSource>(),
        networkInfo: gh<_i75.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i871.LoginWithEmail>(
      () => _i871.LoginWithEmail(gh<_i1015.AuthRepository>()),
    );
    gh.lazySingleton<_i14.RegisterUser>(
      () => _i14.RegisterUser(gh<_i1015.AuthRepository>()),
    );
    gh.lazySingleton<_i191.GetCurrentUser>(
      () => _i191.GetCurrentUser(gh<_i1015.AuthRepository>()),
    );
    gh.lazySingleton<_i80.Logout>(
      () => _i80.Logout(gh<_i1015.AuthRepository>()),
    );
    gh.factory<_i945.AuthCubit>(
      () => _i945.AuthCubit(
        loginWithEmail: gh<_i871.LoginWithEmail>(),
        registerUser: gh<_i14.RegisterUser>(),
        logout: gh<_i80.Logout>(),
        getCurrentUser: gh<_i191.GetCurrentUser>(),
      ),
    );
    return this;
  }
}
