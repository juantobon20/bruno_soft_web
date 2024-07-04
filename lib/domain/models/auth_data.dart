class AuthData {
    String token;
    DateTime tokenExpiration;
    UserAuthData user;

    AuthData({
        required this.token,
        required this.tokenExpiration,
        required this.user,
    });
}

class UserAuthData {
    int id;
    int roleId;
    String firstName;
    String lastName;
    bool state;

    UserAuthData({
      required this.id,
      required this.roleId,
      required this.firstName,
      required this.lastName,
      required this.state
    });

    Map<String, dynamic> toJson() => {
        "id": id,
        "roleId": roleId,
        "firstName": firstName,
        "lastName": lastName,
        "state": state,
    };
}