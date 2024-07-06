import '../../domain/domain.dart';
import '../data.dart';

class UserDatasourceImpl implements UserDatasource {

  final DioProvider _dioProvider;

  UserDatasourceImpl({
    required DioProvider dioProvider
  }) : _dioProvider = dioProvider;

  @override
  Future<List<UserResponse>> getUsers() async {
    final List<dynamic> userResponse = await _dioProvider.get('User');
    return userResponse.map((user) => UserResponse.fromJson(user)).toList();
  }
}