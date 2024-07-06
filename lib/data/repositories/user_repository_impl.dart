import '../../domain/domain.dart';
import '../data.dart';

class UserRepositoryImpl implements UserRepository {

  final UserDatasource _userDatasource;

  UserRepositoryImpl({
    required UserDatasource userDatasource
  }) : _userDatasource = userDatasource;

  @override
  Future<List<UserResponse>> getUsers() async => _userDatasource.getUsers();
}