import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/Movices/Data/Data_Sources/MoviesAPI.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/SearchTab/SearchState.dart';

class SearchTabCubit extends Cubit<SearchTabState> {
  SearchTabCubit(this._searchMoviesApi) : super(SearchTabInitState());
  final Moviesapi _searchMoviesApi;

  TextEditingController searchController = TextEditingController();

  Future<void> searchMovie() async {
    emit(SearchTabLoadingState());
    try {
      final List<Movie> response = await _searchMoviesApi.searchMovies(
        searchController.text,
      );
      if (response.isEmpty) {
        emit(SearchTabEmptyState(message: searchController.text));
      } else {
        emit(SearchTabSuccessState(sources: response));
      }
    } catch (e) {
      emit(SearchTabErrorState(error: e.toString()));
    }
  }
}
