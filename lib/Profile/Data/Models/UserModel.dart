class ProfileResponse {
  final String message;
  final ProfileData data;

  ProfileResponse({required this.message, required this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      message: json['message'] as String? ?? 'Success',
      data: ProfileData.fromJson(json['data'] as Map<String, dynamic>? ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'data': data.toJson()};
  }

  @override
  String toString() {
    return 'ProfileResponse(message: $message, data: $data)';
  }
}

class ProfileData {
  final String id;
  final String email;
  final String password;
  final String name;
  final String phone;
  final int avaterId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ProfileData({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.avaterId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['_id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      avaterId: json['avaterId'] as int? ?? 0,
      createdAt: _parseDateTime(json['createdAt'] as String?) ?? DateTime.now(),
      updatedAt: _parseDateTime(json['updatedAt'] as String?) ?? DateTime.now(),
      v: json['__v'] as int? ?? 0,
    );
  }

  static DateTime? _parseDateTime(String? dateString) {
    if (dateString == null) return null;
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'avaterId': avaterId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }

  @override
  String toString() {
    return 'ProfileData(id: $id, name: $name, email: $email, phone: $phone, avaterId: $avaterId)';
  }
}
