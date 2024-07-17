import '../../data/data.dart';

abstract class RoleFunctionDatasource {

  Future<List<RoleFunctionResponse>> getRoleFunctions();

}