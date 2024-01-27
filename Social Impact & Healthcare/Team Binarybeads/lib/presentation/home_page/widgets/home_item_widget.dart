import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';

// ignore: must_be_immutable
class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 82.v,
              width: 105.h,
              margin: EdgeInsets.only(right: 1.h),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse88,
                    height: 71.adaptSize,
                    width: 71.adaptSize,
                    radius: BorderRadius.circular(
                      35.h,
                    ),
                    alignment: Alignment.bottomLeft,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
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
                            style: CustomTextStyles.labelLargeAmber500SemiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 18.v),
          Text(
            "Dr. Marcus Horizon",
            style: CustomTextStyles.titleMediumErrorContainer,
          ),
          SizedBox(height: 9.v),
          Text(
            "Chardiologist",
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 5.v),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgLinkedin,
                height: 16.adaptSize,
                width: 16.adaptSize,
                margin: EdgeInsets.only(bottom: 4.v),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.h,
                  top: 3.v,
                ),
                child: Text(
                  "800m away",
                  style: theme.textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
