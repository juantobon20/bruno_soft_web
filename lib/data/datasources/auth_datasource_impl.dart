import '../../domain/domain.dart';
import '../data.dart';

class AuthDatasourceImpl extends AuthDatasource {

  final DioProvider _dioProvider;

  AuthDatasourceImpl({required DioProvider dioProvider}) : _dioProvider = dioProvider;
  
  @override
  Future<AuthResponse> login({required AuthRequest authRequest}) async {
    final dataRequest = authRequest.toJson();
    final loginResponse = await _dioProvider.post("Auth/Login", dataRequest);

    return AuthResponse.fromJson(loginResponse);
  }

  @override
  Future insert({required AuthResponse authResponse}) async {
    
  }
}