import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Core/HelperElements/Navigator.dart';
import 'package:movies/Core/HelperElements/ProfileAvaters.dart';
import 'package:movies/Core/HelperElements/TokenCache.dart';
import 'package:movies/Core/ServiceLocater/Profile/ProfileServiceLocater.dart';
import 'package:movies/Features/Auth/Persentation/View/LoginScreen.dart';
import 'package:movies/Features/Movices/Persentation/View/Browse/Widgets/MovieDetials.dart';
import 'package:movies/Features/Movices/Persentation/View/MainWidget/RatingWidget.dart';
import 'package:movies/Profile/Persentation/View/edit_profile.dart';
import 'package:movies/Profile/Persentation/View/Widgets/custom_button.dart';
import 'package:movies/Profile/Persentation/View/Widgets/watchlist.dart';
import 'package:movies/Profile/Persentation/ViewModel/ProfileCubit.dart';
import 'package:movies/Profile/Persentation/ViewModel/ProfileState.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesDetailsModel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.token});
  final String token;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedTab = 0;
  String name = "";
  String email = "";
  int avatarId = 1;
  List<MovieDetials> watchlist = [];
  List<MovieDetials> historylist = [];

  late Profilecubit profilecubit;

  @override
  void initState() {
    super.initState();
    profilecubit = Profileservicelocater.makeProfileCubit();
    profilecubit.GetProfile(widget.token);

    loadWatchlist();
    loadHistory();
  }

  Future<void> loadWatchlist() async {
    watchlist = await WatchlistStorage.load();
    setState(() {});
  }

  Future<void> loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList("history") ?? [];
    historylist =
        list.map((e) => MovieDetials.fromJson(jsonDecode(e))).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1B1B),
      body: BlocProvider.value(
        value: profilecubit,
        child: BlocBuilder<Profilecubit, Profilestate>(
          buildWhen:
              (previous, current) =>
                  current is ProfileinitState ||
                  current is GetProfileErrorState ||
                  current is GetProfileSuccessState ||
                  current is GetProfileLoadingState,
          builder: (context, state) {
            if (state is GetProfileSuccessState) {
              return SafeArea(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xff222222),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              avaters[state.response.data.avaterId - 1].IMGurl,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            state.response.data.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildCounter(
                                watchlist.length.toString(),
                                "Wish List",
                              ),
                              const SizedBox(width: 50),
                              _buildCounter(
                                historylist.length.toString(),
                                "History",
                              ),
                            ],
                          ),
                          const SizedBox(height: 22),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  text: "Edit Profile",
                                  bgColor: Colors.yellow,
                                  textColor: Colors.black,
                                  onTap: () {
                                    routeNavigator(
                                      BlocProvider(
                                        create:
                                            (_) =>
                                                Profileservicelocater.makeProfileCubit(),
                                        child: EditProfileScreen(
                                          token: widget.token,
                                          name: state.response.data.name,
                                          email: state.response.data.email,
                                        ),
                                      ),
                                      context,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: CustomButton(
                                  text: "Exit",
                                  bgColor: Colors.red,
                                  textColor: Colors.white,
                                  onTap: () async {
                                    Tokencache.SetToken("");
                                    routeNavigator(Login(), context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTabBar(),
                    Expanded(
                      child:
                          selectedTab == 0
                              ? _buildMoviesGrid(watchlist)
                              : _buildMoviesGrid(historylist),
                    ),
                  ],
                ),
              );
            } else if (state is GetProfileLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetProfileErrorState) {
              return Center(
                child: Text(
                  "There is an error !!",
                  style: TextStyle(color: AppColors.MainColor),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildCounter(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _tabItem("Watch List", Icons.folder, 0),
        const SizedBox(width: 30),
        _tabItem("History", Icons.folder_open, 1),
      ],
    );
  }

  Widget _tabItem(String text, IconData icon, int index) {
    bool active = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Column(
        children: [
          Icon(icon, size: 26, color: active ? Colors.yellow : Colors.white70),
          const SizedBox(height: 6),
          Text(
            text,
            style: TextStyle(
              color: active ? Colors.yellow : Colors.white70,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (active)
            Container(
              margin: const EdgeInsets.only(top: 6),
              height: 3,
              width: 80,
              color: AppColors.MainColor,
            ),
        ],
      ),
    );
  }

  Widget _buildMoviesGrid(List<MovieDetials> list) {
    if (list.isEmpty) {
      return Center(child: SizedBox(height: 130, child: Container()));
    }

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) {
        final movie = list[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Moviedetials(Data: movie)),
            );
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(movie.largeCoverImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              RatingWidget(movie.rating.toString()),
            ],
          ),
        );
      },
    );
  }
}
