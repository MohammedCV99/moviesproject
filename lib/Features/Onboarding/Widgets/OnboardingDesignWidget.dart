import 'package:flutter/material.dart';
import 'package:movies/Core/Assets/AppColors.dart';

class Onboardingdesignwidget extends StatelessWidget {
  const Onboardingdesignwidget({
    super.key,
    required this.Background,
    required this.MainLabel,
    required this.SecondlyLabel,
    required this.nextlabel,
    required this.backlabel,
    required this.backflag,
    required this.nextTab,
    required this.BackTab,
  });
  final String Background;
  final String MainLabel;
  final String SecondlyLabel;
  final String nextlabel;
  final String backlabel;
  final bool backflag;
  final Function() nextTab;
  final Function() BackTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(Background, fit: BoxFit.cover)),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color: AppColors.Black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      MainLabel,
                      style: TextStyle(
                        color: AppColors.White,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      SecondlyLabel,
                      style: TextStyle(
                        color: AppColors.White,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.MainColor,
                      ),
                      child: InkWell(
                        onTap: nextTab,
                        child: Center(
                          child: Text(
                            nextlabel,
                            style: TextStyle(
                              color: AppColors.Black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  backflag
                      ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 10,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,

                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.MainColor),
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.Black,
                          ),

                          child: InkWell(
                            onTap: BackTab,
                            child: Center(
                              child: Text(
                                backlabel,
                                style: TextStyle(color: AppColors.MainColor),
                              ),
                            ),
                          ),
                        ),
                      )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
