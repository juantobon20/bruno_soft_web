import '../../data/data.dart';

abstract class RoleCategoryRepository {

  Future<List<RoleCategoryResponse>> getRoleCategories();
}