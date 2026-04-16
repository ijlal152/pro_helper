import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/constants.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getCachedUser();
  Future<void> cacheAuthToken(String token);
  Future<String?> getAuthToken();
  Future<void> clearCache();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  final FlutterSecureStorage secureStorage;

  AuthLocalDataSourceImpl(this.sharedPreferences, this.secureStorage);

  @override
  Future<void> cacheUser(UserModel user) async {
    final userJson = json.encode(user.toJson());
    await sharedPreferences.setString(AppConstants.userDataKey, userJson);
  }

  @override
  Future<UserModel?> getCachedUser() async {
    final userJson = sharedPreferences.getString(AppConstants.userDataKey);
    if (userJson != null) {
      return UserModel.fromJson(json.decode(userJson));
    }
    return null;
  }

  @override
  Future<void> cacheAuthToken(String token) async {
    await secureStorage.write(key: AppConstants.authTokenKey, value: token);
  }

  @override
  Future<String?> getAuthToken() async {
    return await secureStorage.read(key: AppConstants.authTokenKey);
  }

  @override
  Future<void> clearCache() async {
    await sharedPreferences.remove(AppConstants.userDataKey);
    await secureStorage.delete(key: AppConstants.authTokenKey);
  }
}
