import '../../domain.dart';

class GetUsersUseCase {

  final UserRepository _userRepository;

  GetUsersUseCase({
    required UserRepository userRepository
  }) : _userRepository = userRepository;

  Future<List<UserData>> getUsers() async {
    final responseUsers = await _userRepository.getUsers();
    return responseUsers.map((user) => user.mapper()).toList();
  }
}