import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';

// ignore: must_be_immutable
class CategoriesItemWidget extends StatelessWidget {
  const CategoriesItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Column(
          children: [
            Container(
              height: 56.v,
              width: 64.h,
              padding: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 12.v,
              ),
              decoration: AppDecoration.fillOnErrorContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder8,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgIconAmbulance,
                height: 32.adaptSize,
                width: 32.adaptSize,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 9.v),
            Text(
              "Ambulance",
              style: theme.textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
