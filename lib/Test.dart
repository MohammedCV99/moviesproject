/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/ServiceLocater/Movies/BrowseServiceLocater.dart';
import 'package:movies/Features/Categories/CatogiresData.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Persentation/View/Browse/Widgets/CategorySelector.dart';
import 'package:movies/Features/Movices/Persentation/View/Browse/Widgets/buildMovieList.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/BrowseTab/BrowseTabCubit.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/BrowseTab/BrowseTabState.dart';

class MoviesBrowse extends StatefulWidget {
  const MoviesBrowse({super.key});

  @override
  State<MoviesBrowse> createState() => _MoviesBrowseState();
}

class _MoviesBrowseState extends State<MoviesBrowse> {
  int selectedCategoryId = 0;
  List<Movie> Data = [];

  late BrowseTabCubit movieCubit;

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
    return BlocProvider(
      create:
          (context) =>
              BrowseServicelocater.moviecubit..getMoviesByCategorieUsecase(
                CategoriesList[selectedCategoryId].Name,
              ),
      value: movieCubit,
      child: BlocBuilder<BrowseTabCubit, BrowseTabState>(
        buildWhen:
            (previous, current) =>
                current is BrowseTabSuccessState ||
                current is BrowseTabInitState ||
                current is BrowseTabErrorstate ||
                current is BrowseTabLoadingState,
        builder: (context, state) {
          if (state is BrowseTabLoadingState) {
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
                            .read<BrowseTabCubit>()
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
          } else if (state is BrowseTabSuccessState) {
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
                            .read<BrowseTabCubit>()
                            .getMoviesByCategorieUsecaseMethod(cat.Name);
                      },
                      cat: CategoriesList,
                      SelectedCat: CategoriesList[selectedCategoryId],
                    ),
                    const SizedBox(height: 20),

                    buildMoviesList(state.sources, state.sources.length),
                  ],
                ),
              ),
            );
          } else if (state is BrowseTabErrorstate) {
            return const Center(child: Text('An error occurred.'));
          } else {
            // ✅ Add this final return to handle MovieInitState or others
            return const Center(child: Text('Loading movies...'));
          }
        },
      ),
    );
  }
}
*/
