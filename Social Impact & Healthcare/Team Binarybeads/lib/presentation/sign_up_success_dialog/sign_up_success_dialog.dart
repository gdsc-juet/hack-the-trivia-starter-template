import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';
import 'package:healthon/widgets/custom_elevated_button.dart';

class SignUpSuccessDialog extends StatelessWidget {
  const SignUpSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 327.h,
        padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 36.v),
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder24),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 26.v),
          Container(
              height: 102.adaptSize,
              width: 102.adaptSize,
              padding: EdgeInsets.symmetric(horizontal: 29.h, vertical: 34.v),
              decoration: AppDecoration.fillBlue
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder51),
              child: CustomImageView(
                  imagePath: ImageConstant.imgCheckmarkPrimary,
                  height: 31.v,
                  width: 41.h,
                  radius: BorderRadius.circular(3.h),
                  alignment: Alignment.center)),
          SizedBox(height: 43.v),
          Text("Success", style: theme.textTheme.titleLarge),
          SizedBox(height: 6.v),
          SizedBox(
              width: 172.h,
              child: Text("Your account has been \nsuccessfully registered",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyLargeBluegray400
                      .copyWith(height: 1.50))),
          SizedBox(height: 21.v),
          CustomElevatedButton(text: "Go to Home")
        ]));
  }
}
