import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';
import 'package:healthon/widgets/app_bar/appbar_leading_image.dart';
import 'package:healthon/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:healthon/widgets/app_bar/custom_app_bar.dart';
import 'package:healthon/widgets/custom_checkbox_button.dart';
import 'package:healthon/widgets/custom_elevated_button.dart';
import 'package:healthon/widgets/custom_text_form_field.dart';
import 'package:healthon/presentation/sign_up_success_dialog/sign_up_success_dialog.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController nameEditTextController = TextEditingController();

  TextEditingController emailEditTextController = TextEditingController();

  TextEditingController passwordEditTextController = TextEditingController();

  bool agreeCheckBox = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.h, vertical: 39.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildNameEditText(context),
                                  SizedBox(height: 16.v),
                                  _buildEmailEditText(context),
                                  SizedBox(height: 16.v),
                                  _buildPasswordEditText(context),
                                  SizedBox(height: 16.v),
                                  _buildAgreeCheckBox(context),
                                  SizedBox(height: 28.v),
                                  _buildSignUpButton(context),
                                  SizedBox(height: 26.v),
                                  Padding(
                                      padding: EdgeInsets.only(left: 44.h),
                                      child: Row(children: [
                                        Text("Already have an account?",
                                            style: CustomTextStyles
                                                .bodyMediumGray600),
                                        GestureDetector(
                                            onTap: () {
                                              onTapTxtLogIn(context);
                                            },
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 4.h),
                                                child: Text("Log In",
                                                    style: CustomTextStyles
                                                        .titleSmallPrimarySemiBold)))
                                      ])),
                                  SizedBox(height: 5.v)
                                ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 56.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgIconChevronLeft,
            margin: EdgeInsets.only(left: 32.h, top: 8.v, bottom: 8.v)),
        centerTitle: true,
        title: AppbarSubtitleTwo(text: "Sign Up"));
  }

  /// Section Widget
  Widget _buildNameEditText(BuildContext context) {
    return CustomTextFormField(
        controller: nameEditTextController,
        hintText: "Enter your name",
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLock,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        contentPadding: EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v));
  }

  /// Section Widget
  Widget _buildEmailEditText(BuildContext context) {
    return CustomTextFormField(
        controller: emailEditTextController,
        hintText: "Enter your email",
        textInputType: TextInputType.emailAddress,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgCheckmark,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        contentPadding: EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v));
  }

  /// Section Widget
  Widget _buildPasswordEditText(BuildContext context) {
    return CustomTextFormField(
        controller: passwordEditTextController,
        hintText: "Enter your password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLocation,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 16.v, 24.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgEye,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        obscureText: true);
  }

  /// Section Widget
  Widget _buildAgreeCheckBox(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 28.h),
        child: CustomCheckboxButton(
            text:
                "I agree to the medidoc Terms of Service \nand Privacy Policy",
            isExpandedText: true,
            value: agreeCheckBox,
            onChange: (value) {
              agreeCheckBox = value;
            }));
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
        text: "Sign Up",
        onPressed: () {
          onTapSignUpButton(context);
        });
  }

  /// Displays a dialog with the [SignUpSuccessDialog] content.
  onTapSignUpButton(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: SignUpSuccessDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtLogIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
