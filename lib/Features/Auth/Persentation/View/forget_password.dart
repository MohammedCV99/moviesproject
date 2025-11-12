import 'package:flutter/material.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/widgets/custom_field_button.dart';
import 'package:movies/widgets/text_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  static const String routeName = '/forget_password';

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

TextEditingController emailController = TextEditingController();

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forget Password',
          style: TextStyle(color: AppColors.MainColor),
        ), //TODO: Localize
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Image.asset(
                  "Assets/images/Forgot_password_img.png",
                  height: screenHeight * 0.3,
                  width: screenWidth * 0.8,
                  fit: BoxFit.contain,
                ),

                // SizedBox(height: screenHeight * 0.05),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Email', //TODO: Localize
                  prefixIcon: Icon(Icons.mail_rounded, color: AppColors.White),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email is required'; //TODO: Localize
                    }
                    return null;
                  },
                ),
                SizedBox(height: 7),
                CustomFieldButton(
                  child: Text(
                    'verify email',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.Black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
