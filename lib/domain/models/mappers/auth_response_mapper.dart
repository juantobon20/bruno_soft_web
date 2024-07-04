import '../../../data/data.dart';
import '../auth_data.dart';

extension MapperAuth on AuthResponse {

  AuthData mapper() => AuthData(
    token: token, 
    tokenExpiration: tokenExpiration, 
    user: user.mapper()
  );
}

extension MapperUserAuth on UserAuthResponse {

  UserAuthData mapper() => UserAuthData(
    id: id, 
    roleId: roleId, 
    firstName: firstName, 
    lastName: lastName, 
    state: state
  );
}