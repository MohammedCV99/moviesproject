class Signupmodel {
  final String message;
  final UserData data;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Signupmodel({
    required this.message,
    required this.data,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Signupmodel.fromJson(Map<String, dynamic> json) {
    return Signupmodel(
      message: json['message'] as String? ?? 'Success',
      data: UserData.fromJson(json['data'] as Map<String, dynamic>? ?? {}),
      createdAt: DateTime.parse(
        json['createdAt'] as String? ?? DateTime.now().toIso8601String(),
      ),
      updatedAt: DateTime.parse(
        json['updatedAt'] as String? ?? DateTime.now().toIso8601String(),
      ),
      v: json['__v'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class UserData {
  final String email;
  final String password;
  final String name;
  final String phone;
  final int avaterId;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  UserData({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.avaterId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      avaterId: json['avaterId'] as int? ?? 1,
      id: json['_id'] as String? ?? '',
      createdAt: DateTime.parse(
        json['createdAt'] as String? ?? DateTime.now().toIso8601String(),
      ),
      updatedAt: DateTime.parse(
        json['updatedAt'] as String? ?? DateTime.now().toIso8601String(),
      ),
      v: json['__v'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'avaterId': avaterId,
      '_id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
