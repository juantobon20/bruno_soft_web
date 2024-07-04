import '../../data/data.dart';
import '../domain.dart';

abstract class AuthRepository {

  Future<AuthResponse> login({ required AuthRequest authRequest });
  
  Future<void> insert({required AuthData authData});

  Future<bool> isLoggedIn();
}