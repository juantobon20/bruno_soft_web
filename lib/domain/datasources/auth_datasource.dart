import '../../data/data.dart';

abstract class AuthDatasource {
  
  Future<AuthResponse> login({ required AuthRequest authRequest });
}