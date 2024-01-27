import '../my_cart_screen/widgets/drugslist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';
import 'package:healthon/widgets/app_bar/appbar_leading_image.dart';
import 'package:healthon/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:healthon/widgets/app_bar/custom_app_bar.dart';
import 'package:healthon/widgets/custom_elevated_button.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 21.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDrugsList(context),
                      SizedBox(height: 34.v),
                      _buildPaymentDetail(context),
                      SizedBox(height: 19.v),
                      Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Text("Payment Method",
                              style: theme.textTheme.titleMedium)),
                      SizedBox(height: 10.v),
                      Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: _buildPaymentMethod(context,
                              visaText: "VISA", changeText: "Change")),
                      SizedBox(height: 5.v)
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
        title: AppbarSubtitleOne(text: "My Cart"));
  }

  /// Section Widget
  Widget _buildDrugsList(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 20.v);
            },
            itemCount: 2,
            itemBuilder: (context, index) {
              return DrugslistItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildPaymentDetail(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Payment Detail", style: theme.textTheme.titleMedium),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 4.h),
          child: _buildTotalPayment(context,
              totalText: "Subtotal", priceText: "25.98")),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child: _buildPaymentMethod(context,
              visaText: "Taxes", changeText: "1.00")),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 4.h),
          child: _buildTotalPayment(context,
              totalText: "Total", priceText: "26.98")),
      SizedBox(height: 13.v),
      Divider()
    ]);
  }

  /// Section Widget
  Widget _buildCheckout(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 26.v),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 5.v, bottom: 1.v),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total", style: theme.textTheme.titleSmall),
                    Padding(
                        padding: EdgeInsets.only(top: 3.v),
                        child: Text(" 26.98",
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
  Widget _buildTotalPayment(
    BuildContext context, {
    required String totalText,
    required String priceText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(totalText,
          style: CustomTextStyles.titleSmallOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary)),
      Text(priceText,
          style: CustomTextStyles.titleSmallOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary))
    ]);
  }

  /// Common widget
  Widget _buildPaymentMethod(
    BuildContext context, {
    required String visaText,
    required String changeText,
  }) {
    return Container(
        padding: EdgeInsets.all(13.h),
        decoration: AppDecoration.outlineGray300
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder11),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 8.h),
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

  onTapCheckout(BuildContext context) {
    // TODO: implement Actions
  }
}
