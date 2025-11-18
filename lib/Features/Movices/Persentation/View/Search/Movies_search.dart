import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/Assets/AppImages.dart';
import 'package:movies/Core/HelperElements/Navigator.dart';
import 'package:movies/Core/ServiceLocater/Movies/MainMoviesServiceLocater.dart';
import 'package:movies/Features/Movices/Data/Data_Sources/search_data_sources/search_movies_api.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Persentation/View/Browse/Widgets/MovieDetials.dart';
import 'package:movies/Features/Movices/Persentation/View/MainWidget/RatingWidget.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/Main/MainBrowseCubit.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/SearchTab/search_tab_cubit.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/SearchTab/search_tab_state.dart';

class MoviesSearch extends StatelessWidget {
  const MoviesSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchTabCubit(SearchMoviesApi()),
      child: Builder(
        builder: (context) {
              final cubit = context.read<SearchTabCubit>();
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsetsGeometry.fromLTRB(16.r, 21.r, 16.r, 0),
                child: Column(
                  children: [
                    TextField(
                      controller: cubit.searchController,
                      onSubmitted: (value) {
                        cubit.searchMovie();
                      },
                      showCursor: false,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff282A28)),borderRadius: BorderRadius.circular(16.r),
                        ),
                        focusColor: Color(0xff282A28),
                          
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16.r)
                        ),
                        hintText: 'Search',
                        fillColor: Color(0xff282A28),
                        prefixIcon: Image(image: AssetImage(Appimages.searchIcon)),
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<SearchTabCubit, SearchTabState>(
                        builder: (context, state) {
                          if (state is SearchTabInitState) {
                            return Center(
                              child: SizedBox(width: 124.w,height: 124.h,child: Image(image: AssetImage(Appimages.Search))),
                            );
                          } else if (state is SearchTabLoadingState) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is SearchTabErrorState) {
                            return Center(child: Text('Error! ${state.error}'));
                          } else if (state is SearchTabEmptyState) {
                            return Center(
                              child: Text('No Result found for  ${state.message}',style: TextStyle(color: Colors.white),),
                            );
                          } else if (state is SearchTabSuccessState) {
                            final List<Movie> movies = state.sources;
                            return Expanded(
                              child: GridView.builder(
                                itemCount: movies.length,
                                itemBuilder: (context, index) {
                                  final currentMovie = movies[index];
                                  return InkWell(
                                    onTap: () {
                                      BrowseServicelocater.moviecubit
                                          
                                          .getMovieDetial(currentMovie.id)
                                          .then((onValue) {
                                            routeNavigator(
                                              Moviedetials(
                                                Data:
                                                    BrowseServicelocater.moviecubit
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
                                            currentMovie.mediumCoverImage,
                            
                                            fit: BoxFit.fill,
                                            width: 190,
                                            height: 280,
                                          ),
                                        ),
                                        RatingWidget(currentMovie.rating.toString()),
                                      ],
                                    ),
                                  );
                                },
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 8,
                                ),
                              ),
                            );
                            
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
