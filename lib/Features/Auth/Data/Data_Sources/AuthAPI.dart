import 'package:dio/dio.dart';
import 'package:movies/Core/Assets/BodyAssets.dart';
import 'package:movies/Core/Assets/networkAssets.dart';
import 'package:movies/Features/Auth/Data/Data_Sources/AuthDataSource.dart';
import 'package:movies/Features/Auth/Data/Models/LoginModel.dart';
import 'package:movies/Features/Auth/Data/Models/SignupModel.dart';

class Authapi extends AuthDataSource {
  Future<LoginRequestModel> Login(String Email, String password) async {
    Dio dio = Dio();
    try {
      final response = await dio.post(
        AppNetwork.login,
        data: AppNetworkBody.AuthLogin(Email, password),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginRequestModel.fromJson(response.data);
      } else {
        throw Exception('Failed with status: ${response.data}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.response}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<Signupmodel> Signup(
    String Name,
    String email,
    String password,
    String ConfrimPassword,
    String Phone,
    int AvaterID,
  ) async {
    Dio dio = Dio();
    try {
      final response = await dio.post(
        AppNetwork.Signup,
        data: {
          "name": Name,
          "email": email,
          "password": password,
          "confirmPassword": ConfrimPassword,
          "phone": Phone,
          "avaterId": AvaterID,
        },
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      print(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Signupmodel.fromJson(response.data);
      } else {
        throw Exception('Failed with status: ${response.data}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.response}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<void> ResetPassword(
    String OldPassword,
    String NewPassword,
    String token,
  ) async {
    Dio dio = Dio();
    try {
      final response = await dio.patch(
        AppNetwork.resetpassword,
        data: AppNetworkBody.ResetPassword(OldPassword, NewPassword),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      print("response ############## ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response);
      } else {
        throw Exception('Failed with status: ${response.data}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.response}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
