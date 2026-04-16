part of 'professional_registration_bloc.dart';

/// Base event for professional registration
abstract class ProfessionalRegistrationEvent extends Equatable {
  const ProfessionalRegistrationEvent();

  @override
  List<Object?> get props => [];
}

/// Event to register a new professional
class RegisterProfessionalEvent extends ProfessionalRegistrationEvent {
  final String userId;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String profession;
  final int experienceYears;
  final String? bio;
  final File? profileImage;

  const RegisterProfessionalEvent({
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

/// Event to upload work images
class UploadWorkImagesEvent extends ProfessionalRegistrationEvent {
  final String professionalId;
  final List<File> images;

  const UploadWorkImagesEvent({
    required this.professionalId,
    required this.images,
  });

  @override
  List<Object?> get props => [professionalId, images];
}

/// Event to update form data
class UpdateFormDataEvent extends ProfessionalRegistrationEvent {
  final Map<String, dynamic> formData;

  const UpdateFormDataEvent({required this.formData});

  @override
  List<Object?> get props => [formData];
}
