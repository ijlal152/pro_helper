import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'core/constants/app_config.dart';
import 'features/professional/data/datasources/professional_mock_datasource.dart';
import 'features/professional/data/datasources/professional_remote_datasource.dart';
import 'features/professional/data/repositories/professional_repository_impl.dart';
import 'features/professional/domain/repositories/professional_repository.dart';
import 'features/professional/domain/usecases/get_professionals_by_profession.dart';
import 'features/professional/domain/usecases/register_professional.dart';
import 'features/professional/domain/usecases/toggle_availability.dart';
import 'features/professional/domain/usecases/upload_work_images.dart';
import 'features/professional/presentation/bloc/professional_registration_bloc.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  // Initialize injectable generated code (registers all annotated deps + module deps)
  await getIt.init();

  // Register Professional feature dependencies
  _registerProfessionalDependencies();
}

void _registerProfessionalDependencies() {
  // Data sources - Use mock data in test mode
  if (AppConfig.useTestData) {
    getIt.registerLazySingleton<ProfessionalRemoteDataSource>(
      () => ProfessionalMockDataSource(),
    );
  } else {
    getIt.registerLazySingleton<ProfessionalRemoteDataSource>(
      () => ProfessionalRemoteDataSourceImpl(),
    );
  }

  // Repository
  getIt.registerLazySingleton<ProfessionalRepository>(
    () => ProfessionalRepositoryImpl(remoteDataSource: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => RegisterProfessional(getIt()));
  getIt.registerLazySingleton(() => UploadWorkImages(getIt()));
  getIt.registerLazySingleton(() => GetProfessionalsByProfession(getIt()));
  getIt.registerLazySingleton(() => ToggleAvailability(getIt()));

  // BLoC
  getIt.registerFactory(
    () => ProfessionalRegistrationBloc(
      registerProfessional: getIt(),
      uploadWorkImages: getIt(),
    ),
  );
}
