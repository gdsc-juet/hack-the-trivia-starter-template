import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';

// ignore: must_be_immutable
class MessagehistoryItemWidget extends StatelessWidget {
  const MessagehistoryItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgClose40x40,
          height: 50.adaptSize,
          width: 50.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 15.h,
            top: 7.v,
            bottom: 4.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr. Marcus Horizon",
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 4.v),
              Text(
                "I don,t have any fever, but headchace...",
                style: CustomTextStyles.bodySmallBluegray400,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 28.h,
            top: 11.v,
            bottom: 7.v,
          ),
          child: Column(
            children: [
              Text(
                "10.24",
                style: CustomTextStyles.bodySmallBluegray700,
              ),
              SizedBox(height: 3.v),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 13.adaptSize,
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.h,
                    vertical: 1.v,
                  ),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder8,
                  ),
                  child: Text(
                    "1",
                    style: CustomTextStyles.labelSmallInterWhiteA700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
