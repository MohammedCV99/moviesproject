import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';

abstract class SearchTabState {}

class SearchTabInitState extends SearchTabState {}

class SearchTabLoadingState extends SearchTabState {}

class SearchTabSuccessState extends SearchTabState {
  final List<Movie> sources;
  SearchTabSuccessState({required this.sources});
}

class SearchTabErrorState extends SearchTabState {
  final String error;
  SearchTabErrorState({required this.error});
}

class SearchTabEmptyState extends SearchTabState {
  final String message;
  SearchTabEmptyState({required this.message});
}
