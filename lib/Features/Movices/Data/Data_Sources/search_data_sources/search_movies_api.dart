import 'package:dio/dio.dart';
import 'package:movies/Core/Assets/networkAssets.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';

class SearchMoviesApi {
final Dio dio;

SearchMoviesApi():dio=Dio();


Future<Moviesmodel> searchMovies(String movieName) async {
    Dio dio = Dio();
    try {
      final response = await dio.get(AppNetwork.MovieSearch(movieName));
      if (response.statusCode == 200 ||response.statusCode==201 ) {
        
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