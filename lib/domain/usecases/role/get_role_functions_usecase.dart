import '../../domain.dart';

class GetRoleFunctionsUseCase {

  final RoleFunctionRepository _roleFunctionRepository;

  GetRoleFunctionsUseCase({
    required RoleFunctionRepository roleFunctionRepository
  }) : _roleFunctionRepository = roleFunctionRepository;

  Future<List<RoleFunctionData>> get() async {
    final response = await _roleFunctionRepository.getRoleFunctions();
    return response.map((role) => role.mapper()).toList();
  }
}