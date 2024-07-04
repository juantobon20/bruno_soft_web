import '../../domain.dart';

class IsLoggedInUsecase {

  final AuthRepository _authRepository;

  IsLoggedInUsecase({required AuthRepository authRepository}) : _authRepository = authRepository;

  Future<bool> isLoggedIn() async {
    return await _authRepository.isLoggedIn();
  }
}