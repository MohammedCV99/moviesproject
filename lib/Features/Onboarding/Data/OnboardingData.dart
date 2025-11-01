import 'package:movies/Core/Assets/AppConst.dart';
import 'package:movies/Core/Assets/AppImages.dart';

class Onboardingdata {
  final String URLImage;
  final String Title;
  final String Subtitle;

  Onboardingdata({
    required this.URLImage,
    required this.Title,
    required this.Subtitle,
  });
}

List<Onboardingdata> OnBoardinginformations = [
  Onboardingdata(
    URLImage: Appimages.MoviesPoster1,
    Title: Appconsts.OnBoarding1Title,
    Subtitle: Appconsts.OnBoarding1SubTitle,
  ),
  Onboardingdata(
    URLImage: Appimages.MoviesPoster2,
    Title: Appconsts.OnBoarding2Title,
    Subtitle: Appconsts.OnBoarding2SubTitle,
  ),
  Onboardingdata(
    URLImage: Appimages.MoviesPoster3,
    Title: Appconsts.OnBoarding3Title,
    Subtitle: Appconsts.OnBoarding3SubTitle,
  ),
  Onboardingdata(
    URLImage: Appimages.MoviesPoster4,
    Title: Appconsts.OnBoarding4Title,
    Subtitle: Appconsts.OnBoarding4SubTitle,
  ),
  Onboardingdata(
    URLImage: Appimages.MoviesPoster5,
    Title: Appconsts.OnBoarding5Title,
    Subtitle: Appconsts.OnBoarding5SubTitle,
  ),
  Onboardingdata(
    URLImage: Appimages.MoviesPoster6,
    Title: Appconsts.OnBoarding6Title,
    Subtitle: "",
  ),
];
