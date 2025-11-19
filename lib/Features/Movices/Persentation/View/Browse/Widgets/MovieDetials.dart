import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Core/Assets/AppImages.dart';
import 'package:movies/Core/ServiceLocater/Movies/SuggestionServiceLocater.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesDetailsModel.dart';
import 'package:movies/Features/Movices/Persentation/View/Browse/Widgets/buildMovieList.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/SuggestionTab/SuggestionTabCubit.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/SuggestionTab/SuggestionTabState.dart';
import 'package:movies/Features/Profile/Persentation/Widgets/watchlist.dart';

class Moviedetials extends StatefulWidget {
  const Moviedetials({super.key, required this.Data});
  final MovieDetials Data;

  @override
  State<Moviedetials> createState() => _MoviedetialsState();
}

class _MoviedetialsState extends State<Moviedetials> {
  late SuggestionTabCubit movieCubit;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    movieCubit = Suggestionservicelocater.moviecubit;

    movieCubit.GetMoviesBySuggestionUsecases(widget.Data.id);

    WatchlistStorage.isSaved(widget.Data.id).then((v) {
      setState(() {
        isSaved = v;
      });
    });

    WatchlistStorage.addToHistory(widget.Data);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: movieCubit,
      child: BlocBuilder<SuggestionTabCubit, SuggestionTabState>(
        buildWhen:
            (previous, current) =>
                current is SuggestionTabSuccessState ||
                current is SuggestionTabInitState ||
                current is SuggestionTabErrorstate ||
                current is SuggestionTabLoadingState,
        builder: (context, state) {
          if (state is SuggestionTabSuccessState) {
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 600,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      widget.Data.largeCoverImage,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.Black.withValues(alpha: .2),
                                        AppColors.Black,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Center(
                                    child: Image.asset(Appimages.PlayLogo),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              child: IconButton(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: AppColors.White,
                                  size: 30,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              right: 10,
                              child: IconButton(
                                onPressed: () async {
                                  await WatchlistStorage.toggle(widget.Data);
                                  bool check = await WatchlistStorage.isSaved(
                                    widget.Data.id,
                                  );
                                  setState(() => isSaved = check);
                                },
                                icon: Icon(
                                  isSaved
                                      ? Icons.bookmark
                                      : Icons.bookmark_outline_outlined,
                                  color: AppColors.White,
                                  size: 30,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 60,
                              left: 0,
                              right: 0,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  widget.Data.title,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.White,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              left: 0,
                              right: 0,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  widget.Data.year.toString(),
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w100,
                                    color: AppColors.White,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () {},
                              child: Text("Watch"),
                            ),
                          ),
                        ),
                        (widget.Data.largeScreenshotImage1 != "" &&
                                widget.Data.largeScreenshotImage2 != "" &&
                                widget.Data.largeScreenshotImage3 != "")
                            ? MainTitle("Screen Shots")
                            : Container(),
                        if (widget.Data.largeScreenshotImage1 != "")
                          ScreenShot(widget.Data.largeScreenshotImage1),
                        if (widget.Data.largeScreenshotImage2 != "")
                          ScreenShot(widget.Data.largeScreenshotImage2),
                        if (widget.Data.largeScreenshotImage3 != "")
                          ScreenShot(widget.Data.largeScreenshotImage3),
                        if (widget.Data.descriptionFull != "")
                          MainTitle("Summary"),
                        if (widget.Data.descriptionFull != "")
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              widget.Data.descriptionFull,
                              style: TextStyle(color: AppColors.White),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: MainTitle("Similar")),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 450,
                      child: buildMoviesList(
                        state: state.sources,
                        lenght: state.sources.length,
                      ),
                    ),
                  ),
                  // Cast Section
                  if (widget.Data.cast.isNotEmpty)
                    SliverToBoxAdapter(child: MainTitle("Cast")),
                  if (widget.Data.cast.isNotEmpty)
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final cast = widget.Data.cast[index];
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.LightGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Text(
                                "Name: ${cast.name}",
                                style: TextStyle(color: AppColors.White),
                              ),
                              subtitle:
                                  cast.characterName != ""
                                      ? Text(
                                        "Character: ${cast.characterName}",
                                        style: TextStyle(
                                          color: AppColors.White,
                                        ),
                                      )
                                      : null,
                              leading:
                                  cast.urlSmallImage != ""
                                      ? Image.network(cast.urlSmallImage)
                                      : Image.network(
                                        "https://www.seekpng.com/png/detail/202-2024994_profile-icon-profile-logo-no-background.png",
                                      ),
                            ),
                          ),
                        );
                      }, childCount: widget.Data.cast.length),
                    ),
                  SliverToBoxAdapter(child: MainTitle("Genres")),
                  SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 75,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.LightGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              widget.Data.genres[index],
                              style: TextStyle(color: AppColors.White),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: widget.Data.genres.length,
                  ),
                ],
              ),
            );
          } else if (state is SuggestionTabLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SuggestionTabErrorstate) {
            return Center(
              child: Text(
                state.Error,
                style: TextStyle(color: AppColors.White),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget ScreenShot(String IMGpath) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(IMGpath),
      ),
    );
  }

  Widget MainTitle(String Title) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(Title, style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}
