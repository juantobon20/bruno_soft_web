class AuthRequest {
  String userName;
  String password;

  AuthRequest({
    required this.userName,
    required this.password
  });

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password
    };
}