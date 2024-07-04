import '../../data/data.dart';
import '../domain.dart';

abstract class AuthDatasource {
  
  Future<AuthResponse> login({ required AuthRequest authRequest });

  Future insert({required AuthData authData});
}