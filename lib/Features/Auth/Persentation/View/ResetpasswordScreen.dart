import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Core/Assets/AppImages.dart';
import 'package:movies/Features/Auth/Persentation/View/Widget/custom_field_button.dart';
import 'package:movies/Features/Auth/Persentation/View/Widget/text_field.dart';
import 'package:movies/Features/Auth/Persentation/ViewModel/AuthCubit.dart';
import 'package:movies/Features/Auth/Persentation/ViewModel/AuthState.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  static const String routeName = '/forget_password';

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController Email = TextEditingController();
  TextEditingController OldPassword = TextEditingController();
  TextEditingController NewPassword = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool Flag = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Black,
        elevation: 0,
        title: Text(
          'Reset Password',
          style: TextStyle(color: AppColors.MainColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: AppColors.MainColor),
        ),
      ),
      body:
          !Flag
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        SizedBox(height: screenHeight * 0.05),
                        Image.asset(
                          Appimages.Forgetpassword,
                          height: screenHeight * 0.3,
                          width: screenWidth * 0.8,
                          fit: BoxFit.contain,
                        ),

                        // SizedBox(height: screenHeight * 0.05),
                        CustomTextField(
                          controller: Email,
                          hintText: 'Email', //TODO: Localize

                          prefixIcon: Icon(
                            Icons.mail_rounded,
                            color: AppColors.White,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'email is required'; //TODO: Localize
                            }
                            return null;
                          },
                          obscureText: false,
                        ),
                        SizedBox(height: 7),
                        CustomFieldButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                Flag = !Flag;
                              });
                            }
                          },
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
              )
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        SizedBox(height: screenHeight * 0.05),
                        Image.asset(
                          Appimages.Forgetpassword,
                          height: screenHeight * 0.3,
                          width: screenWidth * 0.8,
                          fit: BoxFit.contain,
                        ),

                        // SizedBox(height: screenHeight * 0.05),
                        CustomTextField(
                          controller: OldPassword,
                          hintText: 'Old Password', //TODO: Localize

                          prefixIcon: Icon(
                            Icons.password,
                            color: AppColors.White,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required'; //TODO: Localize
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: 1),
                        CustomTextField(
                          controller: NewPassword,
                          hintText: 'New Password', //TODO: Localize

                          prefixIcon: Icon(
                            Icons.password,
                            color: AppColors.White,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required'; //TODO: Localize
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: 7),
                        BlocListener<Authcubit, Authstate>(
                          listener: (context, state) {
                            if (state is AuthForgetpasswordLoading) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder:
                                    (_) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                              );
                            } else if (state is AuthForgetpasswordError) {
                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                msg: "there is an issue !",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: AppColors.MainColor,
                                textColor: AppColors.LightBlack,
                                fontSize: 16.0,
                              );
                            } else if (state is AuthForgetpasswordSuccess) {
                              Fluttertoast.showToast(
                                msg: "Changing password is done succsfully !!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: AppColors.MainColor,
                                textColor: AppColors.LightBlack,
                                fontSize: 16.0,
                              );
                              Navigator.of(context).pop();
                            }
                          },
                          child: CustomFieldButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                context.read<Authcubit>().ResetPassword(
                                  Email.text,
                                  OldPassword.text,
                                  NewPassword.text,
                                );
                              }
                            },

                            child: Text(
                              'Change Password',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppColors.Black,
                              ),
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
