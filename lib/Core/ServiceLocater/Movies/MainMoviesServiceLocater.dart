// class ServiceLocator {
//   static ArticlesDataSource articlesDataSource = ApisDataSource();
//   static ArticlesRepository articlesRepository = ArticlesRepository(
//     articlesDataSource: articlesDataSource,
//   );
//   // static ArticlesProvider articlesProvider = ArticlesProvider(
//   //   articlesRepository: articlesRepository,
//   // );
//   static ArticlesCubit articlesCubit = ArticlesCubit(articlesRepository);
// }
import 'package:movies/Features/Movices/Data/Data_Sources/MoviesAPI.dart';
import 'package:movies/Features/Movices/Data/Data_Sources/MoviesDataSource.dart';
import 'package:movies/Features/Movices/Data/Repository_impl/RepositoryImp.dart';
import 'package:movies/Features/Movices/Domain/Repository/MoviesRepository.dart';
import 'package:movies/Features/Movices/Domain/use%20Cases/GetMovieByCategory.dart';
import 'package:movies/Features/Movices/Domain/use%20Cases/GetRelesedMovies.dart';
import 'package:movies/Features/Movices/Domain/use%20Cases/MovieDetials.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/Main/MainBrowseCubit.dart';

class BrowseServicelocater {
  static Moviesdatasource moviesdatasource = Moviesapi();
  static MoviesRepository moviesRepository = MoviesRepositoryImp(
    MovieDataSource: moviesdatasource,
  );
  static GetMoviesByCategorieUsecase moviesByCategorieUsecase =
      GetMoviesByCategorieUsecase(MoviesRepository: moviesRepository);
  static GetMovieDetials moviesDetialsUsecase = GetMovieDetials(
    MoviesRepository: moviesRepository,
  );
  static Getrelesedmovies getrelesedmovies = Getrelesedmovies(
    MoviesRepository: moviesRepository,
  );
  static MainMoviesCubit moviecubit = MainMoviesCubit(
    moviesByCategorieUsecase,
    moviesDetialsUsecase,
    getrelesedmovies,
  );
}
