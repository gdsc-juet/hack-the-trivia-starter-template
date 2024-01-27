import 'dart:async';


import 'package:flutter/material.dart';

import 'package:healthon/core/app_export.dart';

import 'package:healthon/presentation/onboarding_one_screen/onboarding_one_screen.dart';


class SplashScreen extends StatelessWidget {

  const SplashScreen({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {

    // Add a delay of 2 seconds before navigating to OnboardingScreen1

    Future.delayed(Duration(seconds: 2), () {

      Navigator.pushReplacement(

        context,

        MaterialPageRoute(builder: (context) => OnboardingOneScreen()),

      );

    });


    return SafeArea(

      child: Scaffold(

        backgroundColor: theme.colorScheme.primary,

        body: SizedBox(

          width: double.maxFinite,

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              CustomImageView(

                imagePath: ImageConstant.imgVector,

                height: 130.v,

                width: 117.h,

              ),

              SizedBox(height: 15.v),

              Text(

                "HEALTHON",

                style: theme.textTheme.displayMedium,

              ),

              SizedBox(height: 5.v),

            ],

          ),

        ),

      ),

    );

  }

}

