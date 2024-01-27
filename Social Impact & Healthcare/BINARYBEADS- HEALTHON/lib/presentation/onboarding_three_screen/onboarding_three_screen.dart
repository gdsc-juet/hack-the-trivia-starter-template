import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';
import 'package:healthon/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingThreeScreen extends StatelessWidget {
  const OnboardingThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                      theme.colorScheme.secondaryContainer,
                      theme.colorScheme.onError
                    ])),
                child: SizedBox(
                    height: 768.v,
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      CustomImageView(
                          imagePath: ImageConstant.img7xm5,
                          height: 465.v,
                          width: 321.h,
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 47.v)),
                      _buildGetStartedSection(context)
                    ])))));
  }

  /// Section Widget
  Widget _buildGetStartedSection(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 41.h, vertical: 31.v),
            decoration: AppDecoration.white
                .copyWith(borderRadius: BorderRadiusStyle.customBorderTL64),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          width: 244.h,
                          margin: EdgeInsets.only(left: 3.h, right: 45.h),
                          child: Text("Get connect our Online Consultation",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleLarge!
                                  .copyWith(height: 1.50)))),
                  SizedBox(height: 10.v),
                  SizedBox(
                      height: 8.v,
                      child: AnimatedSmoothIndicator(
                          activeIndex: 0,
                          count: 3,
                          effect: ScrollingDotsEffect(
                              spacing: 4,
                              activeDotColor: theme.colorScheme.primary,
                              dotColor: appTheme.blue50,
                              dotHeight: 8.v,
                              dotWidth: 8.h))),
                  SizedBox(height: 54.v),
                  CustomElevatedButton(
                      text: "Get Started",
                      onPressed: () {
                        onTapGetStarted(context);
                      }),
                  SizedBox(height: 4.v)
                ])));
  }

  /// Navigates to the onboardingFourScreen when the action is triggered.
  onTapGetStarted(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.onboardingFourScreen);
  }
}
