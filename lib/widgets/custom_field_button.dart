import 'package:flutter/material.dart';

import 'package:movies/Core/Assets/AppColors.dart';

class CustomFieldButton extends StatelessWidget {
  const CustomFieldButton({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.MainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {},
        child: child,
      ),
    );
  }
}
