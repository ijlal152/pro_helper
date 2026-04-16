import 'package:equatable/equatable.dart';

/// Professional entity representing a service provider
class Professional extends Equatable {
  final String id;
  final String userId;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String profession;
  final int experienceYears;
  final String? bio;
  final double rating;
  final int totalJobs;
  final int totalReviews;
  final bool isAvailable;
  final List<String> workImages;
  final String? profileImage;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const Professional({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.profession,
    required this.experienceYears,
    this.bio,
    this.rating = 0.0,
    this.totalJobs = 0,
    this.totalReviews = 0,
    this.isAvailable = true,
    this.workImages = const [],
    this.profileImage,
    required this.createdAt,
    this.updatedAt,
  });

  Professional copyWith({
    String? id,
    String? userId,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? profession,
    int? experienceYears,
    String? bio,
    double? rating,
    int? totalJobs,
    int? totalReviews,
    bool? isAvailable,
    List<String>? workImages,
    String? profileImage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Professional(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profession: profession ?? this.profession,
      experienceYears: experienceYears ?? this.experienceYears,
      bio: bio ?? this.bio,
      rating: rating ?? this.rating,
      totalJobs: totalJobs ?? this.totalJobs,
      totalReviews: totalReviews ?? this.totalReviews,
      isAvailable: isAvailable ?? this.isAvailable,
      workImages: workImages ?? this.workImages,
      profileImage: profileImage ?? this.profileImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    fullName,
    email,
    phoneNumber,
    profession,
    experienceYears,
    bio,
    rating,
    totalJobs,
    totalReviews,
    isAvailable,
    workImages,
    profileImage,
    createdAt,
    updatedAt,
  ];
}
