import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/HelperElements/Navigator.dart';
import 'package:movies/Core/ServiceLocater/Movies/MainMoviesServiceLocater.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Persentation/View/Browse/Widgets/MovieDetials.dart';
import 'package:movies/Features/Movices/Persentation/View/MainWidget/RatingWidget.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/Main/MainBrowseCubit.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/Main/MainBrowseState.dart';

class buildMoviesList extends StatefulWidget {
  const buildMoviesList({super.key, required this.state, required this.lenght});
  final List<Movie> state;
  final int lenght;
  @override
  State<buildMoviesList> createState() => _buildMoviesListState();
}

class _buildMoviesListState extends State<buildMoviesList> {
  @override
  late MainMoviesCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = BrowseServicelocater.moviecubit;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: movieCubit,
      child: BlocBuilder<MainMoviesCubit, MainMoviesState>(
        buildWhen:
            (previous, current) =>
                current is DetialsErrorstate ||
                current is DetialsInitState ||
                current is DetialsLoadingState ||
                current is DetialsSuccessState ||
                current is MainMoviesSuccessState,
        builder: (context, state) {
          return Expanded(
            child: GridView.builder(
              itemCount: widget.lenght,
              itemBuilder: (context, index) {
                final movie = widget.state[index];
                return InkWell(
                  onTap: () {
                    context
                        .read<MainMoviesCubit>()
                        .getMovieDetial(widget.state[index].id)
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
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          movie.mediumCoverImage,

                          fit: BoxFit.fill,
                          width: 190,
                          height: 280,
                        ),
                      ),
                      RatingWidget(movie.rating.toString()),
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
        },
      ),
    );
  }
}
