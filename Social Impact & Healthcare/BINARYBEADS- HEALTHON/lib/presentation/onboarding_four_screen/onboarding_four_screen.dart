import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';
import 'package:healthon/widgets/custom_elevated_button.dart';
import 'package:healthon/widgets/custom_outlined_button.dart';

class OnboardingFourScreen extends StatelessWidget {
  const OnboardingFourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 60.v),
                child: Column(children: [
                  Spacer(flex: 40),
                  _buildGetStartedSection(context),
                  Spacer(flex: 59),
                  CustomElevatedButton(
                      text: "Login",
                      onPressed: () {
                        onTapLogin(context);
                      }),
                  SizedBox(height: 16.v),
                  CustomOutlinedButton(
                      text: "Sign Up",
                      buttonStyle: CustomButtonStyles.outlinePrimary,
                      buttonTextStyle: CustomTextStyles.titleMediumPrimary,
                      onPressed: () {
                        onTapSignUp(context);
                      })
                ]))));
  }

  /// Section Widget
  Widget _buildGetStartedSection(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 41.h),
        child: Column(children: [
          CustomImageView(
              imagePath: ImageConstant.imgThumbsUp, height: 66.v, width: 59.h),
          SizedBox(height: 5.v),
          Text("Helthio", style: CustomTextStyles.headlineSmallPrimary),
          SizedBox(height: 38.v),
          Text("Let’s get started!", style: theme.textTheme.headlineSmall),
          SizedBox(height: 7.v),
          SizedBox(
              width: 244.h,
              child: Text(
                  "Login to enjoy the features we’ve provided, and stay healthy!",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleMediumGray600
                      .copyWith(height: 1.50)))
        ]));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }
}
