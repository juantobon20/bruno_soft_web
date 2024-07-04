import '../../domain.dart';

class InsertAuthUsecase {

  final AuthRepository _authRepository;

  InsertAuthUsecase({required AuthRepository authRepository}) : _authRepository = authRepository;

  Future insert({
    required AuthData authData
  }) async {
    await _authRepository.insert(authData: authData);
  }
}