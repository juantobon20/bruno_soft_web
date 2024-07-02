import 'package:bruno_soft_web/presentation/login/cubit/login_screen_bloc.dart';
import 'package:get_it/get_it.dart';

import '../data/data.dart';
import '../domain/domain.dart';

final getIt = GetIt.asNewInstance();

void setupLocator() {
  //Network
  getIt.registerLazySingleton(() => DioProvider());

  //Datasources
  getIt.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl(dioProvider: getIt<DioProvider>()));

  //Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authDatasource: getIt<AuthDatasource>()));

  //UseCases
  getIt.registerLazySingleton(() => LoginUseCase(authRepository: getIt<AuthRepository>()));

  //Validators
  getIt.registerLazySingleton(() => ValidationRouter());

  //Blocs
  getIt.registerLazySingleton(() => 
    LoginScreenBloc(
      validationRouter: getIt<ValidationRouter>(),
      loginUseCase: getIt<LoginUseCase>()
    )
  );
}