import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Domain/user%20Cases/GetMoviesBySuggestions.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/SuggestionTab/SuggestionTabState.dart';

class SuggestionTabCubit extends Cubit<SuggestionTabState> {
  final GetMoviesBySuggestionUsecase getMoviesBySuggestionUsecase;

  SuggestionTabCubit(this.getMoviesBySuggestionUsecase)
    : super(SuggestionTabInitState()) {}
  List<Movie> repsonse = [];
  Future<void> GetMoviesBySuggestionUsecases(int MovieID) async {
    try {
      emit(SuggestionTabLoadingState());
      repsonse = await getMoviesBySuggestionUsecase(MovieID);
      emit(SuggestionTabSuccessState(sources: repsonse));
    } catch (e) {
      emit(SuggestionTabErrorstate(Error: e.toString()));
    }
  }
}
