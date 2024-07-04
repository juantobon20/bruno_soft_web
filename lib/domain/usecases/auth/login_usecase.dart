import '../../../data/data.dart';
import '../../domain.dart';

class LoginUseCase {

  final AuthRepository _authRepository;

  LoginUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  Future<AuthData> login({
    required String userName,
    required String password
  }) async {
    final AuthRequest request = AuthRequest(userName: userName, password: password);

    final response = await _authRepository.login(authRequest: request);
    return response.mapper();
  }
}