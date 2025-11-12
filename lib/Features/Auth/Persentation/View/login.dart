import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/gen/assets.gen.dart';
import 'package:movies/widgets/custom_field_button.dart';
import 'package:movies/widgets/text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Assets.assets.images.mainLogo.image(width: 121, height: 121),

                SizedBox(height: 24),
                CustomTextField(
                  hintText: 'Email', //TODO: Localize
                  prefixIcon: Icon(Icons.email, color: AppColors.White),
                ),
                SizedBox(height: 1),
                CustomTextField(
                  hintText: 'Password', //TODO: Localize
                  prefixIcon: Icon(Icons.lock, color: AppColors.White),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/forget_password');
                      },
                      child: Text(
                        'Forget Password?', //TODO: Localize
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,

                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: AppColors.MainColor,
                          decorationColor: AppColors.MainColor,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomFieldButton(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.Black,
                    ),
                  ),
                ),
                SizedBox(height: 3),
                Text.rich(
                  TextSpan(
                    text: 'Don’t Have Account ? ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.White,
                    ),
                    children: [
                      TextSpan(
                        text: 'Create Account',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.MainColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.MainColor,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamed('/signup');
                              },
                      ),
                    ],
                  ),
                ),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: Divider(indent: 16, color: AppColors.MainColor),
                    ),
                    Text(
                      "or",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.MainColor,
                      ),
                    ),
                    Expanded(
                      child: Divider(endIndent: 16, color: AppColors.MainColor),
                    ),
                  ],
                ),
                CustomFieldButton(
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.g_mobiledata_sharp,
                        color: AppColors.Black,
                        size: 50,
                      ),
                      Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.Black,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: false,
                  onChanged: (value) {},
                  inactiveThumbImage: AssetImage(
                    Assets.assets.images.arLogo.path,
                  ),
                  activeThumbImage: AssetImage(
                    Assets.assets.images.enLogo.path,
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
