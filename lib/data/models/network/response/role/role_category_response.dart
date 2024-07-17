class RoleCategoryResponse {
    final int id;
    final String name;
    final bool state;

    RoleCategoryResponse({
        required this.id,
        required this.name,
        required this.state
    });

    factory RoleCategoryResponse.fromJson(Map<String, dynamic> json) => RoleCategoryResponse(
        id: json["id"],
        name: json["name"],
        state: json["state"]
    );
}