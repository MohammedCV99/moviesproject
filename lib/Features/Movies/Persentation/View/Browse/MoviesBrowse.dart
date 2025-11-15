import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/ServiceLocater/Movies/MainMoviesServiceLocater.dart';
import 'package:movies/Features/Categories/CatogiresData.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Persentation/View/Browse/Widgets/CategorySelector.dart';
import 'package:movies/Features/Movices/Persentation/View/Browse/Widgets/buildMovieList.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/Main/MainBrowseCubit.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/Main/MainBrowseState.dart';

class MoviesBrowse extends StatefulWidget {
  const MoviesBrowse({super.key});

  @override
  State<MoviesBrowse> createState() => _MoviesBrowseState();
}

class _MoviesBrowseState extends State<MoviesBrowse> {
  int selectedCategoryId = 0;
  List<Movie> Data = [];

  late MainMoviesCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = BrowseServicelocater.moviecubit;
    movieCubit.getMoviesByCategorieUsecase(
      CategoriesList[selectedCategoryId].Name,
    );
    movieCubit.getMoviesByCategorieUsecaseMethod(
      CategoriesList[selectedCategoryId].Name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: movieCubit,
      child: BlocBuilder<MainMoviesCubit, MainMoviesState>(
        buildWhen:
            (previous, current) =>
                current is MainMoviesSuccessState ||
                current is MainMoviesInitState ||
                current is MainMoviesErrorstate ||
                current is MainMoviesLoadingState,
        builder: (context, state) {
          if (state is MainMoviesLoadingState) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Categoryselector(
                      selectedCategoryId: selectedCategoryId,
                      onChanged: (Categories cat) {
                        setState(() {
                          selectedCategoryId = cat.id;
                        });
                        print('Selected: ${cat.Name}');
                        context
                            .read<MainMoviesCubit>()
                            .getMoviesByCategorieUsecaseMethod(cat.Name);
                      },
                      cat: CategoriesList,
                      SelectedCat: CategoriesList[selectedCategoryId],
                    ),
                    SizedBox(height: 100),
                    Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            );
          } else if (state is MainMoviesSuccessState) {
            Data = state.sources;
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Categoryselector(
                      selectedCategoryId: selectedCategoryId,
                      onChanged: (Categories cat) {
                        setState(() {
                          selectedCategoryId = cat.id;
                        });
                        print('Selected: ${cat.Name}');
                        context
                            .read<MainMoviesCubit>()
                            .getMoviesByCategorieUsecaseMethod(cat.Name);
                      },
                      cat: CategoriesList,
                      SelectedCat: CategoriesList[selectedCategoryId],
                    ),
                    const SizedBox(height: 20),

                    buildMoviesList(
                      state: state.sources,
                      lenght: state.sources.length,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is MainMoviesErrorstate) {
            return const Center(child: Text('An error occurred.'));
          } else {
            return const Center(child: Text('Loading movies...'));
          }
        },
      ),
    );
  }
}
