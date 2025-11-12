import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/gen/assets.gen.dart';
import 'package:movies/widgets/custom_field_button.dart';
import 'package:movies/widgets/text_field.dart';
// import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  static const String routeName = '/signup';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(color: AppColors.MainColor),
        ), //TODO: Localize
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 94,
                      height: 94,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('Assets/images/Avater1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('Assets/images/Avater2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('Assets/images/Avater3.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Avatar',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: AppColors.White,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 24),
                CustomTextField(
                  controller: nameController,
                  hintText: 'Name', //TODO: Localize
                  prefixIcon: Icon(
                    Icons.contact_mail_outlined,
                    color: AppColors.White,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'your name is required'; //TODO: Localize
                    }
                    return null;
                  },
                ),
                SizedBox(height: 1),
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
                SizedBox(height: 1),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Password', //TODO: Localize
                  prefixIcon: Icon(Icons.lock_rounded),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'the password is required'; //TODO: Localize
                    } else if (value.length < 8) {
                      return 'the password is too weak'; //TODO: Localize
                    }
                    return null;
                  },
                ),
                SizedBox(height: 1),
                CustomTextField(
                  controller: rePasswordController,
                  hintText: 'Re Password', //TODO: Localize
                  prefixIcon: Icon(Icons.lock_rounded),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'the password is required'; //TODO: Localize
                    } else if (value != passwordController.text) {
                      return 'the password must be same'; //TODO: Localize
                    }
                    return null;
                  },
                ),
                SizedBox(height: 1),
                CustomFieldButton(
                  child: Text(
                    'Create Account',
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
                    text: 'Already Have Account ? ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.White,
                    ),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.MainColor,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pop();
                              },
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
