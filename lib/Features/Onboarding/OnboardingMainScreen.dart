import 'package:flutter/material.dart';
import 'package:movies/Core/Assets/AppConst.dart' show Appconsts;
import 'package:movies/Core/HelperElements/Navigator.dart';
import 'package:movies/Features/Onboarding/Data/OnboardingData.dart';
import 'package:movies/Features/Onboarding/Widgets/OnboardingDesignWidget.dart';
import 'package:movies/MainLayer.dart';

class Onboardingmainscreen extends StatefulWidget {
  const Onboardingmainscreen({super.key});

  @override
  State<Onboardingmainscreen> createState() => _OnboardingmainscreenState();
}

class _OnboardingmainscreenState extends State<Onboardingmainscreen> {
  @override
  int PageNumber = 0;
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        return Onboardingdesignwidget(
          Background: OnBoardinginformations[PageNumber].URLImage,
          MainLabel: OnBoardinginformations[PageNumber].Title,
          SecondlyLabel: OnBoardinginformations[PageNumber].Subtitle,
          nextlabel: PageNumber != 4 ? Appconsts.Next : Appconsts.Finish,
          backlabel: Appconsts.Back,
          backflag: PageNumber == 0 ? false : true,

          nextTab: () {
            if (PageNumber == 4) {
              routeNavigator(Mainlayer(), context);
            } else {
              setState(() {
                PageNumber++;
              });
            }
          },
          BackTab: () {
            setState(() {
              PageNumber--;
            });
          },
        );
      },
      onPageChanged: (value) {
        setState(() {
          PageNumber = value;
        });
      },
      itemCount: 5,
    );
  }
}
