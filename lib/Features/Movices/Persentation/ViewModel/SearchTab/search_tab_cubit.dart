

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/Movices/Data/Data_Sources/search_data_sources/search_movies_api.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/SearchTab/search_tab_state.dart';

class SearchTabCubit extends Cubit<SearchTabState>{

  SearchTabCubit(this.searchMoviesApi):super(SearchTabInitState());
final  SearchMoviesApi searchMoviesApi;

Future<void> searchMovie(String movieName) async {
  emit(SearchTabLoadingState());
    try {
      final List<Movie> response = await searchMoviesApi.searchMovies(movieName);
      if (response.isEmpty){
        emit(SearchTabEmptyState(message: movieName));
      }else {
        emit(SearchTabSuccessState(sources: response));
      }

    
      
    } catch(e){
      emit(SearchTabErrorState(error: e.toString()));
    }
    }
}