import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Core/Assets/AppImages.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/SearchTab/search_tab_cubit.dart';
import 'package:movies/Features/Movices/Persentation/ViewModel/SearchTab/search_tab_state.dart';

class MoviesSearch extends StatelessWidget {
  const MoviesSearch({super.key});

  @override
  Widget build(BuildContext context) {
 
    return  Scaffold(

    body: SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(16.r, 21.r, 16.r, 0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(
                color: Colors.white,fontSize: 16
              ),
              decoration:InputDecoration(
                hintStyle: TextStyle(
                color: Colors.white,fontSize: 16
              ),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff282A28),

                  )),
                focusColor:Color(0xff282A28),
                
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff282A28),

                  ),
                  borderRadius: BorderRadius.circular(16.r)
                ),
                hintText: 'Search',
      fillColor: Color(0xff282A28),
                prefixIcon: Image(image: AssetImage(Appimages.searchIcon))
              )
            ),
        BlocBuilder<SearchTabCubit,SearchTabState>(builder: (context,state){
          if (state is SearchTabInitState){
            Center(child: Image(image: AssetImage(Appimages.Search)));
          }else if (state is SearchTabLoadingState){
            Center(child: CircularProgressIndicator());
          }else if(state is SearchTabErrorState){
            Center(child: Text('No Result for ${state.error}'));
          }
            
          else if (state is SearchTabEmptyState){
            Center(child: Text('No Result for ${state.message}'));
          };}

        )
          ],
        ),
      ),
    ),
    );

  }
}