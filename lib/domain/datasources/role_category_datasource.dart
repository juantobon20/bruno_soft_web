import '../../data/data.dart';

abstract class RoleCategoryDatasource {

  Future<List<RoleCategoryResponse>> getRoleCategories();

}