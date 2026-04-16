import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/professional_repository.dart';

/// Use case for uploading work images
class UploadWorkImages implements UseCase<List<String>, UploadWorkImagesParams> {
  final ProfessionalRepository repository;

  UploadWorkImages(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(UploadWorkImagesParams params) async {
    return await repository.uploadWorkImages(
      professionalId: params.professionalId,
      images: params.images,
    );
  }
}

class UploadWorkImagesParams extends Equatable {
  final String professionalId;
  final List<File> images;

  const UploadWorkImagesParams({
    required this.professionalId,
    required this.images,
  });

  @override
  List<Object?> get props => [professionalId, images];
}
