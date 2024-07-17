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
  getIt.registerLazySingleton<RoleCategoryDatasource>(() => RoleCategoryDatasourceImpl(dioProvider: getIt<DioProvider>()));
  getIt.registerLazySingleton<RoleDatasource>(() => RoleDatasourceImpl(dioProvider: getIt<DioProvider>()));
  getIt.registerLazySingleton<RoleFunctionDatasource>(() => RoleFunctionDatasourceImpl(dioProvider: getIt<DioProvider>()));
  getIt.registerLazySingleton<UserDatasource>(() => UserDatasourceImpl(dioProvider: getIt<DioProvider>()));

  //Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authDatasource: getIt<AuthDatasource>()));
  getIt.registerLazySingleton<RoleCategoryRepository>(() => RoleCategoryRepositoryImpl(roleCategoryDatasource: getIt<RoleCategoryDatasource>()));
  getIt.registerLazySingleton<RoleFunctionRepository>(() => RoleFunctionRepositoryImpl(roleFunctionDatasource: getIt<RoleFunctionDatasource>()));
  getIt.registerLazySingleton<RoleRepository>(() => RoleRepositoryImpl(roleDatasource: getIt<RoleDatasource>()));
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userDatasource: getIt<UserDatasource>()));

  //UseCases
  getIt.registerLazySingleton(() => InsertAuthUsecase(authRepository: getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => IsLoggedInUsecase(authRepository: getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => LoginUseCase(authRepository: getIt<AuthRepository>()));

  getIt.registerLazySingleton(() => GetUsersUseCase(userRepository: getIt<UserRepository>()));

  getIt.registerLazySingleton(() => GetRoleCategoriesUseCase(roleCategoryRepository: getIt<RoleCategoryRepository>()));
  getIt.registerLazySingleton(() => GetRoleFunctionsUseCase(roleFunctionRepository: getIt<RoleFunctionRepository>()));
  getIt.registerLazySingleton(() => GetRolesUseCase(roleRepository: getIt<RoleRepository>()));

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
  getIt.registerLazySingleton(() => RolesViewCubit(
    getRolesUseCase: getIt<GetRolesUseCase>(),
    getRoleFunctionsUseCase : getIt<GetRoleFunctionsUseCase>(),
    getRoleCategoriesUseCase: getIt<GetRoleCategoriesUseCase>()
  ));
  getIt.registerLazySingleton(() => UsersViewCubit(getUsersUseCase: getIt<GetUsersUseCase>()));
}