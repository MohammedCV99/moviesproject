import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Core/Assets/AppConst.dart';
import 'package:movies/Core/Assets/AppImages.dart';
import 'package:movies/Core/HelperElements/Navigator.dart';
import 'package:movies/Core/HelperElements/ProfileAvaters.dart';
import 'package:movies/Features/Auth/Persentation/View/LoginScreen.dart';
import 'package:movies/Features/Auth/Persentation/View/Widget/custom_field_button.dart';
import 'package:movies/Features/Auth/Persentation/View/Widget/text_field.dart';
import 'package:movies/Features/Auth/Persentation/ViewModel/AuthCubit.dart';
import 'package:movies/Features/Auth/Persentation/ViewModel/AuthState.dart';

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
  TextEditingController phonenumberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int AvaterID = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Black,
        elevation: 0,
        title: Text(
          'Register',
          style: TextStyle(color: AppColors.MainColor),
        ), //TODO: Localize
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: AppColors.MainColor),
        ),
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
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemBuilder: (context, index) {
                      return Image.asset(avaters[index].IMGurl);
                    },
                    itemCount: avaters.length,
                    onPageChanged: (value) {
                      setState(() {
                        AvaterID = value + 1;
                      });
                    },
                  ),
                ),
                Text(
                  Appconsts.PickAvatar,
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
                  hintText: Appconsts.Name, //TODO: Localize
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
                  obscureText: false,
                ),
                SizedBox(height: 1),
                CustomTextField(
                  controller: emailController,
                  hintText: Appconsts.Email, //TODO: Localize
                  prefixIcon: Icon(Icons.mail_rounded, color: AppColors.White),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email is required'; //TODO: Localize
                    }
                    return null;
                  },
                  obscureText: false,
                ),
                SizedBox(height: 1),
                CustomTextField(
                  controller: passwordController,
                  hintText: Appconsts.password, //TODO: Localize
                  prefixIcon: Icon(Icons.lock_rounded),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'the password is required'; //TODO: Localize
                    } else if (value.length < 8) {
                      return 'the password is too weak'; //TODO: Localize
                    }
                    return null;
                  },
                  obscureText: true,
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
                  obscureText: true,
                ),
                SizedBox(height: 1),
                CustomTextField(
                  controller: phonenumberController,
                  hintText: 'Phone Number', //TODO: Localize
                  prefixIcon: Icon(Icons.phone),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number is required'; //TODO: Localize
                    } else if (value.length < 6) {
                      return 'phone number should contains 6 digits'; //TODO: Localize
                    }
                    return null;
                  },
                  obscureText: false,
                ),
                SizedBox(height: 1),

                BlocListener<Authcubit, Authstate>(
                  listener: (context, state) {
                    if (state is AuthSignupLoading) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder:
                            (_) => Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is AuthSignupError) {
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                        msg: "Error Ocurred",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: AppColors.MainColor,
                        textColor: AppColors.LightBlack,
                        fontSize: 16.0,
                      );
                    } else if (state is AuthSignupSuccess) {
                      Fluttertoast.showToast(
                        msg: "Sign up !!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: AppColors.MainColor,
                        textColor: AppColors.LightBlack,
                        fontSize: 16.0,
                      );
                      routeNavigator(Login(), context);
                    }
                  },
                  child: CustomFieldButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        context.read<Authcubit>().Signup(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                          rePasswordController.text,
                          phonenumberController.text,
                          AvaterID,
                        );
                      }
                    },
                    child: Text(
                      Appconsts.CreateAccount,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.Black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3),
                Text.rich(
                  TextSpan(
                    text: Appconsts.AlreadyHaveAccount,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.White,
                    ),
                    children: [
                      TextSpan(
                        text: Appconsts.Login,
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
                  inactiveThumbImage: AssetImage(Appimages.arLogo),
                  activeThumbImage: AssetImage(Appimages.enLogo),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
