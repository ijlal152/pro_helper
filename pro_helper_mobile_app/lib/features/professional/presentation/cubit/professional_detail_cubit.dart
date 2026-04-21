import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'professional_detail_cubit.freezed.dart';
part 'professional_detail_state.dart';

class ProfessionalDetailCubit extends Cubit<ProfessionalDetailState> {
  ProfessionalDetailCubit() : super(const ProfessionalDetailState.initial());

  void initialize() {
    emit(
      const ProfessionalDetailState.loaded(
        currentImageIndex: 0,
        selectedDate: null,
        selectedDuration: 2.0,
      ),
    );
  }

  void updateImageIndex(int index) {
    if (state is ProfessionalDetailLoaded) {
      final currentState = state as ProfessionalDetailLoaded;
      emit(currentState.copyWith(currentImageIndex: index));
    }
  }

  void selectDate(DateTime date) {
    if (state is ProfessionalDetailLoaded) {
      final currentState = state as ProfessionalDetailLoaded;
      emit(currentState.copyWith(selectedDate: date));
    }
  }

  void updateDuration(double duration) {
    if (state is ProfessionalDetailLoaded) {
      final currentState = state as ProfessionalDetailLoaded;
      emit(currentState.copyWith(selectedDuration: duration));
    }
  }

  void clearBookingData() {
    if (state is ProfessionalDetailLoaded) {
      final currentState = state as ProfessionalDetailLoaded;
      emit(currentState.copyWith(selectedDate: null, selectedDuration: 2.0));
    }
  }
}
