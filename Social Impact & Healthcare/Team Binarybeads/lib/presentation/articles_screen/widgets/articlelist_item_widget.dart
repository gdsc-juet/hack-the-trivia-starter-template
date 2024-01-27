import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';

// ignore: must_be_immutable
class ArticlelistItemWidget extends StatelessWidget {
  const ArticlelistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 154.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.all(7.h),
          decoration: AppDecoration.outlineGray3001.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 1.v),
              SizedBox(
                height: 87.v,
                width: 138.h,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle460,
                      height: 87.v,
                      width: 138.h,
                      radius: BorderRadius.circular(
                        8.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgBookmark,
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(
                        top: 5.v,
                        right: 7.h,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.v),
              Container(
                width: 49.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 3.h,
                  vertical: 1.v,
                ),
                decoration: AppDecoration.background.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder3,
                ),
                child: Text(
                  "Covid-19",
                  style: CustomTextStyles.labelMediumPrimary,
                ),
              ),
              SizedBox(height: 6.v),
              SizedBox(
                width: 102.h,
                child: Text(
                  "Comparing the AstraZeneca and Sinovac COVID-19 Vaccines",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.labelLargeOnPrimary.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jun 12, 2021",
                    style: theme.textTheme.labelMedium,
                  ),
                  Container(
                    height: 2.adaptSize,
                    width: 2.adaptSize,
                    margin: EdgeInsets.only(
                      left: 2.h,
                      top: 3.v,
                      bottom: 6.v,
                    ),
                    decoration: BoxDecoration(
                      color: appTheme.gray500,
                      borderRadius: BorderRadius.circular(
                        1.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: Text(
                      "6 min read",
                      style: CustomTextStyles.labelMediumPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
