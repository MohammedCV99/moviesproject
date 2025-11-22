import 'package:movies/Features/Movices/Data/Models/MoviesDetailsModel.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Domain/Repository/MoviesRepository.dart';

class GetMoviesByCategorieUsecase {
  final MoviesRepository _MoviesRepository;

  GetMoviesByCategorieUsecase({required MoviesRepository MoviesRepository})
    : _MoviesRepository = MoviesRepository;

  Future<List<Movie>> call(String MovieType) async {
    return await _MoviesRepository.GetMoviesByCategories(MovieType);
  }

  Future<MovieDetials> MovieDetialsCall(int MovieID) async {
    return await _MoviesRepository.GetMovieDetials(MovieID);
  }
}
