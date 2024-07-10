import '../../data/data.dart';
import '../domain.dart';

abstract class AuthDatasource {
  
  Future<AuthResponse> login({ required AuthRequest authRequest });

  Future<void> logout();

  Future insert({required AuthData authData});

  Future<bool> isLoggedIn();
}