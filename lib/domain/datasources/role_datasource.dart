import '../../data/data.dart';

abstract class RoleDatasource {

  Future<List<RoleResponse>> getRoles();

}