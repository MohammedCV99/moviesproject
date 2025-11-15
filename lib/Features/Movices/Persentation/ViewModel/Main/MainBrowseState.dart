// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movies/Features/Movices/Data/Models/MoviesDetailsModel.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';

abstract class MainMoviesState {}

class MainMoviesInitState extends MainMoviesState {}

class MainMoviesLoadingState extends MainMoviesState {}

class MainMoviesSuccessState extends MainMoviesState {
  final List<Movie> sources;
  MainMoviesSuccessState({required this.sources});
}

class MainMoviesErrorstate extends MainMoviesState {
  final String Error;
  MainMoviesErrorstate({required this.Error});
}

class DetialsInitState extends MainMoviesState {}

class DetialsLoadingState extends MainMoviesState {}

class DetialsSuccessState extends MainMoviesState {
  final MovieDetials detials;
  DetialsSuccessState({required this.detials});
}

class DetialsErrorstate extends MainMoviesState {
  final String Error;
  DetialsErrorstate({required this.Error});
}

class RelesedMoviesInitState extends MainMoviesState {}

class RelesedMoviesLoadingState extends MainMoviesState {}

class RelesedMoviesSuccessState extends MainMoviesState {
  List<Movie> releasedMovies;
  List<Movie> RecommededMovies;
  RelesedMoviesSuccessState({
    required this.releasedMovies,
    required this.RecommededMovies,
  });
}

class RelesedMoviesErrorstate extends MainMoviesState {
  final String Error;
  RelesedMoviesErrorstate({required this.Error});
}
