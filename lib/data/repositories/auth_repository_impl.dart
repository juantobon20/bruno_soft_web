import '../../domain/domain.dart';
import '../data.dart';

class AuthRepositoryImpl implements AuthRepository {
  
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl({required authDatasource}) : _authDatasource = authDatasource;
  
  @override
  Future<AuthResponse> login({required AuthRequest authRequest}) async {
    return await _authDatasource.login(authRequest: authRequest);
  }
  
  @override
  Future<void> insert({required AuthData authData}) async {
    await _authDatasource.insert(authData: authData);
  }
  
  @override
  Future<bool> isLoggedIn() async {
    return await _authDatasource.isLoggedIn();
  }
}