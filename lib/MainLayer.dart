import 'package:flutter/material.dart';
import 'package:movies/Features/Movices/Persentation/View/Browse/MoviesBrowse.dart';
import 'package:movies/Features/Movices/Persentation/View/Home/MoviesHome.dart';
import 'package:movies/Features/Movices/Persentation/View/Search/MoviesSearch.dart';
import 'package:movies/Profile/Persentation/View/UserProfile.dart';

class Mainlayer extends StatefulWidget {
  final String Token;
  const Mainlayer({super.key, required this.Token});

  @override
  State<Mainlayer> createState() => _MainlayerState();
}

class _MainlayerState extends State<Mainlayer> {
  @override
  late List<Widget> pages;
  int currantIndent = 0;
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      Movieshome(),
      MoviesSearch(),
      MoviesBrowse(),
      ProfileScreen(token: widget.Token),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currantIndent],
      bottomNavigationBar: BottomNavigationBar(
        onTap:
            (value) => setState(() {
              currantIndent = value;
            }),
        currentIndex: currantIndent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
        ],
      ),
    );
  }
}
