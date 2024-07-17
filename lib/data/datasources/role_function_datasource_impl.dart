import '../../domain/domain.dart';
import '../data.dart';

class RoleFunctionDatasourceImpl implements  RoleFunctionDatasource {

  final DioProvider _dioProvider;

  RoleFunctionDatasourceImpl({
    required DioProvider dioProvider
  }) : _dioProvider = dioProvider;
  
  @override
  Future<List<RoleFunctionResponse>> getRoleFunctions() async {
    final List<dynamic> roleFunctionsResponse = await _dioProvider.get('RoleFunction');
    return roleFunctionsResponse.map((roleFunction) => RoleFunctionResponse.fromJson(roleFunction)).toList();
  } 
}