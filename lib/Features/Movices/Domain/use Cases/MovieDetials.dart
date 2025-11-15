import 'package:movies/Features/Movices/Data/Models/MoviesDetailsModel.dart';
import 'package:movies/Features/Movices/Domain/Repository/MoviesRepository.dart';

class GetMovieDetials {
  final MoviesRepository _MoviesRepository;

  GetMovieDetials({required MoviesRepository MoviesRepository})
    : _MoviesRepository = MoviesRepository;

  Future<MovieDetials> call(int MovieID) async {
    return await _MoviesRepository.GetMovieDetials(MovieID);
  }
}
