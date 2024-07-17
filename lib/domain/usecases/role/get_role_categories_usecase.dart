import '../../domain.dart';

class GetRoleCategoriesUseCase {

  final RoleCategoryRepository _roleCategoryRepository;

  GetRoleCategoriesUseCase({
    required RoleCategoryRepository roleCategoryRepository
  }) : _roleCategoryRepository = roleCategoryRepository;

  Future<List<RoleCategoryData>> get() async {
    final response = await _roleCategoryRepository.getRoleCategories();
    return response.map((role) => role.mapper()).toList();
  }
}