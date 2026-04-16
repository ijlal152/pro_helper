part of 'professional_registration_bloc.dart';

/// Base state for professional registration
abstract class ProfessionalRegistrationState extends Equatable {
  const ProfessionalRegistrationState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class ProfessionalRegistrationInitial extends ProfessionalRegistrationState {
  const ProfessionalRegistrationInitial();
}

/// Loading state
class ProfessionalRegistrationLoading extends ProfessionalRegistrationState {
  const ProfessionalRegistrationLoading();
}

/// Success state
class ProfessionalRegistrationSuccess extends ProfessionalRegistrationState {
  final Professional professional;

  const ProfessionalRegistrationSuccess({required this.professional});

  @override
  List<Object?> get props => [professional];
}

/// Error state
class ProfessionalRegistrationError extends ProfessionalRegistrationState {
  final String message;

  const ProfessionalRegistrationError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Form updated state
class ProfessionalRegistrationFormUpdated
    extends ProfessionalRegistrationState {
  final Map<String, dynamic> formData;

  const ProfessionalRegistrationFormUpdated({required this.formData});

  @override
  List<Object?> get props => [formData];
}

/// Work images upload success state
class WorkImagesUploadSuccess extends ProfessionalRegistrationState {
  final List<String> imageUrls;

  const WorkImagesUploadSuccess({required this.imageUrls});

  @override
  List<Object?> get props => [imageUrls];
}
