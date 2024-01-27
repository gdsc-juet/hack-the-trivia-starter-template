import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';

// ignore: must_be_immutable
class TopdoctorItemWidget extends StatelessWidget {
  const TopdoctorItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.v),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder11,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle959,
            height: 111.adaptSize,
            width: 111.adaptSize,
            radius: BorderRadius.circular(
              8.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 5.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. Marcus Horizon D",
                  style: CustomTextStyles.titleMedium18,
                ),
                SizedBox(height: 8.v),
                Text(
                  "Chardiologist",
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 8.v),
                Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgSignal,
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "4.7",
                        style: CustomTextStyles.labelLargeAmber500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 11.v),
                Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgLinkedin,
                      height: 13.adaptSize,
                      width: 13.adaptSize,
                      margin: EdgeInsets.only(bottom: 2.v),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.h),
                      child: Text(
                        "800m away",
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
