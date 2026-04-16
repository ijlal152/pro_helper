import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/professional.dart';
import '../entities/review.dart';

/// Repository interface for professional operations
abstract class ProfessionalRepository {
  /// Register a new professional
  Future<Either<Failure, Professional>> registerProfessional({
    required String userId,
    required String fullName,
    required String email,
    required String phoneNumber,
    required String profession,
    required int experienceYears,
    String? bio,
    File? profileImage,
  });

  /// Update professional profile
  Future<Either<Failure, Professional>> updateProfessional({
    required String professionalId,
    String? fullName,
    String? phoneNumber,
    String? profession,
    int? experienceYears,
    String? bio,
    bool? isAvailable,
    File? profileImage,
  });

  /// Upload work images
  Future<Either<Failure, List<String>>> uploadWorkImages({
    required String professionalId,
    required List<File> images,
  });

  /// Delete work image
  Future<Either<Failure, void>> deleteWorkImage({
    required String professionalId,
    required String imageUrl,
  });

  /// Get professional by ID
  Future<Either<Failure, Professional>> getProfessionalById(String id);

  /// Get professional by user ID
  Future<Either<Failure, Professional>> getProfessionalByUserId(String userId);

  /// Get all professionals by profession
  Future<Either<Failure, List<Professional>>> getProfessionalsByProfession(
    String profession,
  );

  /// Get all available professionals
  Future<Either<Failure, List<Professional>>> getAvailableProfessionals();

  /// Get professional reviews
  Future<Either<Failure, List<Review>>> getProfessionalReviews(
    String professionalId,
  );

  /// Toggle availability status
  Future<Either<Failure, void>> toggleAvailability({
    required String professionalId,
    required bool isAvailable,
  });
}
