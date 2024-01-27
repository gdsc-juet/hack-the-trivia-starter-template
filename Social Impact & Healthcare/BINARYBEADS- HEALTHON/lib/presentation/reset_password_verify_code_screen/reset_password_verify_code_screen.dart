import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';
import 'package:healthon/widgets/app_bar/appbar_leading_image.dart';
import 'package:healthon/widgets/app_bar/custom_app_bar.dart';
import 'package:healthon/widgets/custom_elevated_button.dart';
import 'package:healthon/widgets/custom_pin_code_text_field.dart';

class ResetPasswordVerifyCodeScreen extends StatelessWidget {
  const ResetPasswordVerifyCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 42.v),
                child: Column(children: [
                  _buildTitle(context),
                  SizedBox(height: 29.v),
                  Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: CustomPinCodeTextField(
                          context: context, onChanged: (value) {})),
                  SizedBox(height: 40.v),
                  CustomElevatedButton(
                      text: "Verify",
                      onPressed: () {
                        onTapVerify(context);
                      }),
                  SizedBox(height: 25.v),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Didn’t receive the code?",
                        style: CustomTextStyles.bodyMediumGray600),
                    Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text("Resend",
                            style: CustomTextStyles.titleSmallPrimarySemiBold))
                  ]),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgIconChevronLeftOnprimary,
            margin: EdgeInsets.fromLTRB(32.h, 8.v, 319.h, 8.v)));
  }

  /// Section Widget
  Widget _buildTitle(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Enter Verification Code", style: theme.textTheme.headlineSmall),
          SizedBox(height: 10.v),
          Container(
              width: 273.h,
              margin: EdgeInsets.only(right: 54.h),
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Enter code that we have sent to your number ",
                        style: CustomTextStyles.titleMediumff90979e),
                    TextSpan(
                        text: "08528188*** ",
                        style: CustomTextStyles.titleMediumff0b0c0c)
                  ]),
                  textAlign: TextAlign.left))
        ]));
  }

  /// Navigates to the createNewPasswordScreen when the action is triggered.
  onTapVerify(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.createNewPasswordScreen);
  }
}
