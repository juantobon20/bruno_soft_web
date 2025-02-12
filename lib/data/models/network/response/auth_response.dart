class AuthResponse {
    final String token;
    final DateTime tokenExpiration;
    final UserAuthResponse user;

    AuthResponse({
        required this.token,
        required this.tokenExpiration,
        required this.user,
    });

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        token: json["token"],
        tokenExpiration: DateTime.parse(json["tokenExpiration"]),
        user: UserAuthResponse.fromJson(json["user"]),
    );
}

class UserAuthResponse {
    final int id;
    final int roleId;
    final String firstName;
    final String lastName;
    final bool state;

    UserAuthResponse({
      required this.id,
      required this.roleId,
      required this.firstName,
      required this.lastName,
      required this.state
    });

    factory UserAuthResponse.fromJson(Map<String, dynamic> json) => UserAuthResponse(
        id: json["id"],
        roleId: json["roleId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        state: json["state"]
    );
}