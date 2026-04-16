import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/professional.dart';
import '../../domain/entities/review.dart';
import '../../domain/repositories/professional_repository.dart';
import '../datasources/professional_remote_datasource.dart';

/// Implementation of professional repository
class ProfessionalRepositoryImpl implements ProfessionalRepository {
  final ProfessionalRemoteDataSource remoteDataSource;

  ProfessionalRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Professional>> registerProfessional({
    required String userId,
    required String fullName,
    required String email,
    required String phoneNumber,
    required String profession,
    required int experienceYears,
    String? bio,
    File? profileImage,
  }) async {
    try {
      final professional = await remoteDataSource.registerProfessional(
        userId: userId,
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        profession: profession,
        experienceYears: experienceYears,
        bio: bio,
        profileImage: profileImage,
      );
      return Right(professional);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Professional>> updateProfessional({
    required String professionalId,
    String? fullName,
    String? phoneNumber,
    String? profession,
    int? experienceYears,
    String? bio,
    bool? isAvailable,
    File? profileImage,
  }) async {
    try {
      final updates = <String, dynamic>{};
      if (fullName != null) updates['fullName'] = fullName;
      if (phoneNumber != null) updates['phoneNumber'] = phoneNumber;
      if (profession != null) updates['profession'] = profession;
      if (experienceYears != null) updates['experienceYears'] = experienceYears;
      if (bio != null) updates['bio'] = bio;
      if (isAvailable != null) updates['isAvailable'] = isAvailable;

      final professional = await remoteDataSource.updateProfessional(
        professionalId: professionalId,
        updates: updates,
      );
      return Right(professional);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> uploadWorkImages({
    required String professionalId,
    required List<File> images,
  }) async {
    try {
      final imageUrls = await remoteDataSource.uploadWorkImages(
        professionalId: professionalId,
        images: images,
      );
      return Right(imageUrls);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteWorkImage({
    required String professionalId,
    required String imageUrl,
  }) async {
    try {
      await remoteDataSource.deleteWorkImage(
        professionalId: professionalId,
        imageUrl: imageUrl,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Professional>> getProfessionalById(String id) async {
    try {
      final professional = await remoteDataSource.getProfessionalById(id);
      return Right(professional);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Professional>> getProfessionalByUserId(
    String userId,
  ) async {
    try {
      final professional = await remoteDataSource.getProfessionalByUserId(userId);
      return Right(professional);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Professional>>> getProfessionalsByProfession(
    String profession,
  ) async {
    try {
      final professionals =
          await remoteDataSource.getProfessionalsByProfession(profession);
      return Right(professionals);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Professional>>> getAvailableProfessionals() async {
    try {
      final professionals = await remoteDataSource.getAvailableProfessionals();
      return Right(professionals);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Review>>> getProfessionalReviews(
    String professionalId,
  ) async {
    try {
      final reviews = await remoteDataSource.getProfessionalReviews(professionalId);
      return Right(reviews);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> toggleAvailability({
    required String professionalId,
    required bool isAvailable,
  }) async {
    try {
      await remoteDataSource.toggleAvailability(
        professionalId: professionalId,
        isAvailable: isAvailable,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
