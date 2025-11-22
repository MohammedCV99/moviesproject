import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Core/HelperElements/Navigator.dart';
import 'package:movies/Core/HelperElements/ProfileAvaters.dart';
import 'package:movies/Core/HelperElements/TokenCache.dart';
import 'package:movies/Features/Auth/Persentation/View/LoginScreen.dart';
import 'package:movies/Features/Auth/Persentation/View/Widget/text_field.dart';
import 'package:movies/MainLayer.dart';
import 'package:movies/Profile/Persentation/View/UserProfile.dart';
import 'package:movies/Profile/Persentation/View/Widgets/custom_button.dart';
import 'package:movies/Profile/Persentation/ViewModel/ProfileCubit.dart';
import 'package:movies/Profile/Persentation/ViewModel/ProfileState.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
    required this.token,
    required this.name,
    required this.email,
  });
  final String token;
  final String name;
  final String email;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
  }

  int selectedAvatarId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1B1B),
      appBar: AppBar(
        backgroundColor: const Color(0xff1B1B1B),
        iconTheme: IconThemeData(color: AppColors.MainColor),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.MainColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: _showAvatarBottomSheet,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: AppColors.MainColor,
                      backgroundImage: AssetImage(
                        avaters
                            .firstWhere(
                              (avatar) => avatar.ID == selectedAvatarId,
                            )
                            .IMGurl,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hintText: "Name",
                  controller: _nameController,
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: "Email",
                  controller: _emailController,
                  obscureText: false,
                ),
                const SizedBox(height: 300),
                BlocListener<Profilecubit, Profilestate>(
                  listener: (context, state) {
                    if (state is deleteProfileLoadingState) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder:
                            (_) => Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is deleteProfileErrorState) {
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
                    } else if (state is deleteProfileSuccessState) {
                      Fluttertoast.showToast(
                        msg: "profile Deleted Successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: AppColors.MainColor,
                        textColor: AppColors.LightBlack,
                        fontSize: 16.0,
                      );
                      Tokencache.SetToken("");
                      routeNavigator(Login(), context);
                    }
                  },
                  child: Center(
                    child: SizedBox(
                      width: 400,
                      height: 56,
                      child: CustomButton(
                        text: "Delete Account",
                        bgColor: AppColors.Red,
                        textColor: AppColors.White,
                        onTap: () {
                          context.read<Profilecubit>().deleteProfile(
                            widget.token,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          BlocListener<Profilecubit, Profilestate>(
            listener: (context, state) {
              if (state is updateProfileLoadingState) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => Center(child: CircularProgressIndicator()),
                );
              } else if (state is updateProfileErrorState) {
                Fluttertoast.showToast(
                  msg: "Error Ocurred",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppColors.MainColor,
                  textColor: AppColors.LightBlack,
                  fontSize: 16.0,
                );
              } else if (state is updateProfileSuccessState) {
                Fluttertoast.showToast(
                  msg: "profile update Successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppColors.MainColor,
                  textColor: AppColors.LightBlack,
                  fontSize: 16.0,
                );
                routeNavigator(Mainlayer(Token: widget.token), context);
              }
            },
            child: Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: SizedBox(
                width: 400,
                height: 56,
                child: CustomButton(
                  text: "Update Data",
                  bgColor: AppColors.MainColor,
                  textColor: AppColors.Black,
                  onTap: () {
                    context.read<Profilecubit>().updateProfile(
                      widget.token,
                      _emailController.text,
                      selectedAvatarId,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAvatarBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xff1B1B1B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: avaters.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final avatar = avaters[index];
              bool isSelected = avatar.ID == selectedAvatarId;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAvatarId = avatar.ID;
                  });
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor:
                      isSelected ? AppColors.MainColor : Colors.grey[800],
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(avatar.IMGurl),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
