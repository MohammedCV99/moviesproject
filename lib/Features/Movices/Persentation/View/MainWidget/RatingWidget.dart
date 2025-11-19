import 'package:flutter/material.dart';
import 'package:movies/Core/Assets/AppColors.dart';

Widget RatingWidget(String Rating) {
  return Positioned(
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
              Rating,
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
  );
}
