class LoginRequestModel {
  final String message;
  final String data;

  LoginRequestModel({required this.message, required this.data});

  Map<String, dynamic> toJson() {
    return {'message': message, 'data': data};
  }

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        message: json['message'] as String? ?? "",
        data: json['data'] as String? ?? "",
      );
}
