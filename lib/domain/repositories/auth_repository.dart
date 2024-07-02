import '../../data/data.dart';

abstract class AuthRepository {

  Future login({ required AuthRequest authRequest });
}