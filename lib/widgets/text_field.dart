import 'package:movies/Core/Assets/AppColors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.validator,
    this.prefixIcon,
    this.hintColor,
    this.borderColor,
    this.controller,
  });
  final String? hintText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Color? hintColor;
  final Color? borderColor;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.White,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.White,
        ),
        prefixIcon:
            prefixIcon == null
                ? null
                : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: prefixIcon,
                ),
        border: _getBorder(borderColor ?? AppColors.White),
        errorBorder: _getBorder(AppColors.Red),
        enabledBorder: _getBorder(borderColor ?? AppColors.White),
        focusedBorder: _getBorder(borderColor ?? AppColors.White),
      ),
    );
  }
}

_getBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: color),
  );
}
