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
import 'package:movies/Features/Movices/Domain/user%20Cases/GetMovieByCategory.dart';
import 'package:movies/Features/Movices/Domain/user%20Cases/MovieDetials.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/BrowseTab/BrowseTabCubit.dart';

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
  static BrowseTabCubit moviecubit = BrowseTabCubit(
    moviesByCategorieUsecase,
    moviesDetialsUsecase,
  );
}
