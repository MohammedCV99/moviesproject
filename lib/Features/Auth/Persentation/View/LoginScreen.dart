import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Core/Assets/AppConst.dart';
import 'package:movies/Core/Assets/AppImages.dart';
import 'package:movies/Core/HelperElements/Navigator.dart';
import 'package:movies/Core/HelperElements/TokenCache.dart';
import 'package:movies/Features/Auth/Persentation/View/ResetpasswordScreen.dart';
import 'package:movies/Features/Auth/Persentation/View/SignupScreen.dart';
import 'package:movies/Features/Auth/Persentation/View/Widget/custom_field_button.dart';
import 'package:movies/Features/Auth/Persentation/View/Widget/text_field.dart';
import 'package:movies/Features/Auth/Persentation/ViewModel/AuthCubit.dart';
import 'package:movies/Features/Auth/Persentation/ViewModel/AuthState.dart';
import 'package:movies/Main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  SizedBox(height: 20),
                  Image.asset(Appimages.MainLogo, width: 121, height: 121),

                  SizedBox(height: 24),
                  CustomTextField(
                    hintText: Appconsts.Email, //TODO: Localize
                    prefixIcon: Icon(Icons.email, color: AppColors.White),
                    controller: Email,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'email is required'; //TODO: Localize
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 1),
                  CustomTextField(
                    hintText: Appconsts.password, //TODO: Localize
                    prefixIcon: Icon(Icons.lock, color: AppColors.White),
                    controller: Password,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'the password is required'; //TODO: Localize
                      } else if (value.length < 8) {
                        return 'the password is too weak'; //TODO: Localize
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          routeNavigator(ForgetPassword(), context);
                        },
                        child: Text(
                          Appconsts.ForgetPassword, //TODO: Localize
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

                  BlocListener<Authcubit, Authstate>(
                    listener: (context, state) {
                      if (state is AuthLoginLoading) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder:
                              (_) => Center(child: CircularProgressIndicator()),
                        );
                      } else if (state is AuthLoginError) {
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
                      } else if (state is AuthLoginSuccess) {
                        Fluttertoast.showToast(
                          msg: "Login !!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppColors.MainColor,
                          textColor: AppColors.LightBlack,
                          fontSize: 16.0,
                        );
                        print("TOKEN:###########" + state.response.data);
                        Tokencache.SetToken(state.response.data);
                        routeNavigator(Main(), context);
                      }
                    },
                    child: CustomFieldButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          context.read<Authcubit>().Login(
                            Email.text,
                            Password.text,
                          );
                        }
                      },
                      child: Text(
                        Appconsts.Login,
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
                      text: Appconsts.DontHaveAccount,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.White,
                      ),

                      children: [
                        TextSpan(
                          text: " " + Appconsts.CreateAccount,
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
                                  routeNavigator(Signup(), context);
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
                        child: Divider(
                          endIndent: 16,
                          color: AppColors.MainColor,
                        ),
                      ),
                    ],
                  ),
                  CustomFieldButton(
                    function: () {},
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
                    inactiveThumbImage: AssetImage(Appimages.arLogo),
                    activeThumbImage: AssetImage(Appimages.enLogo),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
