import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movies/Core/Assets/BodyAssets.dart';
import 'package:movies/Core/Assets/networkAssets.dart';
import 'package:movies/Profile/Data/Data_Sources/ProfileDataSources.dart';
import 'package:movies/Profile/Data/Models/UserModel.dart';

class Profileapi extends Profiledatasources {
  @override
  Future<void> DeleteProfile(String token) async {
    Dio dio = Dio();
    try {
      final response = await dio.delete(
        AppNetwork.DeleteProfile,
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

  @override
  Future<ProfileResponse> GetProfile(String token) async {
    Dio dio = Dio();
    try {
      final response = await dio.get(
        AppNetwork.GetProfile,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      print("response ############## ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.data);
      } else {
        throw Exception('Failed with status: ${response.data}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.response}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<ProfileResponse> UpdateProfile(
    String token,
    String email,
    int avaterId,
  ) async {
    Dio dio = Dio();
    try {
      final response = await dio.post(
        AppNetwork.updateProfile,
        data: AppNetworkBody.updateProfile(email, avaterId),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      print("response ############## ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.data);
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
