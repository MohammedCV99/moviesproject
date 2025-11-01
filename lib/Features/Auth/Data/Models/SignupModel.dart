class RegisterRequestModel {
  final String email;
  final String password;
  final String confirmPassword;

  final String name;
  final String phone;
  final int avaterId;

  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.name,
    required this.phone,
    required this.avaterId,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'name': name,
      'phone': phone,
      'avaterId': avaterId,
    };
  }
}
