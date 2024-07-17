import '../../domain/domain.dart';
import '../data.dart';

class RoleCategoryRepositoryImpl implements RoleCategoryRepository {

  final RoleCategoryDatasource _roleCategoryDatasource;

  RoleCategoryRepositoryImpl({
    required RoleCategoryDatasource roleCategoryDatasource
  }) : _roleCategoryDatasource = roleCategoryDatasource;

  @override
  Future<List<RoleCategoryResponse>> getRoleCategories() async => await _roleCategoryDatasource.getRoleCategories();

}