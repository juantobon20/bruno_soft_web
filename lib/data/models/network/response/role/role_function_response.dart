class RoleFunctionResponse {
    final int id;
    final int roleCategoryId;
    final String roleCategoryName;
    final String code;
    final String description;

    RoleFunctionResponse({
        required this.id,
        required this.roleCategoryId,
        required this.roleCategoryName,
        required this.code,
        required this.description,
    });

    factory RoleFunctionResponse.fromJson(Map<String, dynamic> json) => RoleFunctionResponse(
        id: json["id"],
        roleCategoryId: json["roleCategoryId"],
        roleCategoryName: json["roleCategoryName"],
        code: json["code"],
        description: json["description"],
    );
}