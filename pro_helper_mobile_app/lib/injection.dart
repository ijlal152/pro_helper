import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constants/app_config.dart';
import 'core/network/dio_client.dart';
import 'core/network/network_info.dart';
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
  // Register external dependencies
  getIt.registerLazySingleton(() => InternetConnectionChecker.instance);

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  const secureStorage = FlutterSecureStorage();
  getIt.registerLazySingleton(() => secureStorage);

  // Register core dependencies
  getIt.registerLazySingleton(() => DioClient());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // Register Professional feature dependencies
  _registerProfessionalDependencies();

  // Initialize injectable generated code
  getIt.init();
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
