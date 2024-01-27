import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';
import 'package:healthon/widgets/app_bar/appbar_leading_image.dart';
import 'package:healthon/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:healthon/widgets/app_bar/appbar_trailing_image.dart';
import 'package:healthon/widgets/app_bar/custom_app_bar.dart';
import 'package:healthon/widgets/custom_elevated_button.dart';
import 'package:healthon/widgets/custom_icon_button.dart';
import 'package:healthon/widgets/custom_rating_bar.dart';
import 'package:readmore/readmore.dart';

class DrugsDetailScreen extends StatelessWidget {
  const DrugsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 60.v),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgHealthvitLLys163x163,
                      height: 163.adaptSize,
                      width: 163.adaptSize,
                      radius: BorderRadius.circular(81.h)),
                  SizedBox(height: 53.v),
                  _buildProductInfo(context),
                  SizedBox(height: 39.v),
                  _buildDescription(context),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildAddToCart(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 41.v,
        leadingWidth: 56.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgIconChevronLeft,
            margin: EdgeInsets.only(left: 32.h, top: 8.v, bottom: 9.v)),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "Details"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgCart,
              margin: EdgeInsets.fromLTRB(24.h, 9.v, 24.h, 8.v))
        ]);
  }

  /// Section Widget
  Widget _buildProductInfo(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
            padding: EdgeInsets.only(bottom: 1.v),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("OBH Combi", style: CustomTextStyles.titleLargeSemiBold),
              SizedBox(height: 11.v),
              Text("75ml", style: CustomTextStyles.titleMediumGray500_1)
            ])),
        CustomImageView(
            imagePath: ImageConstant.imgFavorite,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(top: 33.v))
      ]),
      SizedBox(height: 11.v),
      Row(children: [
        Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: CustomRatingBar(initialRating: 0)),
        Padding(
            padding: EdgeInsets.only(left: 5.h),
            child: Text("4.0", style: CustomTextStyles.titleSmallAmber500))
      ]),
      SizedBox(height: 28.v),
      Row(children: [
        CustomImageView(
            imagePath: ImageConstant.imgSettingsGray500,
            height: 32.adaptSize,
            width: 32.adaptSize,
            margin: EdgeInsets.only(bottom: 1.v)),
        Padding(
            padding: EdgeInsets.only(left: 23.h, top: 2.v, bottom: 1.v),
            child: Text("1", style: CustomTextStyles.headlineSmallSemiBold)),
        Padding(
            padding: EdgeInsets.only(left: 28.h, bottom: 1.v),
            child: CustomIconButton(
                height: 32.adaptSize,
                width: 32.adaptSize,
                padding: EdgeInsets.all(8.h),
                child: CustomImageView(
                    imagePath: ImageConstant.imgCloseWhiteA700))),
        Spacer(),
        Padding(
            padding: EdgeInsets.only(top: 4.v),
            child: Text("9.99", style: CustomTextStyles.headlineSmallSemiBold))
      ])
    ]);
  }

  /// Section Widget
  Widget _buildDescription(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Description", style: theme.textTheme.titleMedium),
      SizedBox(height: 9.v),
      SizedBox(
          width: 327.h,
          child: ReadMoreText(
              "OBH COMBI  is a cough medicine containing, Paracetamol, Ephedrine HCl, and Chlorphenamine maleate which is used to relieve coughs accompanied by flu symptoms such as fever, headache, and sneezing... ",
              trimLines: 4,
              colorClickableText: theme.colorScheme.primary,
              trimMode: TrimMode.Line,
              trimCollapsedText: "Read more",
              moreStyle:
                  CustomTextStyles.labelLargeBluegray400.copyWith(height: 1.50),
              lessStyle: CustomTextStyles.labelLargeBluegray400
                  .copyWith(height: 1.50)))
    ]);
  }

  /// Section Widget
  Widget _buildAddToCart(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 28.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 50.adaptSize,
              width: 50.adaptSize,
              padding: EdgeInsets.all(13.h),
              decoration: IconButtonStyleHelper.fillOnErrorContainer,
              onTap: () {
                onTapBtnCart(context);
              },
              child: CustomImageView(imagePath: ImageConstant.imgCartPrimary)),
          Expanded(
              child: CustomElevatedButton(
                  height: 50.v,
                  text: "Add to Cart",
                  margin: EdgeInsets.only(left: 16.h),
                  buttonTextStyle: CustomTextStyles.titleSmallWhiteA700SemiBold,
                  onPressed: () {
                    onTapAddToCart(context);
                  }))
        ]));
  }

  /// Navigates to the myCartScreen when the action is triggered.
  onTapBtnCart(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myCartScreen);
  }

  /// Navigates to the myCartScreen when the action is triggered.
  onTapAddToCart(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myCartScreen);
  }
}
