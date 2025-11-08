import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';

abstract class SuggestionTabState {}

class SuggestionTabInitState extends SuggestionTabState {}

class SuggestionTabLoadingState extends SuggestionTabState {}

class SuggestionTabSuccessState extends SuggestionTabState {
  final List<Movie> sources;
  SuggestionTabSuccessState({required this.sources});
}

class SuggestionTabErrorstate extends SuggestionTabState {
  final String Error;
  SuggestionTabErrorstate({required this.Error});
}
