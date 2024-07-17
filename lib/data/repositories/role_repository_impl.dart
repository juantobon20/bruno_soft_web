import '../../domain/domain.dart';
import '../data.dart';

class RoleRepositoryImpl implements RoleRepository {

  final RoleDatasource _roleDatasource;

  RoleRepositoryImpl({
    required RoleDatasource roleDatasource
  }) : _roleDatasource = roleDatasource;

  @override
  Future<List<RoleResponse>> getRoles() async => await _roleDatasource.getRoles();

}