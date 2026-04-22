import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/professional.dart';

abstract class ProfessionalsListState {}

class ProfessionalsListInitial extends ProfessionalsListState {}

class ProfessionalsListLoading extends ProfessionalsListState {}

class ProfessionalsListLoaded extends ProfessionalsListState {
  final List<Professional> professionals;

  ProfessionalsListLoaded(this.professionals);
}

class ProfessionalsListError extends ProfessionalsListState {
  final String message;

  ProfessionalsListError(this.message);
}

class ProfessionalsListCubit extends Cubit<ProfessionalsListState> {
  ProfessionalsListCubit() : super(ProfessionalsListInitial());

  Future<void> loadProfessionals(String professionType) async {
    emit(ProfessionalsListLoading());
    try {
      // TODO: Replace with actual repository call
      await Future.delayed(const Duration(seconds: 1));

      // Mock data for now
      final professionals = List.generate(
        10,
        (index) => Professional(
          id: 'prof_$index',
          userId: 'user_$index',
          fullName: 'Professional ${index + 1}',
          email: 'professional$index@example.com',
          phoneNumber: '+92300123456$index',
          profession: professionType,
          experienceYears: 5 + index,
          bio:
              'Experienced $professionType with ${5 + index} years of expertise',
          rating: 4.0 + (index % 5) * 0.2,
          totalJobs: 50 + index * 10,
          totalReviews: 20 + index * 5,
          isAvailable: index % 3 != 0,
          workImages: [],
          profileImage: null,
          createdAt: DateTime.now().subtract(Duration(days: 365 * (index + 1))),
        ),
      );

      emit(ProfessionalsListLoaded(professionals));
    } catch (e) {
      emit(ProfessionalsListError('Failed to load professionals: $e'));
    }
  }
}
