class RoleResponse {
    final int id;
    final String name;
    final bool state;

    RoleResponse({
        required this.id,
        required this.name,
        this.state = false,
    });

    factory RoleResponse.fromJson(Map<String, dynamic> json) => RoleResponse(
        id: json["id"],
        name: json["name"],
        //roleFunctionAssignments: List<dynamic>.from(json["roleFunctionAssignments"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        //"roleFunctionAssignments": List<dynamic>.from(roleFunctionAssignments.map((x) => x)),
    };
}