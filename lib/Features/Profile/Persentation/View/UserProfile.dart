import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Core/HelperElements/ProfileAvaters.dart';
import 'package:movies/Features/Movices/Persentation/View/Browse/Widgets/MovieDetials.dart';
import 'package:movies/Features/Movices/Persentation/View/MainWidget/RatingWidget.dart';
import 'package:movies/Features/Profile/Persentation/View/edit_profile.dart';
import 'package:movies/Features/Profile/Persentation/Widgets/custom_button.dart';
import 'package:movies/Features/Profile/Persentation/Widgets/watchlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesDetailsModel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
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

  @override
  void initState() {
    super.initState();
    loadProfile();
    loadWatchlist();
    loadHistory();
  }

  Future<void> loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name") ?? "John Safwat";
      email = prefs.getString("email") ?? "john@example.com";
      avatarId = prefs.getInt("avatarId") ?? 1;
    });
  }

  Future<void> loadWatchlist() async {
    watchlist = await WatchlistStorage.load();
    setState(() {});
  }

  Future<void> loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList("history") ?? [];
    historylist = list.map((e) => MovieDetials.fromJson(jsonDecode(e))).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1B1B),
      body: SafeArea(
        child: Column(
          children: [
            _buildProfileCard(),
            const SizedBox(height: 20),
            _buildTabBar(),
            Expanded(
              child: selectedTab == 0
                  ? _buildMoviesGrid(watchlist)
                  : _buildMoviesGrid(historylist),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
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
              avaters.firstWhere((a) => a.ID == avatarId).IMGurl,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCounter(watchlist.length.toString(), "Wish List"),
              const SizedBox(width: 50),
              _buildCounter(historylist.length.toString(), "History"),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const EditProfileScreen()),
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
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.clear();
                    Navigator.pushReplacementNamed(context, "/login");
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCounter(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
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
            )
        ],
      ),
    );
  }

  Widget _buildMoviesGrid(List<MovieDetials> list) {
    if (list.isEmpty) {
      return Center(
        child: SizedBox(
          height: 130,
          child: Image.asset("Assets/images/Empty 1.png"),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.62),
      itemBuilder: (context, index) {
        final movie = list[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Moviedetials(Data: movie),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(movie.largeCoverImage),
                      fit: BoxFit.cover),
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
