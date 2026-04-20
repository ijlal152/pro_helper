import 'dart:io';

import '../models/professional_model.dart';
import '../models/review_model.dart';
import 'mock_professional_data.dart';
import 'professional_remote_datasource.dart';

/// Mock implementation of remote data source for testing
class ProfessionalMockDataSource implements ProfessionalRemoteDataSource {
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
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Create a new professional
    final newProfessional = ProfessionalModel(
      id: 'new_${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      profession: profession,
      experienceYears: experienceYears,
      bio: bio,
      rating: 0.0,
      totalJobs: 0,
      totalReviews: 0,
      isAvailable: true,
      workImages: const [],
      profileImage: profileImage?.path,
      createdAt: DateTime.now(),
    );

    return newProfessional;
  }

  @override
  Future<ProfessionalModel> updateProfessional({
    required String professionalId,
    required Map<String, dynamic> updates,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final professional = MockProfessionalData.getProfessionalById(
      professionalId,
    );

    return ProfessionalModel(
      id: professional.id,
      userId: professional.userId,
      fullName: updates['fullName'] ?? professional.fullName,
      email: professional.email,
      phoneNumber: updates['phoneNumber'] ?? professional.phoneNumber,
      profession: updates['profession'] ?? professional.profession,
      experienceYears:
          updates['experienceYears'] ?? professional.experienceYears,
      bio: updates['bio'] ?? professional.bio,
      rating: professional.rating,
      totalJobs: professional.totalJobs,
      totalReviews: professional.totalReviews,
      isAvailable: updates['isAvailable'] ?? professional.isAvailable,
      workImages: professional.workImages,
      profileImage: professional.profileImage,
      createdAt: professional.createdAt,
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<List<String>> uploadWorkImages({
    required String professionalId,
    required List<File> images,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    // Return mock image URLs
    return images
        .asMap()
        .entries
        .map((e) => 'https://picsum.photos/400/300?random=${e.key + 100}')
        .toList();
  }

  @override
  Future<void> deleteWorkImage({
    required String professionalId,
    required String imageUrl,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    // Mock deletion - no actual operation needed
  }

  @override
  Future<ProfessionalModel> getProfessionalById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return MockProfessionalData.getProfessionalById(id);
  }

  @override
  Future<ProfessionalModel> getProfessionalByUserId(String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    // For testing, return first professional
    return MockProfessionalData.professionals.first;
  }

  @override
  Future<List<ProfessionalModel>> getProfessionalsByProfession(
    String profession,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return MockProfessionalData.getProfessionalsByProfession(profession);
  }

  @override
  Future<List<ProfessionalModel>> getAvailableProfessionals() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return MockProfessionalData.getAvailableProfessionals();
  }

  @override
  Future<List<ReviewModel>> getProfessionalReviews(
    String professionalId,
  ) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return MockProfessionalData.getReviewsForProfessional(professionalId);
  }

  @override
  Future<void> toggleAvailability({
    required String professionalId,
    required bool isAvailable,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    // Mock toggle - no actual operation needed
  }
}
