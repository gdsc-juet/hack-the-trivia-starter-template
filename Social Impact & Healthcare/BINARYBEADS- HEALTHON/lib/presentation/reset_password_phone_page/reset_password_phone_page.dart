import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';
import 'package:healthon/widgets/custom_elevated_button.dart';
import 'package:healthon/widgets/custom_text_form_field.dart';

class ResetPasswordPhonePage extends StatefulWidget {
  const ResetPasswordPhonePage({Key? key}) : super(key: key);

  @override
  ResetPasswordPhonePageState createState() => ResetPasswordPhonePageState();
}

// ignore_for_file: must_be_immutable
class ResetPasswordPhonePageState extends State<ResetPasswordPhonePage>
    with AutomaticKeepAliveClientMixin<ResetPasswordPhonePage> {
  TextEditingController mobileNoController = TextEditingController();

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
                              _buildMobileNoSection(context)
                            ])))))));
  }

  /// Section Widget
  Widget _buildMobileNoSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(children: [
          CustomTextFormField(
              controller: mobileNoController,
              hintText: "1234567890",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.phone,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgIconCall,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 56.v),
              contentPadding:
                  EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v)),
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
