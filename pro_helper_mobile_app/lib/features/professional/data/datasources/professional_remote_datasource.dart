import 'dart:io';

import '../models/professional_model.dart';
import '../models/review_model.dart';

/// Remote data source for professional operations
abstract class ProfessionalRemoteDataSource {
  /// Register a new professional
  Future<ProfessionalModel> registerProfessional({
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
  Future<ProfessionalModel> updateProfessional({
    required String professionalId,
    required Map<String, dynamic> updates,
  });

  /// Upload work images
  Future<List<String>> uploadWorkImages({
    required String professionalId,
    required List<File> images,
  });

  /// Delete work image
  Future<void> deleteWorkImage({
    required String professionalId,
    required String imageUrl,
  });

  /// Get professional by ID
  Future<ProfessionalModel> getProfessionalById(String id);

  /// Get professional by user ID
  Future<ProfessionalModel> getProfessionalByUserId(String userId);

  /// Get all professionals by profession
  Future<List<ProfessionalModel>> getProfessionalsByProfession(
    String profession,
  );

  /// Get all available professionals
  Future<List<ProfessionalModel>> getAvailableProfessionals();

  /// Get professional reviews
  Future<List<ReviewModel>> getProfessionalReviews(String professionalId);

  /// Toggle availability status
  Future<void> toggleAvailability({
    required String professionalId,
    required bool isAvailable,
  });
}

/// Implementation of remote data source using API
class ProfessionalRemoteDataSourceImpl implements ProfessionalRemoteDataSource {
  // TODO: Inject DioClient for API calls
  // final DioClient client;

  ProfessionalRemoteDataSourceImpl();

  @override
  Future<ProfessionalModel> registerProfessional({
    required String userId,
    required String fullName,
    required String email,
    required String phoneNumber,
    required String profession,
    required int experienceYears,
    String? bio,
    File? profileImage,
  }) async {
    // TODO: Implement API call
    // For now, return mock data
    throw UnimplementedError('API integration pending');
  }

  @override
  Future<ProfessionalModel> updateProfessional({
    required String professionalId,
    required Map<String, dynamic> updates,
  }) async {
    throw UnimplementedError('API integration pending');
  }

  @override
  Future<List<String>> uploadWorkImages({
    required String professionalId,
    required List<File> images,
  }) async {
    throw UnimplementedError('API integration pending');
  }

  @override
  Future<void> deleteWorkImage({
    required String professionalId,
    required String imageUrl,
  }) async {
    throw UnimplementedError('API integration pending');
  }

  @override
  Future<ProfessionalModel> getProfessionalById(String id) async {
    throw UnimplementedError('API integration pending');
  }

  @override
  Future<ProfessionalModel> getProfessionalByUserId(String userId) async {
    throw UnimplementedError('API integration pending');
  }

  @override
  Future<List<ProfessionalModel>> getProfessionalsByProfession(
    String profession,
  ) async {
    throw UnimplementedError('API integration pending');
  }

  @override
  Future<List<ProfessionalModel>> getAvailableProfessionals() async {
    throw UnimplementedError('API integration pending');
  }

  @override
  Future<List<ReviewModel>> getProfessionalReviews(
    String professionalId,
  ) async {
    throw UnimplementedError('API integration pending');
  }

  @override
  Future<void> toggleAvailability({
    required String professionalId,
    required bool isAvailable,
  }) async {
    throw UnimplementedError('API integration pending');
  }
}
