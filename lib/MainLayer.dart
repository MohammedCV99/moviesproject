import 'package:flutter/material.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Features/Movices/Persentation/View/Browse/MoviesBrowse.dart';
import 'package:movies/Features/Movices/Persentation/View/Home/MoviesHome.dart';
import 'package:movies/Features/Movices/Persentation/View/Search/Movies_search.dart';

class Mainlayer extends StatefulWidget {
  const Mainlayer({super.key});

  @override
  State<Mainlayer> createState() => _MainlayerState();
}

class _MainlayerState extends State<Mainlayer> {
  @override
  List<Widget> page = [
    Movieshome(),
    MoviesSearch(),
    MoviesBrowse(),
    Container(color: AppColors.White),
  ];
  int currantIndent = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currantIndent],
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
