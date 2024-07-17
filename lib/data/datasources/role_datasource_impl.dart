import '../../domain/domain.dart';
import '../data.dart';

class RoleDatasourceImpl implements RoleDatasource {

  final DioProvider _dioProvider;

  RoleDatasourceImpl({
    required DioProvider dioProvider
  }) : _dioProvider = dioProvider;

  @override
  Future<List<RoleResponse>> getRoles() async {
    final List<dynamic> roleResponse = await _dioProvider.get('Role');
    return roleResponse.map((role) => RoleResponse.fromJson(role)).toList();
  }
}