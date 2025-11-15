import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Core/Assets/AppImages.dart';
import 'package:movies/Core/HelperElements/Navigator.dart' show routeNavigator;
import 'package:movies/Core/ServiceLocater/Movies/MainMoviesServiceLocater.dart';
import 'package:movies/Features/Categories/CatogiresData.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Persentation/View/Browse/Widgets/MovieDetials.dart';
import 'package:movies/Features/Movices/Persentation/View/MainWidget/RatingWidget.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/Main/MainBrowseCubit.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/Main/MainBrowseState.dart';

class Movieshome extends StatefulWidget {
  const Movieshome({super.key});

  @override
  State<Movieshome> createState() => _MovieshomeState();
}

class _MovieshomeState extends State<Movieshome> {
  List<String> testinglist = [
    Appimages.MoviesPoster4,
    Appimages.MoviesPoster5,
    Appimages.MoviesPoster6,
  ];
  int currentMovie = 0;
  int selectedCategoryId = 0;
  List<Movie> Data = [];
  String CategoryList = "";
  late MainMoviesCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = BrowseServicelocater.moviecubit;
    int randomvalue = Random().nextInt(24) + 1;
    CategoryList = CategoriesList[randomvalue].Name;
    print(CategoryList);
    movieCubit.GetrelesedmoviesUseCase(CategoryList);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: movieCubit,
      child: BlocBuilder<MainMoviesCubit, MainMoviesState>(
        buildWhen:
            (previous, current) =>
                current is RelesedMoviesInitState ||
                current is RelesedMoviesErrorstate ||
                current is RelesedMoviesLoadingState ||
                current is RelesedMoviesSuccessState ||
                current is MainMoviesLoadingState ||
                current is MainMoviesInitState ||
                current is MainMoviesSuccessState ||
                current is MainMoviesErrorstate,
        builder: (context, state) {
          if (state is RelesedMoviesSuccessState) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              state
                                  .releasedMovies[currentMovie]
                                  .largeCoverImage,
                              fit: BoxFit.fill,
                            ),
                          ),

                          Container(color: Colors.black.withOpacity(0.6)),
                          Positioned(
                            top: 20,
                            right: 60,
                            child: Center(
                              child: Image.asset(Appimages.AvailableNow),
                            ),
                          ),
                          Positioned.fill(
                            child: Column(
                              children: [
                                SizedBox(height: 60),
                                SizedBox(
                                  height: 400,
                                  child: PageView.builder(
                                    controller: PageController(
                                      viewportFraction: 0.6,
                                    ),

                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical:
                                              index == currentMovie ? 40.0 : 20,
                                          horizontal: 10,
                                        ),
                                        child: Transform.scale(
                                          scale:
                                              currentMovie == index ? 1 : 0.85,
                                          child: InkWell(
                                            onTap: () {
                                              context
                                                  .read<MainMoviesCubit>()
                                                  .getMovieDetial(
                                                    state
                                                        .releasedMovies[index]
                                                        .id,
                                                  )
                                                  .then((onValue) {
                                                    routeNavigator(
                                                      Moviedetials(
                                                        Data:
                                                            context
                                                                .read<
                                                                  MainMoviesCubit
                                                                >()
                                                                .DetialsResponse,
                                                      ),
                                                      context,
                                                    );
                                                  });
                                            },
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Image.network(
                                                    state
                                                        .releasedMovies[index]
                                                        .mediumCoverImage,
                                                    width: double.infinity,
                                                  ),
                                                ),
                                                RatingWidget(
                                                  state
                                                      .RecommededMovies[index]
                                                      .rating
                                                      .toString(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    onPageChanged: (value) {
                                      setState(() {
                                        currentMovie = value;
                                      });
                                    },
                                    itemCount: state.releasedMovies.length,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -30,
                            right: 10,
                            child: Image.asset(Appimages.WatchNow),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          CategoryList,
                          style: TextStyle(
                            color: AppColors.White,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "See More ->",
                          style: TextStyle(color: AppColors.MainColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 170,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context
                                  .read<MainMoviesCubit>()
                                  .getMovieDetial(
                                    state.RecommededMovies[index].id,
                                  )
                                  .then((onValue) {
                                    routeNavigator(
                                      Moviedetials(
                                        Data:
                                            context
                                                .read<MainMoviesCubit>()
                                                .DetialsResponse,
                                      ),
                                      context,
                                    );
                                  });
                            },
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: Image.network(
                                    state
                                        .RecommededMovies[index]
                                        .mediumCoverImage,
                                  ),
                                ),
                                RatingWidget(
                                  state.RecommededMovies[index].rating
                                      .toString(),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: 3,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is MainMoviesLoadingState ||
              state is RelesedMoviesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MainMoviesErrorstate ||
              state is RelesedMoviesErrorstate) {
            return Center(
              child: Text("Failed to load movies. Please try again."),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
