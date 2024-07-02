class UserResponse {
    int id;
    int roleId;
    int neighborhoodId;
    String identification;
    String firstName;
    String lastName;
    String phone;
    String email;
    bool state;

    UserResponse({
      required this.id,
      required this.roleId,
      required this.neighborhoodId,
      required this.identification,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      required this.state
    });

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        id: json["id"],
        roleId: json["roleId"],
        neighborhoodId: json["neighborhoodId"],
        identification: json["identification"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        email: json["email"],
        state: json["state"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "roleId": roleId,
        "neighborhoodId": neighborhoodId,
        "identification": identification,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "state": state
    };
}