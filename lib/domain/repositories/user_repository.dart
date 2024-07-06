import '../../data/data.dart';

abstract class UserRepository {

  Future<List<UserResponse>> getUsers();
}