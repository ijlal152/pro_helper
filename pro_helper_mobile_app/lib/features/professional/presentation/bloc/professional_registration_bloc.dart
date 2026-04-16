import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/professional.dart';
import '../../domain/usecases/register_professional.dart';
import '../../domain/usecases/upload_work_images.dart';

part 'professional_registration_event.dart';
part 'professional_registration_state.dart';

/// BLoC for handling professional registration
class ProfessionalRegistrationBloc
    extends Bloc<ProfessionalRegistrationEvent, ProfessionalRegistrationState> {
  final RegisterProfessional registerProfessional;
  final UploadWorkImages uploadWorkImages;

  ProfessionalRegistrationBloc({
    required this.registerProfessional,
    required this.uploadWorkImages,
  }) : super(const ProfessionalRegistrationInitial()) {
    on<RegisterProfessionalEvent>(_onRegisterProfessional);
    on<UploadWorkImagesEvent>(_onUploadWorkImages);
    on<UpdateFormDataEvent>(_onUpdateFormData);
  }

  Future<void> _onRegisterProfessional(
    RegisterProfessionalEvent event,
    Emitter<ProfessionalRegistrationState> emit,
  ) async {
    emit(const ProfessionalRegistrationLoading());

    final result = await registerProfessional(
      RegisterProfessionalParams(
        userId: event.userId,
        fullName: event.fullName,
        email: event.email,
        phoneNumber: event.phoneNumber,
        profession: event.profession,
        experienceYears: event.experienceYears,
        bio: event.bio,
        profileImage: event.profileImage,
      ),
    );

    result.fold(
      (failure) => emit(ProfessionalRegistrationError(failure.message)),
      (professional) =>
          emit(ProfessionalRegistrationSuccess(professional: professional)),
    );
  }

  Future<void> _onUploadWorkImages(
    UploadWorkImagesEvent event,
    Emitter<ProfessionalRegistrationState> emit,
  ) async {
    emit(const ProfessionalRegistrationLoading());

    final result = await uploadWorkImages(
      UploadWorkImagesParams(
        professionalId: event.professionalId,
        images: event.images,
      ),
    );

    result.fold(
      (failure) => emit(ProfessionalRegistrationError(failure.message)),
      (imageUrls) => emit(WorkImagesUploadSuccess(imageUrls: imageUrls)),
    );
  }

  void _onUpdateFormData(
    UpdateFormDataEvent event,
    Emitter<ProfessionalRegistrationState> emit,
  ) {
    emit(ProfessionalRegistrationFormUpdated(formData: event.formData));
  }
}
