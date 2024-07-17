import '../../domain/domain.dart';
import '../data.dart';

class RoleFunctionRepositoryImpl implements RoleFunctionRepository {

  final RoleFunctionDatasource _roleDatasource;

  RoleFunctionRepositoryImpl({
    required RoleFunctionDatasource roleFunctionDatasource
  }) : _roleDatasource = roleFunctionDatasource;
  
  @override
  Future<List<RoleFunctionResponse>> getRoleFunctions() async => await _roleDatasource.getRoleFunctions();
}