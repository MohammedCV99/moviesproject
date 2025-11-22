import 'package:flutter/material.dart';
import 'package:movies/Core/Assets/AppColors.dart';
import 'package:movies/Core/HelperElements/ProfileAvaters.dart';
import 'package:movies/Features/Auth/Persentation/View/Widget/text_field.dart';
import 'package:movies/Features/Onboarding/OnboardingMainScreen.dart';
import 'package:movies/Profile/Persentation/View/UserProfile.dart';
import 'package:movies/Profile/Persentation/Widgets/custom_button.dart';

import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: "John Doe",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "JohnDoe@gamil.com",
  );
  int selectedAvatarId = 1;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString("name") ?? "John Safwat";
      _emailController.text = prefs.getString("email") ?? "john@example.com";
      selectedAvatarId = prefs.getInt("avatarId") ?? 1;
    });
  }

  Future<void> _saveProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", _nameController.text);
    await prefs.setString("email", _emailController.text);
    await prefs.setInt("avatarId", selectedAvatarId);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ProfileScreen()),
    );
  }

  Future<void> _deleteAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    setState(() {
      _nameController.text = "John Safwat";
      _emailController.text = "john@example.com";
      selectedAvatarId = 1;
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Account Deleted")));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Onboardingmainscreen()),
    );
  }

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
                            .firstWhere((a) => a.ID == selectedAvatarId)
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
                Center(
                  child: SizedBox(
                    width: 400,
                    height: 56,
                    child: CustomButton(
                      text: "Delete Account",
                      bgColor: AppColors.Red,
                      textColor: AppColors.White,
                      onTap: _deleteAccount,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          Positioned(
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
                onTap: _saveProfile,
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
