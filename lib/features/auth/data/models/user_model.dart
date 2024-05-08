class UserModel {

  UserModel({
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
    this.id,
    this.creationAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'] as String?,
        password: json['password'] as String?,
        name: json['name'] as String?,
        role: json['role'] as String?,
        avatar: json['avatar'] as String?,
        id: json['id'] as int?,
        creationAt: json['creationAt'] == null
            ? null
            : DateTime.parse(json['creationAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  int? id;
  DateTime? creationAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'name': name,
        'role': role,
        'avatar': avatar,
        'id': id,
        'creationAt': creationAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
