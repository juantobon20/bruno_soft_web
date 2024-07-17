import '../../domain/domain.dart';
import '../data.dart';

class RoleCategoryDatasourceImpl implements RoleCategoryDatasource {

  final DioProvider _dioProvider;

  RoleCategoryDatasourceImpl({
    required DioProvider dioProvider
  }) : _dioProvider = dioProvider;

  @override
  Future<List<RoleCategoryResponse>> getRoleCategories() async {
    final List<dynamic> roleCategoryResponse = await _dioProvider.get('RoleCategory');
    return roleCategoryResponse.map((roleCategory) => RoleCategoryResponse.fromJson(roleCategory)).toList();
  }
}