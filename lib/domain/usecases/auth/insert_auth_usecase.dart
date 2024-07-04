import '../../../data/data.dart';
import '../../domain.dart';

class InsertAuthUsecase {

  final AuthRepository _authRepository;

  InsertAuthUsecase({required AuthRepository authRepository}) : _authRepository = authRepository;

  Future insert({
    required AuthResponse authResponse
  }) async {
    
  }
}