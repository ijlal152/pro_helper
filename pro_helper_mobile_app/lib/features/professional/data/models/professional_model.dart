import '../../domain/entities/professional.dart';

/// Professional data model
class ProfessionalModel extends Professional {
  const ProfessionalModel({
    required super.id,
    required super.userId,
    required super.fullName,
    required super.email,
    required super.phoneNumber,
    required super.profession,
    required super.experienceYears,
    super.bio,
    super.rating,
    super.totalJobs,
    super.totalReviews,
    super.isAvailable,
    super.workImages,
    super.profileImage,
    required super.createdAt,
    super.updatedAt,
  });

  factory ProfessionalModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profession: json['profession'] as String,
      experienceYears: json['experienceYears'] as int,
      bio: json['bio'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      totalJobs: json['totalJobs'] as int? ?? 0,
      totalReviews: json['totalReviews'] as int? ?? 0,
      isAvailable: json['isAvailable'] as bool? ?? true,
      workImages: (json['workImages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      profileImage: json['profileImage'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profession': profession,
      'experienceYears': experienceYears,
      'bio': bio,
      'rating': rating,
      'totalJobs': totalJobs,
      'totalReviews': totalReviews,
      'isAvailable': isAvailable,
      'workImages': workImages,
      'profileImage': profileImage,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory ProfessionalModel.fromEntity(Professional professional) {
    return ProfessionalModel(
      id: professional.id,
      userId: professional.userId,
      fullName: professional.fullName,
      email: professional.email,
      phoneNumber: professional.phoneNumber,
      profession: professional.profession,
      experienceYears: professional.experienceYears,
      bio: professional.bio,
      rating: professional.rating,
      totalJobs: professional.totalJobs,
      totalReviews: professional.totalReviews,
      isAvailable: professional.isAvailable,
      workImages: professional.workImages,
      profileImage: professional.profileImage,
      createdAt: professional.createdAt,
      updatedAt: professional.updatedAt,
    );
  }
}
