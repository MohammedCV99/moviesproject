import 'package:flutter/material.dart';
import 'package:movies/Core/Theme/AppTheme.dart';
import 'package:movies/MainLayer.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.DarkTheme,
      debugShowCheckedModeBanner: false,
      home: Mainlayer(),
    );
  }
}
