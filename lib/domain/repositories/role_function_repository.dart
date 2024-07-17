import '../../data/data.dart';

abstract class RoleFunctionRepository {

  Future<List<RoleFunctionResponse>> getRoleFunctions();
}