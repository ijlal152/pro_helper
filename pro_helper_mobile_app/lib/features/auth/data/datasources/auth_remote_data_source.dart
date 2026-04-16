import 'package:injectable/injectable.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> loginWithEmail(String email, String password);
  Future<UserModel> loginWithPhone(String phoneNumber, String verificationCode);
  Future<UserModel> register(Map<String, dynamic> userData);
  Future<void> sendVerificationCode(String phoneNumber);
  Future<void> logout();
  Future<UserModel> getCurrentUser();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<UserModel> loginWithEmail(String email, String password) async {
    try {
      final response = await client.post(
        ApiConstants.login,
        data: {'email': email, 'password': password},
      );

      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> loginWithPhone(
    String phoneNumber,
    String verificationCode,
  ) async {
    try {
      final response = await client.post(
        ApiConstants.login,
        data: {
          'phone_number': phoneNumber,
          'verification_code': verificationCode,
        },
      );

      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> register(Map<String, dynamic> userData) async {
    try {
      final response = await client.post(ApiConstants.register, data: userData);

      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendVerificationCode(String phoneNumber) async {
    try {
      await client.post(
        '/auth/send-verification',
        data: {'phone_number': phoneNumber},
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await client.post(ApiConstants.logout);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final response = await client.get(ApiConstants.userProfile);
      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      rethrow;
    }
  }
}
