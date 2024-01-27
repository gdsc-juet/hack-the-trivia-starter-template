import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';
import 'package:healthon/widgets/custom_elevated_button.dart';
import 'package:healthon/widgets/custom_text_form_field.dart';

class ResetPasswordEmailPage extends StatefulWidget {
  const ResetPasswordEmailPage({Key? key}) : super(key: key);

  @override
  ResetPasswordEmailPageState createState() => ResetPasswordEmailPageState();
}

// ignore_for_file: must_be_immutable
class ResetPasswordEmailPageState extends State<ResetPasswordEmailPage>
    with AutomaticKeepAliveClientMixin<ResetPasswordEmailPage> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            decoration: AppDecoration.white,
                            child: Column(children: [
                              SizedBox(height: 24.v),
                              _buildEmailSection(context)
                            ])))))));
  }

  /// Section Widget
  Widget _buildEmailSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(children: [
          CustomTextFormField(
              controller: emailController,
              hintText: "xyz@gmail.com",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.emailAddress,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgIconEmail,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 56.v),
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 20.v, 24.h, 20.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgIconCheck,
                      height: 16.adaptSize,
                      width: 16.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 56.v)),
          SizedBox(height: 32.v),
          CustomElevatedButton(
              text: "Send OTP",
              onPressed: () {
                onTapSendOTP(context);
              })
        ]));
  }

  /// Navigates to the resetPasswordVerifyCodeScreen when the action is triggered.
  onTapSendOTP(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.resetPasswordVerifyCodeScreen);
  }
}
