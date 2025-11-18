import 'package:dio/dio.dart';
import 'package:movies/Core/Assets/networkAssets.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';

class SearchMoviesApi {
final Dio dio;

SearchMoviesApi():dio=Dio();


Future<List<Movie>> searchMovies(String movieName) async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: AppNetwork.MoviesURL
      )
    );
    try {
      final response = await dio.get(AppNetwork.MovieSearch(movieName));
      if (response.statusCode == 200 ||response.statusCode==201 ) {
      final newResponse= Moviesmodel.fromJson(response.data);
        return newResponse.data.movies;
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

