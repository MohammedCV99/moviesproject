import 'package:movies/Features/Movices/Data/Models/MoviesDetailsModel.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';

abstract class BrowseTabState {}

class BrowseTabInitState extends BrowseTabState {}

class BrowseTabLoadingState extends BrowseTabState {}

class BrowseTabSuccessState extends BrowseTabState {
  final List<Movie> sources;
  BrowseTabSuccessState({required this.sources});
}

class BrowseTabErrorstate extends BrowseTabState {
  final String Error;
  BrowseTabErrorstate({required this.Error});
}

class DetialsInitState extends BrowseTabState {}

class DetialsLoadingState extends BrowseTabState {}

class DetialsSuccessState extends BrowseTabState {
  final MovieDetials detials;
  DetialsSuccessState({required this.detials});
}

class DetialsErrorstate extends BrowseTabState {
  final String Error;
  DetialsErrorstate({required this.Error});
}
