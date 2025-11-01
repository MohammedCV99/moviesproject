import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Core/Assets/networkAssets.dart';
import 'package:movies/Features/Movices/Data/Models/MoviesModel.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Main()));
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  // At the beginning, we fetch the first 20 posts
  int _page = 1;
  int x = 2371;
  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This holds the posts fetched from the server
  List<Movie> _posts = [];

  final dio = Dio();
  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final res = await dio.get(
        "${AppNetwork.MoviesURL}${AppNetwork.ListAllMovies(_page)}",
      );
      setState(() {
        final data = res.data['data']['movies'] as List;
        _posts =
            data.map<Movie>((movieJson) {
              return Movie.fromJson(movieJson);
            }).toList();
        print(res.statusCode);
      });
    } catch (err) {
      if (kDebugMode) {
        print(err.toString());
      }
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        final res = await dio.get(
          "${AppNetwork.MoviesURL}${AppNetwork.ListAllMovies(_page)}",
        );

        final List<Movie> fetchedPosts = res.data['data']['movies'];
        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _posts.addAll(fetchedPosts);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        print(err.toString());
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // The controller for the ListView
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Black,
      body:
          _isFirstLoadRunning
              ? const Center(child: const CircularProgressIndicator())
              : Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      controller: _controller,
                      itemCount: _posts.length,
                      itemBuilder:
                          (_, index) => Card(
                            margin: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 10,
                            ),
                            child: Text(_posts[index].title),
                          ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    ),
                  ),

                  // when the _loadMore function is running
                  if (_isLoadMoreRunning == true)
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 40),
                      child: Center(child: CircularProgressIndicator()),
                    ),

                  // When nothing else to load
                  if (_hasNextPage == false)
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 40),
                      color: Colors.amber,
                      child: const Center(
                        child: Text('You have fetched all of the content'),
                      ),
                    ),
                ],
              ),
    );
  }
}
