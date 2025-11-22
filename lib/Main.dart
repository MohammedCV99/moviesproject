import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/ServiceLocater/Auth/AuthServicesLocator.dart';
import 'package:movies/Core/Theme/AppTheme.dart';
import 'package:movies/Features/Onboarding/Widgets/ExplorePage.dart';
import 'package:movies/Core/HelperElements/TokenCache.dart';
import 'package:movies/MainLayer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  String value = "";
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    print("INITSTATE CALLED");

    Tokencache.GetToken()
        .then((onValue) {
          print("TOKEN LOADED: $onValue");
          setState(() {
            value = onValue;
            isloading = false;
          });
        })
        .catchError((e) {
          print("ERROR LOADING TOKEN: $e");
          setState(() => isloading = false);
        });
  }

  @override
  Widget build(BuildContext context) {
    if (isloading) {
      return MaterialApp(
        theme: AppTheme.DarkTheme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return BlocProvider(
      create: (_) => Authserviceslocator.authcubit,
      child: MaterialApp(
        theme: AppTheme.DarkTheme,
        debugShowCheckedModeBanner: false,

        home: value.isNotEmpty ? Mainlayer(Token: value) : Explorepage(),
      ),
    );
  }
}
