import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/professional_repository.dart';

/// Use case for toggling professional availability
class ToggleAvailability implements UseCase<void, ToggleAvailabilityParams> {
  final ProfessionalRepository repository;

  ToggleAvailability(this.repository);

  @override
  Future<Either<Failure, void>> call(ToggleAvailabilityParams params) async {
    return await repository.toggleAvailability(
      professionalId: params.professionalId,
      isAvailable: params.isAvailable,
    );
  }
}

class ToggleAvailabilityParams extends Equatable {
  final String professionalId;
  final bool isAvailable;

  const ToggleAvailabilityParams({
    required this.professionalId,
    required this.isAvailable,
  });

  @override
  List<Object?> get props => [professionalId, isAvailable];
}
