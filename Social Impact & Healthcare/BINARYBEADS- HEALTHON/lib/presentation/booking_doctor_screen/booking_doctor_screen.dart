import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';
import 'package:healthon/widgets/app_bar/appbar_leading_image.dart';
import 'package:healthon/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:healthon/widgets/app_bar/custom_app_bar.dart';
import 'package:healthon/widgets/custom_elevated_button.dart';
import 'package:healthon/widgets/custom_icon_button.dart';

class BookingDoctorScreen extends StatelessWidget {
  const BookingDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 28.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDoctorInformation(context),
                      SizedBox(height: 38.v),
                      _buildAdminFee(context,
                          adminFeeText: "Date", priceText: "Change"),
                      SizedBox(height: 7.v),
                      Padding(
                          padding: EdgeInsets.only(right: 41.h),
                          child: Row(children: [
                            CustomIconButton(
                                height: 36.adaptSize,
                                width: 36.adaptSize,
                                padding: EdgeInsets.all(8.h),
                                decoration: IconButtonStyleHelper
                                    .fillOnErrorContainerTL18,
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgCalendar)),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 15.h, top: 12.v, bottom: 6.v),
                                child: Text(
                                    "Wednesday, Jun 23, 2021 | 10:00 AM",
                                    style:
                                        CustomTextStyles.titleSmallBluegray700))
                          ])),
                      SizedBox(height: 15.v),
                      Divider(),
                      SizedBox(height: 17.v),
                      _buildReason(context),
                      SizedBox(height: 15.v),
                      Divider(),
                      SizedBox(height: 19.v),
                      Text("Payment Detail",
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 11.v),
                      _buildTotal(context,
                          totalText: "Consultation", priceText: "60.00"),
                      SizedBox(height: 11.v),
                      _buildAdminFee(context,
                          adminFeeText: "Admin Fee", priceText: "01.00"),
                      SizedBox(height: 11.v),
                      _buildAdminFee(context,
                          adminFeeText: "Aditional Discount", priceText: "-"),
                      SizedBox(height: 12.v),
                      _buildTotal(context,
                          totalText: "Total", priceText: "61.00"),
                      SizedBox(height: 13.v),
                      Divider(endIndent: 8.h),
                      SizedBox(height: 20.v),
                      Text("Payment Method",
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 10.v),
                      _buildCard(context,
                          visaText: "VISA", changeText: "Change")
                    ])),
            bottomNavigationBar: _buildCheckout(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 42.v,
        leadingWidth: 56.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgIconChevronLeft,
            margin: EdgeInsets.only(left: 32.h, top: 8.v, bottom: 10.v)),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "Appointment"));
  }

  /// Section Widget
  Widget _buildDoctorInformation(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 41.h),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgRectangle959,
              height: 111.adaptSize,
              width: 111.adaptSize,
              radius: BorderRadius.circular(8.h)),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 7.v, bottom: 5.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr. Marcus Horizon",
                        style: CustomTextStyles.titleMedium18),
                    SizedBox(height: 8.v),
                    Text("Chardiologist", style: theme.textTheme.labelLarge),
                    SizedBox(height: 8.v),
                    Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgSignal,
                          height: 16.adaptSize,
                          width: 16.adaptSize),
                      Padding(
                          padding: EdgeInsets.only(left: 4.h),
                          child: Text("4.7",
                              style: CustomTextStyles.labelLargeAmber500))
                    ]),
                    SizedBox(height: 11.v),
                    Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLinkedin,
                          height: 13.adaptSize,
                          width: 13.adaptSize,
                          margin: EdgeInsets.only(bottom: 2.v)),
                      Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Text("800m away",
                              style: theme.textTheme.labelLarge))
                    ])
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildReason(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _buildCard(context, visaText: "Reason", changeText: "Change"),
      SizedBox(height: 7.v),
      Row(children: [
        CustomIconButton(
            height: 36.adaptSize,
            width: 36.adaptSize,
            padding: EdgeInsets.all(8.h),
            decoration: IconButtonStyleHelper.fillOnErrorContainerTL18,
            child: CustomImageView(imagePath: ImageConstant.imgUserPrimary)),
        Padding(
            padding: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 6.v),
            child:
                Text("Chest pain", style: CustomTextStyles.titleSmallOnPrimary))
      ])
    ]);
  }

  /// Section Widget
  Widget _buildCheckout(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 24.h, bottom: 26.v),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 5.v, bottom: 2.v),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total", style: theme.textTheme.titleSmall),
                    Padding(
                        padding: EdgeInsets.only(top: 3.v),
                        child: Text(" 61.00",
                            style: CustomTextStyles.titleMedium18))
                  ])),
          CustomElevatedButton(
              height: 50.v,
              width: 192.h,
              text: "Checkout",
              buttonTextStyle: CustomTextStyles.titleSmallWhiteA700SemiBold,
              onPressed: () {
                onTapCheckout(context);
              })
        ]));
  }

  /// Common widget
  Widget _buildAdminFee(
    BuildContext context, {
    required String adminFeeText,
    required String priceText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(adminFeeText,
          style: CustomTextStyles.bodyMediumGray500
              .copyWith(color: appTheme.gray500)),
      Text(priceText,
          style: CustomTextStyles.bodyMediumOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary))
    ]);
  }

  /// Common widget
  Widget _buildTotal(
    BuildContext context, {
    required String totalText,
    required String priceText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(totalText,
          style: CustomTextStyles.titleSmallOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary)),
      Text(priceText,
          style: CustomTextStyles.titleSmallPrimarySemiBold
              .copyWith(color: theme.colorScheme.primary))
    ]);
  }

  /// Common widget
  Widget _buildCard(
    BuildContext context, {
    required String visaText,
    required String changeText,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 13.v),
        decoration: AppDecoration.outlineGray300
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder11),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text(visaText,
                      style: CustomTextStyles.titleMediumInterPrimaryContainer
                          .copyWith(
                              color: theme.colorScheme.primaryContainer))),
              Padding(
                  padding: EdgeInsets.only(top: 4.v),
                  child: Text(changeText,
                      style: CustomTextStyles.labelLargePrimary_1
                          .copyWith(color: theme.colorScheme.primary)))
            ]));
  }

  /// Navigates to the chatWithDoctorScreen when the action is triggered.
  onTapCheckout(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.chatWithDoctorScreen);
  }
}
