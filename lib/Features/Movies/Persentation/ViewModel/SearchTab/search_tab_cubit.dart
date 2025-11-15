

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/Movies/Data/Models/MoviesModel.dart';
import 'package:movies/Features/search/data/data_sources/search_movies_api.dart';
import 'package:movies/Features/search/persentation/view_model/search_tab_states.dart';

class SearchTabCubit extends Cubit<SearchTabState>{

  SearchTabCubit(this.searchMoviesApi):super(SearchTabInitState());
final SearchMoviesApi searchMoviesApi;

Future<void> searchMovie(String movieName) async {
    try {
      final List<Movie> response = await searchMoviesApi.searchMovies(movieName);

      
      
    }
    }
}