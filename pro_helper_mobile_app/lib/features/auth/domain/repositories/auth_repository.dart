import 'package:dartz/dartz.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';

/// Authentication repository interface
abstract class AuthRepository {
  /// Login with email and password
  Future<Either<Failure, User>> loginWithEmail({
    required String email,
    required String password,
  });

  /// Login with phone number
  Future<Either<Failure, User>> loginWithPhone({
    required String phoneNumber,
    required String verificationCode,
  });

  /// Register new user
  Future<Either<Failure, User>> register({
    required String name,
    required String email,
    String? phoneNumber,
    required String password,
    required UserType userType,
    ProfessionType? professionType,
    Location? location,
  });

  /// Send phone verification code
  Future<Either<Failure, void>> sendVerificationCode({
    required String phoneNumber,
  });

  /// Logout
  Future<Either<Failure, void>> logout();

  /// Get current user
  Future<Either<Failure, User>> getCurrentUser();

  /// Check if user is logged in
  Future<bool> isLoggedIn();
}
