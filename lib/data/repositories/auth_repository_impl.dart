import '../../domain/domain.dart';
import '../data.dart';

class AuthRepositoryImpl extends AuthRepository {
  
  final AuthDatasource authDatasource;

  AuthRepositoryImpl({required this.authDatasource});
  
  @override
  Future login({required AuthRequest authRequest}) async {
    final response = await authDatasource.login(authRequest: authRequest);
    print(response);
  }

}