import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';

// ignore: must_be_immutable
class ProfilelistsectionItemWidget extends StatelessWidget {
  const ProfilelistsectionItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 61.h,
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgTelevision,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
          SizedBox(height: 6.v),
          Text(
            "Heart rate",
            style: CustomTextStyles.labelMediumBlue50,
          ),
          SizedBox(height: 5.v),
          Text(
            "215bpm",
            style: CustomTextStyles.titleMediumWhiteA700,
          ),
        ],
      ),
    );
  }
}
