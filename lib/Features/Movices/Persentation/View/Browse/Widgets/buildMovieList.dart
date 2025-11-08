import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Core/HelperElements/Navigator.dart';
import 'package:movies/Core/ServiceLocater/Movies/BrowseServiceLocater.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';
import 'package:movies/Features/Movices/Persentation/View/Browse/Widgets/MovieDetials.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/BrowseTab/BrowseTabCubit.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/BrowseTab/BrowseTabState.dart';

class buildMoviesList extends StatefulWidget {
  const buildMoviesList({super.key, required this.state, required this.lenght});
  final List<Movie> state;
  final int lenght;
  @override
  State<buildMoviesList> createState() => _buildMoviesListState();
}

class _buildMoviesListState extends State<buildMoviesList> {
  @override
  late BrowseTabCubit movieCubit;

  @override
  void initState() {
    super.initState();
    movieCubit = BrowseServicelocater.moviecubit;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: movieCubit,
      child: BlocBuilder<BrowseTabCubit, BrowseTabState>(
        buildWhen:
            (previous, current) =>
                current is DetialsErrorstate ||
                current is DetialsInitState ||
                current is DetialsLoadingState ||
                current is DetialsSuccessState ||
                current is BrowseTabSuccessState,
        builder: (context, state) {
          return Expanded(
            child: GridView.builder(
              itemCount: widget.lenght,
              itemBuilder: (context, index) {
                final movie = widget.state[index];
                return InkWell(
                  onTap: () {
                    context
                        .read<BrowseTabCubit>()
                        .getMovieDetial(widget.state[index].id)
                        .then((onValue) {
                          routeNavigator(
                            Moviedetials(
                              Data:
                                  context
                                      .read<BrowseTabCubit>()
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
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.LightBlack,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 55,

                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Text(
                                  movie.rating.toString(),
                                  style: TextStyle(
                                    color: AppColors.White,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.star, color: Colors.yellow),
                              ],
                            ),
                          ),
                        ),
                      ),
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
