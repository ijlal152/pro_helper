import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/professional.dart';
import '../repositories/professional_repository.dart';

/// Use case for registering a new professional
class RegisterProfessional
    implements UseCase<Professional, RegisterProfessionalParams> {
  final ProfessionalRepository repository;

  RegisterProfessional(this.repository);

  @override
  Future<Either<Failure, Professional>> call(
    RegisterProfessionalParams params,
  ) async {
    return await repository.registerProfessional(
      userId: params.userId,
      fullName: params.fullName,
      email: params.email,
      phoneNumber: params.phoneNumber,
      profession: params.profession,
      experienceYears: params.experienceYears,
      bio: params.bio,
      profileImage: params.profileImage,
    );
  }
}

class RegisterProfessionalParams extends Equatable {
  final String userId;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String profession;
  final int experienceYears;
  final String? bio;
  final File? profileImage;

  const RegisterProfessionalParams({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.profession,
    required this.experienceYears,
    this.bio,
    this.profileImage,
  });

  @override
  List<Object?> get props => [
    userId,
    fullName,
    email,
    phoneNumber,
    profession,
    experienceYears,
    bio,
    profileImage,
  ];
}
