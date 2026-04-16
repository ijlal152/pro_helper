import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/professional.dart';
import '../repositories/professional_repository.dart';

/// Use case for getting professionals by profession
class GetProfessionalsByProfession
    implements UseCase<List<Professional>, GetProfessionalsByProfessionParams> {
  final ProfessionalRepository repository;

  GetProfessionalsByProfession(this.repository);

  @override
  Future<Either<Failure, List<Professional>>> call(
    GetProfessionalsByProfessionParams params,
  ) async {
    return await repository.getProfessionalsByProfession(params.profession);
  }
}

class GetProfessionalsByProfessionParams extends Equatable {
  final String profession;

  const GetProfessionalsByProfessionParams({required this.profession});

  @override
  List<Object?> get props => [profession];
}
