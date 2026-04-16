import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class RegisterUser implements UseCase<User, RegisterUserParams> {
  final AuthRepository repository;

  RegisterUser(this.repository);

  @override
  Future<Either<Failure, User>> call(RegisterUserParams params) async {
    return await repository.register(
      name: params.name,
      email: params.email,
      phoneNumber: params.phoneNumber,
      password: params.password,
      userType: params.userType,
      professionType: params.professionType,
      location: params.location,
    );
  }
}

class RegisterUserParams {
  final String name;
  final String email;
  final String? phoneNumber;
  final String password;
  final UserType userType;
  final ProfessionType? professionType;
  final Location? location;

  RegisterUserParams({
    required this.name,
    required this.email,
    this.phoneNumber,
    required this.password,
    required this.userType,
    this.professionType,
    this.location,
  });
}
