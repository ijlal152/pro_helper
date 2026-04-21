part of 'professional_detail_cubit.dart';

@freezed
class ProfessionalDetailState with _$ProfessionalDetailState {
  const factory ProfessionalDetailState.initial() = ProfessionalDetailInitial;

  const factory ProfessionalDetailState.loaded({
    required int currentImageIndex,
    required DateTime? selectedDate,
    required double selectedDuration,
  }) = ProfessionalDetailLoaded;
}
