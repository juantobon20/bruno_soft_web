import 'user_response.dart';

class AuthResponse {
    String token;
    DateTime tokenExpiration;
    UserResponse user;

    AuthResponse({
        required this.token,
        required this.tokenExpiration,
        required this.user,
    });

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        token: json["token"],
        tokenExpiration: DateTime.parse(json["tokenExpiration"]),
        user: UserResponse.fromJson(json["user"]),
    );
}