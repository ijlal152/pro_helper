import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_config.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  // Mock user data for testing
  UserModel _createMockUser({
    required String email,
    required UserType userType,
    ProfessionType? professionType,
  }) {
    return UserModel(
      id: 'test-user-${DateTime.now().millisecondsSinceEpoch}',
      name: 'Test User',
      email: email,
      phoneNumber: '+1234567890',
      userType: userType.value,
      professionType: professionType?.name,
      rating: professionType != null ? 4.5 : null,
      yearsOfExperience: professionType != null ? 5 : null,
      currentLocation: const LocationModel(
        latitude: 37.7749,
        longitude: -122.4194,
        address: 'San Francisco, CA',
      ),
      workLocation: professionType != null
          ? const LocationModel(
              latitude: 37.7749,
              longitude: -122.4194,
              address: 'San Francisco, CA',
            )
          : null,
    );
  }

  @override
  Future<Either<Failure, User>> loginWithEmail({
    required String email,
    required String password,
  }) async {
    // Use mock data in test mode
    if (AppConfig.useTestData) {
      await Future.delayed(
        const Duration(milliseconds: 500),
      ); // Simulate network delay
      final mockUser = _createMockUser(
        email: email,
        userType: UserType.customer,
      );
      await localDataSource.cacheUser(mockUser);
      return Right(mockUser.toEntity());
    }

    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.loginWithEmail(
          email,
          password,
        );
        await localDataSource.cacheUser(userModel);
        return Right(userModel.toEntity());
      } on DioException catch (e) {
        return Left(ServerFailure(e.message ?? 'Server error'));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, User>> loginWithPhone({
    required String phoneNumber,
    required String verificationCode,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.loginWithPhone(
          phoneNumber,
          verificationCode,
        );
        await localDataSource.cacheUser(userModel);
        return Right(userModel.toEntity());
      } on DioException catch (e) {
        return Left(ServerFailure(e.message ?? 'Server error'));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, User>> register({
    required String name,
    required String email,
    String? phoneNumber,
    required String password,
    required UserType userType,
    ProfessionType? professionType,
    Location? location,
  }) async {
    // Use mock data in test mode
    if (AppConfig.useTestData) {
      await Future.delayed(
        const Duration(milliseconds: 500),
      ); // Simulate network delay
      final mockUser = _createMockUser(
        email: email,
        userType: userType,
        professionType: professionType,
      );
      await localDataSource.cacheUser(mockUser);
      return Right(mockUser.toEntity());
    }

    if (await networkInfo.isConnected) {
      try {
        final userData = {
          'name': name,
          'email': email,
          'phone_number': phoneNumber,
          'password': password,
          'user_type': userType.value,
          'profession_type': professionType?.name,
          if (location != null)
            'location': {
              'latitude': location.latitude,
              'longitude': location.longitude,
              'address': location.address,
            },
        };

        final userModel = await remoteDataSource.register(userData);
        await localDataSource.cacheUser(userModel);
        return Right(userModel.toEntity());
      } on DioException catch (e) {
        return Left(ServerFailure(e.message ?? 'Server error'));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, void>> sendVerificationCode({
    required String phoneNumber,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.sendVerificationCode(phoneNumber);
        return const Right(null);
      } on DioException catch (e) {
        return Left(ServerFailure(e.message ?? 'Server error'));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      if (await networkInfo.isConnected) {
        await remoteDataSource.logout();
      }
      await localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final cachedUser = await localDataSource.getCachedUser();
      if (cachedUser != null) {
        return Right(cachedUser.toEntity());
      } else {
        return const Left(CacheFailure('No user found'));
      }
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await localDataSource.getAuthToken();
    return token != null;
  }
}
