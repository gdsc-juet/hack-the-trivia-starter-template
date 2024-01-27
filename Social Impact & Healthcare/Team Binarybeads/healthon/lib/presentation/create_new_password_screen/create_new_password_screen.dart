import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';
import 'package:healthon/widgets/app_bar/appbar_leading_image.dart';
import 'package:healthon/widgets/app_bar/custom_app_bar.dart';
import 'package:healthon/widgets/custom_elevated_button.dart';
import 'package:healthon/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({Key? key}) : super(key: key);

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

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
                                horizontal: 24.h, vertical: 42.v),
                            child: Column(children: [
                              _buildTitle(context),
                              SizedBox(height: 24.v),
                              CustomTextFormField(
                                  controller: newpasswordController,
                                  hintText: "Enter new password",
                                  textInputType: TextInputType.visiblePassword,
                                  prefix: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          24.h, 16.v, 16.h, 16.v),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgLocation,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize)),
                                  prefixConstraints:
                                      BoxConstraints(maxHeight: 56.v),
                                  suffix: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          30.h, 16.v, 24.h, 16.v),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgEye,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize)),
                                  suffixConstraints:
                                      BoxConstraints(maxHeight: 56.v),
                                  obscureText: true),
                              SizedBox(height: 16.v),
                              CustomTextFormField(
                                  controller: confirmpasswordController,
                                  hintText: "Confirm password",
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  prefix: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          24.h, 16.v, 16.h, 16.v),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgLocation,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize)),
                                  prefixConstraints:
                                      BoxConstraints(maxHeight: 56.v),
                                  suffix: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          30.h, 16.v, 24.h, 16.v),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgEye,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize)),
                                  suffixConstraints:
                                      BoxConstraints(maxHeight: 56.v),
                                  obscureText: true),
                              SizedBox(height: 24.v),
                              CustomElevatedButton(
                                  text: "Create Password",
                                  onPressed: () {
                                    onTapCreatePassword(context);
                                  }),
                              SizedBox(height: 5.v)
                            ])))))));
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Create New Password", style: theme.textTheme.headlineSmall),
      SizedBox(height: 12.v),
      Text("Create your new password to login",
          style: CustomTextStyles.titleMediumGray500)
    ]);
  }

  onTapCreatePassword(BuildContext context) {
    // TODO: implement Actions
  }
}
