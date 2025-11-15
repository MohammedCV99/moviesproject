import 'package:flutter/material.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Features/Categories/CatogiresData.dart';

class Categoryselector extends StatelessWidget {
  const Categoryselector({
    super.key,
    required this.selectedCategoryId,
    required this.onChanged,
    required this.cat,
    required this.SelectedCat,
  });
  final int selectedCategoryId;
  final List<Categories> cat;
  final void Function(Categories) onChanged;
  final Categories SelectedCat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final bool isSelected = selectedCategoryId == cat[index].id;

          return FilterChip(
            label: Text(cat[index].Name),
            side: BorderSide(
              color: !isSelected ? AppColors.MainColor : Colors.grey,
              width: 1.5,
            ),
            showCheckmark: false,
            labelStyle: TextStyle(
              color: isSelected ? AppColors.Black : AppColors.MainColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: isSelected ? AppColors.MainColor : AppColors.Black,
            selectedColor: AppColors.MainColor,
            selected: isSelected,
            onSelected: (value) {
              if (value) {
                onChanged(cat[index]);
              }
              //   ;
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: cat.length,
      ),
    );
  }
}
