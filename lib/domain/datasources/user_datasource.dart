import '../../data/data.dart';

abstract class UserDatasource {

  Future<List<UserResponse>> getUsers();
}