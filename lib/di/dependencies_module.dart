import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../configs/config.dart';
import '../data/data.dart';
import '../domain/domain.dart';
import '../presentation/presentation.dart';

final getIt = GetIt.asNewInstance();

void setupLocator() {
  //Network
  getIt.registerLazySingleton(() => DioProvider());

  //Secure Storage
  getIt.registerLazySingleton<FlutterSecureStorage>(() {
    AndroidOptions androidOptions = const AndroidOptions(
      encryptedSharedPreferences: true
    );

    IOSOptions iosOptions = const IOSOptions(
      accessibility: KeychainAccessibility.first_unlock
    );

    return FlutterSecureStorage(
      aOptions: androidOptions,
      iOptions: iosOptions
    );
  });

  getIt.registerLazySingleton<KeyValueStorageService>(() => KeyValueStorageServiceImpl(flutterSecureStorage: getIt<FlutterSecureStorage>()));

  //Datasources
  getIt.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl(
    dioProvider: getIt<DioProvider>(),
    keyValueStorageService: getIt<KeyValueStorageService>()
  ));

  //Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authDatasource: getIt<AuthDatasource>()));

  //UseCases
  getIt.registerLazySingleton(() => InsertAuthUsecase(authRepository: getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => IsLoggedInUsecase(authRepository: getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => LoginUseCase(authRepository: getIt<AuthRepository>()));

  //Validators
  getIt.registerLazySingleton(() => ValidationRouter());

  //Blocs
  getIt.registerLazySingleton(() => 
    LoginScreenBloc(
      validationRouter: getIt<ValidationRouter>(),
      loginUseCase: getIt<LoginUseCase>(),
      insertAuthCase: getIt<InsertAuthUsecase>()
    )
  );
  getIt.registerLazySingleton(() => 
    AppRouterCubit(
      isLoggedInUsecase: getIt<IsLoggedInUsecase>(),
      loginScreenBloc: getIt<LoginScreenBloc>()
    )
  );
  getIt.registerLazySingleton(() => HomeScreenCubit());
}