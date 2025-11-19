import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Domain/Repository/MoviesRepository.dart';

class GetMoviesBySuggestionUsecase {
  final MoviesRepository _MoviesRepository;

  GetMoviesBySuggestionUsecase({required MoviesRepository MoviesRepository})
    : _MoviesRepository = MoviesRepository;

  Future<List<Movie>> call(int MovieID) async {
    return await _MoviesRepository.GetMoviesBySuggestion(MovieID);
  }
}
