

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/SearchTab/search_tab_state.dart';

class SearchTabCubit extends Cubit<SearchTabState>{

  SearchTabCubit(this.searchMoviesApi):super(SearchTabInitState());
final  searchMoviesApi;

Future<void> searchMovie(String movieName) async {
    try {
      final List<Movie> response = await searchMoviesApi.searchMovies(movieName);

      
      
    }
    }
}