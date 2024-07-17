import '../../domain.dart';

class GetRolesUseCase {

  final RoleRepository _roleRepository;

  GetRolesUseCase({
    required RoleRepository roleRepository
  }) : _roleRepository = roleRepository;

  Future<List<RoleData>> get() async {
    final response = await _roleRepository.getRoles();
    return response.map((role) => role.mapper()).toList();
  }
}