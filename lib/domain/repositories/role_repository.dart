import '../../data/data.dart';

abstract class RoleRepository {

  Future<List<RoleResponse>> getRoles();
}