import 'package:dio/dio.dart';
import 'package:movies/Core/Assets/networkAssets.dart';
import 'package:movies/Features/Movices/Data/Data_Sources/MoviesDataSource.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesDetailsModel.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';

class Moviesapi extends Moviesdatasource {
  @override
  Future<Moviesmodel> GetMoviesByCategory(String genere) async {
    Dio dio = Dio();
    try {
      final response = await dio.get(AppNetwork.MoviesByCategory(genere));

      if (response.statusCode == 200) {
        // ✅ unwrap 'data' from the response
        return Moviesmodel.fromJson(response.data);
      } else {
        throw Exception('Failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<Moviesmodel> GetMoviesBySugestion(int MovieID) async {
    // TODO: implement GetMoviesBySugestion
    Dio dio = Dio();
    try {
      final response = await dio.get(AppNetwork.MovieSuggestions(MovieID));
      if (response.statusCode == 200) {
        // ✅ unwrap 'data' from the response
        return Moviesmodel.fromJson(response.data);
      } else {
        throw Exception('Failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<MovieDetaialsResponse> GetMovieDetials(int MovieID) async {
    // TODO: implement GetMoviesBySugestion
    Dio dio = Dio();
    try {
      final response = await dio.get(AppNetwork.MovieDetails(MovieID));
      if (response.statusCode == 200) {
        // ✅ unwrap 'data' from the response
        return MovieDetaialsResponse.fromJson(response.data);
      } else {
        throw Exception('Failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<Moviesmodel> GetRelesedMovies() async {
    // TODO: implement GetRelesedMovies
    Dio dio = Dio();
    try {
      final response = await dio.get(AppNetwork.ListNewMoviesByYear);
      if (response.statusCode == 200) {
        return Moviesmodel.fromJson(response.data);
      } else {
        throw Exception('Failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
